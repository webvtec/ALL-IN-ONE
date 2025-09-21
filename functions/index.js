const functions = require('firebase-functions');
const admin = require('firebase-admin');
const nodemailer = require('nodemailer');
const axios = require('axios');

admin.initializeApp();
const db = admin.firestore();

// Email transporter setup
const transporter = nodemailer.createTransporter({
  service: 'gmail',
  auth: {
    user: functions.config().gmail.email,
    pass: functions.config().gmail.password
  }
});

// PayPal configuration
const PAYPAL_BASE_URL = 'https://api-m.sandbox.paypal.com'; // Change for production

// Get PayPal access token
async function getPayPalAccessToken() {
  const auth = Buffer.from(
    `${functions.config().paypal.client_id}:${functions.config().paypal.client_secret}`
  ).toString('base64');

  const response = await axios.post(`${PAYPAL_BASE_URL}/v1/oauth2/token`, 
    'grant_type=client_credentials',
    {
      headers: {
        'Authorization': `Basic ${auth}`,
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    }
  );

  return response.data.access_token;
}

// 1. EMAIL NOTIFICATION TRIGGER
exports.sendEmailNotification = functions.firestore
  .document('emailTriggers/{triggerId}')
  .onCreate(async (snap, context) => {
    const data = snap.data();
    
    try {
      let emailOptions = {};
      
      switch(data.type) {
        case 'order_confirmation':
          emailOptions = {
            to: data.buyerEmail,
            subject: `Order Confirmation #${data.orderNumber}`,
            html: generateOrderConfirmationEmail(data)
          };
          break;
          
        case 'seller_new_order':
          emailOptions = {
            to: data.sellerEmail,
            subject: `New Order #${data.orderNumber}`,
            html: generateNewOrderEmail(data)
          };
          break;
          
        case 'status_update':
          emailOptions = {
            to: data.buyerEmail,
            subject: `Order Update #${data.orderNumber}`,
            html: generateStatusUpdateEmail(data)
          };
          break;
          
        case 'subscription_reminder':
          emailOptions = {
            to: data.sellerEmail,
            subject: 'Subscription Renewal Reminder',
            html: generateSubscriptionReminderEmail(data)
          };
          break;
          
        case 'earnings_notification':
          emailOptions = {
            to: data.to,
            subject: `Payment Received - Order #${data.orderNumber}`,
            html: generateEarningsNotificationEmail(data)
          };
          break;
      }
      
      await transporter.sendMail({
        from: `"WEB VTEC" <${functions.config().gmail.email}>`,
        ...emailOptions
      });
      
      // Mark as sent
      await snap.ref.update({
        sent: true,
        sentAt: admin.firestore.FieldValue.serverTimestamp()
      });
      
    } catch (error) {
      console.error('Email sending failed:', error);
      await snap.ref.update({
        failed: true,
        error: error.message,
        failedAt: admin.firestore.FieldValue.serverTimestamp()
      });
    }
  });

// 2. AUTOMATIC PAYMENT SPLITTING
exports.processPaymentSplitting = functions.firestore
  .document('orders/{orderId}')
  .onUpdate(async (change, context) => {
    const before = change.before.data();
    const after = change.after.data();
    
    // Only process if order status changed to 'paid'
    if (before.status !== 'paid' && after.status === 'paid') {
      const orderId = context.params.orderId;
      
      try {
        await splitPaymentToSellers(after, orderId);
      } catch (error) {
        console.error('Payment splitting failed:', error);
        // Update order with error status
        await change.after.ref.update({
          paymentSplittingError: error.message,
          paymentSplittingFailedAt: admin.firestore.FieldValue.serverTimestamp()
        });
      }
    }
  });

// Payment splitting function
async function splitPaymentToSellers(orderData, orderId) {
  const platformFeeRate = 0.05; // 5%
  const paypalFeeRate = 0.029; // 2.9%
  
  for (const [sellerId, sellerData] of Object.entries(orderData.sellers)) {
    const grossAmount = sellerData.subtotal;
    const platformFee = grossAmount * platformFeeRate;
    const paypalFee = grossAmount * paypalFeeRate;
    const netAmount = grossAmount - platformFee - paypalFee;
    
    // Update seller balance
    const sellerRef = db.collection('sellers').doc(sellerId);
    
    await db.runTransaction(async (transaction) => {
      const sellerDoc = await transaction.get(sellerRef);
      
      if (sellerDoc.exists) {
        const seller = sellerDoc.data();
        const newBalance = (seller.availableBalance || 0) + netAmount;
        
        transaction.update(sellerRef, {
          availableBalance: newBalance,
          totalSales: (seller.totalSales || 0) + grossAmount,
          salesHistory: admin.firestore.FieldValue.arrayUnion({
            orderId: orderId,
            orderNumber: sellerData.orderNumber,
            grossAmount: grossAmount,
            platformFee: platformFee,
            paypalFee: paypalFee,
            netAmount: netAmount,
            date: admin.firestore.FieldValue.serverTimestamp(),
            status: 'completed'
          })
        });
        
        // Send earnings notification email
        await db.collection('emailTriggers').add({
          type: 'earnings_notification',
          to: seller.email,
          sellerName: seller.businessName,
          orderNumber: sellerData.orderNumber,
          earnings: netAmount,
          grossAmount: grossAmount,
          platformFee: platformFee,
          timestamp: admin.firestore.FieldValue.serverTimestamp()
        });
      }
    });
  }
}

// 3. MONTHLY SUBSCRIPTION BILLING
exports.processMonthlyBilling = functions.pubsub
  .schedule('0 9 * * *') // Run daily at 9 AM
  .onRun(async (context) => {
    const today = new Date();
    const todayStr = today.toISOString().split('T')[0];
    
    // Find sellers whose subscriptions expire today
    const expiringSellers = await db.collection('sellers')
      .where('subscriptionEnd', '<=', today)
      .where('subscriptionStatus', '==', 'active')
      .get();
    
    const promises = expiringSellers.docs.map(async (doc) => {
      const seller = doc.data();
      
      try {
        if (seller.autoRenew) {
          await renewSubscription(doc.id, seller);
        } else {
          await suspendSubscription(doc.id, seller);
        }
      } catch (error) {
        console.error(`Failed to process billing for seller ${doc.id}:`, error);
      }
    });
    
    await Promise.all(promises);
  });

// Renew subscription function
async function renewSubscription(sellerId, seller) {
  try {
    // Here you would charge the seller's PayPal account
    // For now, we'll simulate successful payment
    
    const nextMonth = new Date();
    nextMonth.setMonth(nextMonth.getMonth() + 1);
    
    await db.collection('sellers').doc(sellerId).update({
      subscriptionEnd: nextMonth.toISOString(),
      lastPayment: {
        amount: seller.monthlyFee,
        amountUSD: seller.monthlyFeeUSD,
        paymentDate: admin.firestore.FieldValue.serverTimestamp(),
        status: 'completed'
      },
      subscriptionHistory: admin.firestore.FieldValue.arrayUnion({
        amount: seller.monthlyFee,
        amountUSD: seller.monthlyFeeUSD,
        paymentDate: admin.firestore.FieldValue.serverTimestamp(),
        period: `${new Date().toISOString()} to ${nextMonth.toISOString()}`,
        status: 'completed'
      })
    });
    
    // Send renewal confirmation email
    await db.collection('emailTriggers').add({
      type: 'subscription_renewed',
      sellerEmail: seller.email,
      sellerName: seller.businessName,
      amount: seller.monthlyFee,
      nextBilling: nextMonth.toISOString()
    });
    
  } catch (error) {
    await handleFailedPayment(sellerId, seller, error);
  }
}

// Suspend subscription function
async function suspendSubscription(sellerId, seller) {
  await db.collection('sellers').doc(sellerId).update({
    subscriptionStatus: 'suspended',
    suspendedAt: admin.firestore.FieldValue.serverTimestamp()
  });
  
  // Send suspension notice
  await db.collection('emailTriggers').add({
    type: 'subscription_suspended',
    sellerEmail: seller.email,
    sellerName: seller.businessName
  });
}

// Handle failed payment
async function handleFailedPayment(sellerId, seller, error) {
  await db.collection('sellers').doc(sellerId).update({
    subscriptionStatus: 'payment_failed',
    lastFailedPayment: {
      error: error.message,
      failedAt: admin.firestore.FieldValue.serverTimestamp()
    }
  });
  
  // Send payment failure notice
  await db.collection('emailTriggers').add({
    type: 'payment_failed',
    sellerEmail: seller.email,
    sellerName: seller.businessName,
    error: error.message
  });
}

// 4. INVENTORY MANAGEMENT
exports.updateInventory = functions.firestore
  .document('orders/{orderId}')
  .onUpdate(async (change, context) => {
    const before = change.before.data();
    const after = change.after.data();
    
    // Only process if order status changed to 'paid'
    if (before.status !== 'paid' && after.status === 'paid') {
      // Update inventory for all products in the order
      const batch = db.batch();
      
      for (const [sellerId, sellerData] of Object.entries(after.sellers)) {
        for (const item of sellerData.items) {
          const productRef = db.collection('products').doc(item.productId);
          
          // Decrease stock if stock tracking is enabled
          batch.update(productRef, {
            stock: admin.firestore.FieldValue.increment(-item.quantity)
          });
        }
      }
      
      await batch.commit();
    }
  });

// 5. SELLER PAYOUT PROCESSING
exports.processSellerPayouts = functions.https.onCall(async (data, context) => {
  // Verify seller authentication
  if (!context.auth) {
    throw new functions.https.HttpsError('unauthenticated', 'Must be authenticated');
  }
  
  const sellerId = context.auth.uid;
  const { amount } = data;
  
  if (!amount || amount < 20) {
    throw new functions.https.HttpsError('invalid-argument', 'Minimum payout is $20');
  }
  
  try {
    const sellerDoc = await db.collection('sellers').doc(sellerId).get();
    const seller = sellerDoc.data();
    
    if (!seller || seller.availableBalance < amount) {
      throw new functions.https.HttpsError('invalid-argument', 'Insufficient balance');
    }
    
    // Process PayPal payout
    const accessToken = await getPayPalAccessToken();
    
    const payoutData = {
      sender_batch_header: {
        sender_batch_id: `payout_${sellerId}_${Date.now()}`,
        email_subject: "Payment from WEB VTEC"
      },
      items: [{
        recipient_type: "EMAIL",
        amount: {
          value: amount.toString(),
          currency: "USD"
        },
        receiver: seller.paypalEmail,
        note: `Payout from WEB VTEC - Available balance withdrawal`,
        sender_item_id: `item_${Date.now()}`
      }]
    };
    
    const payoutResponse = await axios.post(
      `${PAYPAL_BASE_URL}/v1/payments/payouts`,
      payoutData,
      {
        headers: {
          'Authorization': `Bearer ${accessToken}`,
          'Content-Type': 'application/json'
        }
      }
    );
    
    // Update seller balance
    await db.collection('sellers').doc(sellerId).update({
      availableBalance: admin.firestore.FieldValue.increment(-amount),
      payoutHistory: admin.firestore.FieldValue.arrayUnion({
        amount: amount,
        paypalBatchId: payoutResponse.data.batch_header.payout_batch_id,
        status: 'pending',
        requestedAt: admin.firestore.FieldValue.serverTimestamp()
      })
    });
    
    return { success: true, batchId: payoutResponse.data.batch_header.payout_batch_id };
    
  } catch (error) {
    console.error('Payout failed:', error);
    throw new functions.https.HttpsError('internal', 'Payout processing failed');
  }
});

// EMAIL TEMPLATES
function generateOrderConfirmationEmail(data) {
  return `
    <h2>Order Confirmation</h2>
    <p>Thank you for your order!</p>
    <p><strong>Order Number:</strong> ${data.orderNumber}</p>
    <p><strong>Total:</strong> $${data.total}</p>
    <p>We'll send you updates as your order is processed.</p>
  `;
}

function generateNewOrderEmail(data) {
  return `
    <h2>New Order Received!</h2>
    <p>You have a new order:</p>
    <p><strong>Order Number:</strong> ${data.orderNumber}</p>
    <p><strong>Customer:</strong> ${data.buyerEmail}</p>
    <p><strong>Amount:</strong> $${data.amount}</p>
    <p>Please process this order promptly.</p>
  `;
}

function generateStatusUpdateEmail(data) {
  return `
    <h2>Order Status Update</h2>
    <p>Your order #${data.orderNumber} status has been updated to: <strong>${data.newStatus}</strong></p>
    <p>From seller: ${data.sellerName}</p>
  `;
}

function generateSubscriptionReminderEmail(data) {
  return `
    <h2>Subscription Renewal Reminder</h2>
    <p>Your WEB VTEC seller subscription will renew in ${data.daysUntilRenewal} days.</p>
    <p><strong>Amount:</strong> JMD $${data.amount}</p>
    <p>Your account will be automatically charged.</p>
  `;
}

function generateEarningsNotificationEmail(data) {
  return `
    <h2>Payment Received!</h2>
    <p>You've received a payment for order #${data.orderNumber}</p>
    <p><strong>Earnings:</strong> $${data.earnings}</p>
    <p><strong>Gross Amount:</strong> $${data.grossAmount}</p>
    <p><strong>Platform Fee:</strong> $${data.platformFee}</p>
    <p>The amount has been added to your available balance.</p>
  `;
}
