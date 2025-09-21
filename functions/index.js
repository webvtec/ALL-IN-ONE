// functions/index.js
const functions = require('firebase-functions');
const admin = require('firebase-admin');
const nodemailer = require('nodemailer');

admin.initializeApp();

// Email configuration
const gmailEmail = functions.config().gmail.email;
const gmailPassword = functions.config().gmail.password;

const mailTransport = nodemailer.createTransporter({
  service: 'gmail',
  auth: {
    user: gmailEmail,
    pass: gmailPassword,
  },
});

// Send order confirmation email
exports.sendOrderConfirmation = functions.firestore
  .document('orders/{orderId}')
  .onCreate(async (snap, context) => {
    const order = snap.data();
    const orderNumber = context.params.orderId;

    const mailOptions = {
      from: `WEBVTEC <${gmailEmail}>`,
      to: order.buyerEmail,
      subject: `Order Confirmation #${orderNumber}`,
      html: generateOrderConfirmationEmail(order, orderNumber)
    };

    try {
      await mailTransport.sendMail(mailOptions);
      console.log('Order confirmation email sent successfully');
    } catch (error) {
      console.error('Error sending order confirmation:', error);
    }
  });

// Send seller notification
exports.notifySellers = functions.firestore
  .document('sellerOrders/{orderNumber}')
  .onCreate(async (snap, context) => {
    const order = snap.data();
    
    // Get seller email
    const sellerDoc = await admin.firestore().collection('sellers').doc(order.sellerId).get();
    const seller = sellerDoc.data();

    const mailOptions = {
      from: `WEBVTEC <${gmailEmail}>`,
      to: seller.email,
      subject: `New Order Received #${order.orderNumber}`,
      html: generateSellerNotificationEmail(order, seller)
    };

    await mailTransport.sendMail(mailOptions);
  });

// Send status update emails
exports.sendStatusUpdate = functions.firestore
  .document('sellerOrders/{orderNumber}')
  .onUpdate(async (change, context) => {
    const before = change.before.data();
    const after = change.after.data();
    
    if (before.status !== after.status) {
      const mailOptions = {
        from: `WEBVTEC <${gmailEmail}>`,
        to: after.buyerEmail,
        subject: `Order Update #${after.orderNumber}`,
        html: generateStatusUpdateEmail(after)
      };
      
      await mailTransport.sendMail(mailOptions);
    }
  });

function generateOrderConfirmationEmail(order, orderNumber) {
  return `
    <div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto;">
      <h2 style="color: #333;">Order Confirmation</h2>
      <p>Thank you for your order! Here are the details:</p>
      
      <div style="background: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;">
        <h3>Order #${orderNumber}</h3>
        <p><strong>Total:</strong> JMD $${order.totalAmount.toFixed(2)}</p>
        <p><strong>Status:</strong> ${order.status}</p>
        <p><strong>Delivery:</strong> ${order.shippingAddress.deliveryLocation}</p>
      </div>
      
      <h3>Items Ordered:</h3>
      ${Object.values(order.sellers).map(seller => `
        <div style="border: 1px solid #ddd; padding: 15px; margin: 10px 0; border-radius: 5px;">
          <h4>From: ${seller.sellerName}</h4>
          ${seller.items.map(item => `
            <p>${item.productName} x${item.quantity} - JMD $${item.subtotal.toFixed(2)}</p>
          `).join('')}
          <p><strong>Subtotal: JMD $${seller.subtotal.toFixed(2)}</strong></p>
        </div>
      `).join('')}
      
      <p>We'll send you updates as your order progresses.</p>
    </div>
  `;
}

function generateSellerNotificationEmail(order, seller) {
  return `
    <div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto;">
      <h2 style="color: #333;">New Order Received!</h2>
      <p>Hi ${seller.businessName},</p>
      <p>You have received a new order:</p>
      
      <div style="background: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;">
        <h3>Order #${order.orderNumber}</h3>
        <p><strong>Customer:</strong> ${order.buyerEmail}</p>
        <p><strong>Total:</strong> JMD $${order.subtotal.toFixed(2)}</p>
        <p><strong>Delivery:</strong> ${order.shippingAddress.deliveryLocation}</p>
      </div>
      
      <h3>Items:</h3>
      ${order.items.map(item => `
        <p>${item.productName} x${item.quantity} - JMD $${item.subtotal.toFixed(2)}</p>
      `).join('')}
      
      <p>Please log in to your seller dashboard to manage this order.</p>
    </div>
  `;
}
