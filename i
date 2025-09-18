<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WEB VTEC - Your Premier Online Marketplace</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --primary: #1a73e8;
            --primary-dark: #1557b0;
            --secondary: #0f172a;
            --accent: #f59e0b;
            --success: #10b981;
            --error: #ef4444;
            --warning: #f59e0b;
            --text-primary: #0f172a;
            --text-secondary: #64748b;
            --text-muted: #94a3b8;
            --background: #ffffff;
            --background-light: #f8fafc;
            --background-dark: #1e293b;
            --border: #e2e8f0;
            --border-light: #f1f5f9;
            --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
            --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1);
            --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1);
            --shadow-xl: 0 20px 25px -5px rgb(0 0 0 / 0.1);
            --gradient-primary: linear-gradient(135deg, #1a73e8 0%, #4285f4 100%);
            --gradient-accent: linear-gradient(135deg, #f59e0b 0%, #fbbf24 100%);
        }

        body {
            font-family: 'Inter', system-ui, -apple-system, sans-serif;
            line-height: 1.6;
            color: var(--text-primary);
            background: var(--background-light);
        }

        /* Header & Navigation */
        .header {
            background: var(--background);
            border-bottom: 1px solid var(--border);
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: var(--shadow-sm);
        }

        .header-top {
            background: var(--secondary);
            color: white;
            padding: 8px 0;
            font-size: 14px;
            text-align: center;
        }

        ..header-main {
    padding: 8px 0;
        }

        .header-container {
            max-width: 1280px;
            margin: 0 auto;
            padding: 0 24px;
            display: flex;
            align-items: center;
            gap: 24px;
        }

        .logo {
            font-size: 32px;
            font-weight: 800;
            color: var(--primary);
            text-decoration: none;
            letter-spacing: -1px;
        }

        .search-container {
            flex: 1;
            max-width: 600px;
            position: relative;
        }

        .search-form {
            display: flex;
            border: 2px solid var(--border);
            border-radius: 12px;
            overflow: hidden;
            background: var(--background);
            transition: all 0.2s ease;
        }

        .search-form:focus-within {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgb(26 115 232 / 0.1);
        }

        .search-input {
            flex: 1;
            padding: 14px 16px;
            border: none;
            font-size: 16px;
            outline: none;
            background: transparent;
        }

        .search-btn {
            padding: 14px 20px;
            background: var(--primary);
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            transition: all 0.2s ease;
        }

        .search-btn:hover {
            background: var(--primary-dark);
        }

        .header-actions {
            display: flex;
            gap: 16px;
            align-items: center;
        }

        .header-btn {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 4px;
            color: var(--text-primary);
            text-decoration: none;
            padding: 8px 12px;
            border-radius: 8px;
            font-size: 12px;
            font-weight: 500;
            transition: all 0.2s ease;
            position: relative;
        }

        .header-btn:hover {
            background: var(--background-light);
            color: var(--primary);
        }

        .header-btn i {
            font-size: 20px;
        }

        .cart-count {
            position: absolute;
            top: 4px;
            right: 6px;
            background: var(--error);
            color: white;
            border-radius: 10px;
            width: 20px;
            height: 20px;
            font-size: 11px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
        }

        .nav {
            background: var(--background);
            border-top: 1px solid var(--border);
            padding: 12px 0;
        }

        .nav-container {
            max-width: 1280px;
            margin: 0 auto;
            padding: 0 24px;
            display: flex;
            gap: 32px;
            overflow-x: auto;
        }

        .nav-item {
            color: var(--text-secondary);
            text-decoration: none;
            font-weight: 500;
            white-space: nowrap;
            padding: 8px 16px;
            border-radius: 8px;
            transition: all 0.2s ease;
        }

        .nav-item:hover, .nav-item.active {
            background: var(--primary);
            color: white;
        }

        /* Main Layout */
        .main-container {
            max-width: 1280px;
            margin: 0 auto;
            padding: 0 24px;
        }

        /* Hero Section */
        .hero {
            background: var(--gradient-primary);
            color: white;
            padding: 80px 0;
            margin: 32px 0;
            border-radius: 16px;
            position: relative;
            overflow: hidden;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, transparent 0%, rgba(255,255,255,0.1) 100%);
        }

        .hero-content {
            position: relative;
            z-index: 1;
            text-align: center;
        }

        .hero h1 {
            font-size: clamp(2.5rem, 6vw, 4rem);
            font-weight: 800;
            margin-bottom: 24px;
            line-height: 1.1;
        }

        .hero p {
            font-size: 1.25rem;
            margin-bottom: 40px;
            opacity: 0.9;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .hero-buttons {
            display: flex;
            gap: 16px;
            justify-content: center;
            flex-wrap: wrap;
        }

        /* Buttons */
        .btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 14px 28px;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            text-decoration: none;
            cursor: pointer;
            transition: all 0.2s ease;
            font-size: 16px;
            position: relative;
            overflow: hidden;
        }

        .btn-primary {
            background: white;
            color: var(--primary);
            box-shadow: var(--shadow-md);
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
        }

        .btn-secondary {
            background: transparent;
            color: white;
            border: 2px solid white;
        }

        .btn-secondary:hover {
            background: white;
            color: var(--primary);
        }

        .btn-success {
            background: var(--success);
            color: white;
        }

        .btn-danger {
            background: var(--error);
            color: white;
        }

        .btn-sm {
            padding: 8px 16px;
            font-size: 14px;
        }

        .btn-lg {
            padding: 18px 36px;
            font-size: 18px;
        }

        /* Categories Grid */
        .categories {
            margin: 60px 0;
        }

        .section-title {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 40px;
            color: var(--text-primary);
        }

        .categories-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 24px;
        }

        .category-card {
            background: var(--background);
            border-radius: 16px;
            padding: 32px 24px;
            text-align: center;
            text-decoration: none;
            color: var(--text-primary);
            border: 1px solid var(--border);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .category-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: var(--gradient-primary);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .category-card:hover {
            transform: translateY(-8px);
            box-shadow: var(--shadow-xl);
            border-color: var(--primary);
        }

        .category-card:hover::before {
            opacity: 0.05;
        }

        .category-card:hover * {
            color: var(--primary);
        }

        .category-icon {
            font-size: 3.5rem;
            margin-bottom: 16px;
            color: var(--primary);
            position: relative;
            z-index: 1;
        }

        .category-name {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 8px;
            position: relative;
            z-index: 1;
        }

        .category-count {
            color: var(--text-secondary);
            font-size: 0.9rem;
            position: relative;
            z-index: 1;
        }

        /* Products Section */
        .products {
            margin: 60px 0;
        }

        .products-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 32px;
            flex-wrap: wrap;
            gap: 16px;
        }

        .products-filters {
            display: flex;
            gap: 16px;
            align-items: center;
            flex-wrap: wrap;
        }

        .filter-select {
            padding: 12px 16px;
            border: 1px solid var(--border);
            border-radius: 8px;
            background: var(--background);
            font-size: 14px;
            outline: none;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .filter-select:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgb(26 115 232 / 0.1);
        }

        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 24px;
        }

        .product-card {
            background: var(--background);
            border-radius: 16px;
            overflow: hidden;
            border: 1px solid var(--border);
            transition: all 0.3s ease;
            position: relative;
        }

        .product-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-lg);
            border-color: var(--primary);
        }

        .product-image {
            width: 100%;
            height: 240px;
            background: var(--background-light);
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .product-badge {
            position: absolute;
            top: 12px;
            left: 12px;
            background: var(--accent);
            color: white;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
        }

        .product-info {
            padding: 24px;
        }

        .product-title {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 8px;
            color: var(--text-primary);
            line-height: 1.4;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .product-seller {
            color: var(--text-secondary);
            font-size: 0.9rem;
            margin-bottom: 12px;
        }

        .product-rating {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 12px;
        }

        .stars {
            display: flex;
            gap: 2px;
        }

        .star {
            color: var(--accent);
            font-size: 14px;
        }

        .star.empty {
            color: var(--border);
        }

        .rating-text {
            color: var(--text-secondary);
            font-size: 0.9rem;
        }

        .product-price {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 8px;
        }

        .product-original-price {
            text-decoration: line-through;
            color: var(--text-secondary);
            font-size: 1rem;
            margin-left: 8px;
            font-weight: 400;
        }

        .product-shipping {
            color: var(--success);
            font-size: 0.9rem;
            margin-bottom: 16px;
            font-weight: 500;
        }

        .product-actions {
            display: flex;
            gap: 8px;
        }

        /* Seller Dashboard */
        .dashboard {
            background: var(--background);
            border-radius: 16px;
            padding: 32px;
            margin: 32px 0;
            border: 1px solid var(--border);
            display: none;
        }

        .dashboard.active {
            display: block;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 32px;
            padding-bottom: 24px;
            border-bottom: 1px solid var(--border);
            flex-wrap: wrap;
            gap: 16px;
        }

        .dashboard-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 24px;
            margin-bottom: 32px;
        }

        .stat-card {
            background: var(--gradient-primary);
            color: white;
            padding: 28px;
            border-radius: 16px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            width: 60px;
            height: 60px;
            background: rgba(255,255,255,0.1);
            border-radius: 50%;
            transform: translate(20px, -20px);
        }

        .stat-value {
            font-size: 2.5rem;
            font-weight: 800;
            margin-bottom: 8px;
            position: relative;
            z-index: 1;
        }

        .stat-label {
            font-size: 0.9rem;
            opacity: 0.9;
            position: relative;
            z-index: 1;
        }

        /* Forms */
        .form-container {
            background: var(--background-light);
            padding: 32px;
            border-radius: 16px;
            margin-bottom: 32px;
            display: none;
        }

        .form-container.active {
            display: block;
        }

        .form-group {
            margin-bottom: 24px;
        }

        .form-label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: var(--text-primary);
        }

        .form-input, .form-textarea, .form-select {
            width: 100%;
            padding: 14px 16px;
            border: 1px solid var(--border);
            border-radius: 8px;
            font-size: 16px;
            outline: none;
            transition: all 0.2s ease;
            background: var(--background);
        }

        .form-input:focus, .form-textarea:focus, .form-select:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgb(26 115 232 / 0.1);
        }

        .form-textarea {
            resize: vertical;
            min-height: 120px;
        }

        .form-row {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 24px;
        }

        .form-actions {
            display: flex;
            gap: 16px;
            justify-content: flex-end;
            margin-top: 24px;
            flex-wrap: wrap;
        }

        /* Subscription Modal */
        .subscription-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(15, 23, 42, 0.8);
            z-index: 2000;
            align-items: center;
            justify-content: center;
        }

        .subscription-modal.active {
            display: flex;
        }

        .subscription-content {
            background: var(--background);
            border-radius: 20px;
            padding: 48px;
            max-width: 600px;
            width: 90%;
            text-align: center;
            position: relative;
        }

        .subscription-close {
            position: absolute;
            top: 16px;
            right: 16px;
            background: none;
            border: none;
            font-size: 24px;
            color: var(--text-secondary);
            cursor: pointer;
        }

        .subscription-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 16px;
            color: var(--text-primary);
        }

        .subscription-price {
            font-size: 3rem;
            font-weight: 800;
            color: var(--primary);
            margin-bottom: 8px;
        }

        .subscription-period {
            color: var(--text-secondary);
            margin-bottom: 32px;
            font-size: 1.1rem;
        }

        .subscription-features {
            list-style: none;
            text-align: left;
            margin-bottom: 32px;
        }

        .subscription-features li {
            padding: 8px 0;
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 1.1rem;
        }

        .subscription-features .check {
            color: var(--success);
            font-weight: 600;
        }

        /* Cart Sidebar */
        .cart-sidebar {
            position: fixed;
            top: 0;
            right: -100%;
            width: 450px;
            height: 100vh;
            background: var(--background);
            box-shadow: var(--shadow-xl);
            transition: all 0.3s ease;
            z-index: 3000;
            display: flex;
            flex-direction: column;
        }

        .cart-sidebar.active {
            right: 0;
        }

        .cart-header {
            padding: 24px;
            border-bottom: 1px solid var(--border);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .cart-title {
            font-size: 1.25rem;
            font-weight: 700;
        }

        .cart-close {
            background: none;
            border: none;
            font-size: 20px;
            color: var(--text-secondary);
            cursor: pointer;
            padding: 8px;
            border-radius: 8px;
            transition: all 0.2s ease;
        }

        .cart-close:hover {
            background: var(--background-light);
        }

        .cart-items {
            flex: 1;
            overflow-y: auto;
            padding: 24px;
        }

        .cart-item {
            display: flex;
            gap: 16px;
            padding: 16px 0;
            border-bottom: 1px solid var(--border-light);
        }

        .cart-item:last-child {
            border-bottom: none;
        }

        .cart-item-image {
            width: 80px;
            height: 80px;
            background: var(--background-light);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .cart-item-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 8px;
        }

        .cart-item-info {
            flex: 1;
        }

        .cart-item-title {
            font-weight: 600;
            margin-bottom: 4px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .cart-item-price {
            color: var(--primary);
            font-weight: 700;
            font-size: 1.1rem;
            margin-bottom: 8px;
        }

        .cart-item-controls {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .qty-input {
            width: 60px;
            padding: 4px 8px;
            border: 1px solid var(--border);
            border-radius: 4px;
            text-align: center;
            font-size: 14px;
        }

        .remove-btn {
            background: none;
            border: none;
            color: var(--error);
            cursor: pointer;
            padding: 4px;
            border-radius: 4px;
            transition: all 0.2s ease;
        }

        .remove-btn:hover {
            background: rgba(239, 68, 68, 0.1);
        }

        .cart-footer {
            padding: 24px;
            border-top: 1px solid var(--border);
            background: var(--background-light);
        }

        .cart-total {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 24px;
        }

        .cart-subtotal {
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: var(--text-secondary);
            margin-bottom: 8px;
        }

        .cart-shipping {
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: var(--success);
            margin-bottom: 16px;
            font-weight: 500;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(15, 23, 42, 0.8);
            z-index: 2000;
            align-items: center;
            justify-content: center;
        }

        .modal.active {
            display: flex;
        }

        .modal-content {
            background: var(--background);
            border-radius: 16px;
            padding: 40px;
            max-width: 500px;
            width: 90%;
            max-height: 90vh;
            overflow-y: auto;
            position: relative;
        }

        .modal-close {
            position: absolute;
            top: 16px;
            right: 16px;
            background: none;
            border: none;
            font-size: 20px;
            color: var(--text-secondary);
            cursor: pointer;
            padding: 8px;
            border-radius: 8px;
            transition: all 0.2s ease;
        }

        .modal-close:hover {
            background: var(--background-light);
        }

        .modal-title {
            font-size: 1.75rem;
            font-weight: 700;
            margin-bottom: 32px;
            text-align: center;
        }

        /* Alert Styles */
        .alert {
            position: fixed;
            top: 80px;
            right: 24px;
            padding: 16px 20px;
            border-radius: 12px;
            font-weight: 500;
            z-index: 4000;
            min-width: 300px;
            transform: translateX(100%);
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .alert.show {
            transform: translateX(0);
        }

        .alert-success {
            background: #dcfce7;
            color: #166534;
            border: 1px solid #bbf7d0;
        }

        .alert-error {
            background: #fee2e2;
            color: #991b1b;
            border: 1px solid #fecaca;
        }

        .alert-info {
            background: #dbeafe;
            color: #1e40af;
            border: 1px solid #bfdbfe;
        }

        /* Footer */
        .footer {
            background: var(--secondary);
            color: white;
            padding: 60px 0 24px;
            margin-top: 80px;
        }

        .footer-content {
            max-width: 1280px;
            margin: 0 auto;
            padding: 0 24px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 40px;
        }

        .footer-section h3 {
            margin-bottom: 24px;
            color: var(--accent);
            font-size: 1.25rem;
        }

        .footer-links {
            list-style: none;
        }

        .footer-links li {
            margin-bottom: 12px;
        }

        .footer-links a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            transition: color 0.2s ease;
        }

        .footer-links a:hover {
            color: white;
        }

        .footer-bottom {
            text-align: center;
            padding-top: 40px;
            margin-top: 40px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            color: rgba(255, 255, 255, 0.6);
        }

        /* Loading Spinner */
        .loading {
            display: inline-block;
            width: 20px;
            height: 20px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            border-top-color: white;
            animation: spin 0.8s ease-in-out infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .header-container {
                flex-direction: column;
                gap: 16px;
            }

            .search-container {
                order: 3;
                width: 100%;
            }

            .hero {
                padding: 60px 0;
                margin: 16px 0;
            }

            .hero-buttons {
                flex-direction: column;
                align-items: center;
            }

            .products-header {
                flex-direction: column;
                align-items: stretch;
            }

            .cart-sidebar {
                width: 100%;
                right: -100%;
            }

            .form-row {
                grid-template-columns: 1fr;
            }

            .dashboard-header {
                flex-direction: column;
                align-items: stretch;
            }

            .modal-content, .subscription-content {
                padding: 24px;
            }
        }

        /* Animations */
        .fade-in {
            animation: fadeIn 0.6s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .slide-up {
            animation: slideUp 0.5s ease-out;
        }

        @keyframes slideUp {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
    </style>
</head>
<body>
    
    <header>
    <!-- Header -->
    <div class="header-top">
    <div class="header-container">
        WEB VTEC
    </div>
    </div>
        
        <div class="header-main">
            <div class="header-container">
                <a href="#" class="logo">WEB VTEC</a>
                
                <div class="search-container">
                    <form class="search-form" id="searchForm">
                        <input type="text" class="search-input" id="searchInput" 
                               placeholder="Search for products, brands, categories...">
                        <button type="submit" class="search-btn">
                            <i class="fas fa-search"></i>
                        </button>
                    </form>
                </div>
                
                <div class="header-actions">
                    <a href="#" class="header-btn" id="accountBtn">
                        <i class="fas fa-user"></i>
                        <span id="accountText">Account</span>
                    </a>
                    
                    <a href="#" class="header-btn" id="sellerBtn">
                        <i class="fas fa-store"></i>
                        <span>Sell</span>
                    </a>
                    
                    <a href="#" class="header-btn" id="cartBtn">
                        <i class="fas fa-shopping-cart"></i>
                        <span>Cart</span>
                        <span class="cart-count" id="cartCount">0</span>
                    </a>
                </div>
            </div>
        </div>
        
        <nav class="nav">
            <div class="nav-container">
                <a href="#" class="nav-item active">Home</a>
                <a href="#" class="nav-item" data-category="electronics">Electronics</a>
                <a href="#" class="nav-item" data-category="fashion">Fashion</a>
                <a href="#" class="nav-item" data-category="home">Home & Garden</a>
                <a href="#" class="nav-item" data-category="sports">Sports & Fitness</a>
                <a href="#" class="nav-item" data-category="books">Books & Media</a>
                <a href="#" class="nav-item" data-category="toys">Toys & Games</a>
                <a href="#" class="nav-item" data-category="health">Health & Beauty</a>
                <a href="#" class="nav-item" data-category="automotive">Automotive</a>
            </div>
        </nav>
    </header>

    <!-- Main Content -->
    <main class="main-container">
        <!-- Hero Section -->
        <section class="hero fade-in">
            <div class="hero-content">
                <h1>Discover Amazing Products</h1>
                <p>Shop millions of products from trusted sellers worldwide. Find everything you need in one place.</p>
                <div class="hero-buttons">
                    <a href="#products" class="btn btn-primary">
                        <i class="fas fa-shopping-bag"></i>
                        Start Shopping
                    </a>
                    <button class="btn btn-secondary" id="becomeSellerBtn">
                        <i class="fas fa-store"></i>
                        Become a Seller
                    </button>
                </div>
            </div>
        </section>

        <!-- Categories -->
        <section class="categories">
            <h2 class="section-title">Shop by Category</h2>
            <div class="categories-grid" id="categoriesGrid">
                <!-- Categories will be dynamically loaded -->
            </div>
        </section>

        <!-- Products Section -->
        <section class="products" id="products">
            <div class="products-header">
                <h2 class="section-title">Featured Products</h2>
                <div class="products-filters">
                    <select class="filter-select" id="categoryFilter">
                        <option value="">All Categories</option>
                    </select>
                    <select class="filter-select" id="sortFilter">
                        <option value="featured">Sort by: Featured</option>
                        <option value="price-low">Price: Low to High</option>
                        <option value="price-high">Price: High to Low</option>
                        <option value="rating">Customer Rating</option>
                        <option value="newest">Newest First</option>
                    </select>
                    <select class="filter-select" id="priceFilter">
                        <option value="">All Prices</option>
                        <option value="0-25">Under $25</option>
                        <option value="25-50">$25 - $50</option>
                        <option value="50-100">$50 - $100</option>
                        <option value="100-">Over $100</option>
                    </select>
                </div>
            </div>
            
            <div class="products-grid" id="productsGrid">
                <!-- Products will be dynamically loaded -->
            </div>
            
            <div id="loadingProducts" style="text-align: center; padding: 40px; display: none;">
                <div class="loading" style="width: 40px; height: 40px; border-width: 4px;"></div>
                <p style="margin-top: 16px; color: var(--text-secondary);">Loading products...</p>
            </div>
        </section>

        <!-- Seller Dashboard -->
        <section class="dashboard" id="sellerDashboard">
            <div class="dashboard-header">
                <div>
                    <h2 class="section-title">Seller Dashboard</h2>
                    <p style="color: var(--text-secondary);">Manage your products and track your sales</p>
                </div>
                <div style="display: flex; gap: 16px;">
                    <button class="btn btn-primary" id="addProductBtn">
                        <i class="fas fa-plus"></i>
                        Add Product
                    </button>
                    <button class="btn btn-secondary" id="manageSubscriptionBtn">
                        <i class="fas fa-credit-card"></i>
                        Subscription
                    </button>
                </div>
            </div>
            
            <div class="dashboard-stats" id="dashboardStats">
                <!-- Stats will be dynamically loaded -->
            </div>
            
            <!-- Product Form -->
            <div class="form-container" id="productFormContainer">
                <h3 style="margin-bottom: 24px; font-size: 1.5rem;">Add New Product</h3>
                <form id="productForm">
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">Product Title *</label>
                            <input type="text" class="form-input" name="title" required 
                                   placeholder="Enter product title">
                        </div>
                        <div class="form-group">
                            <label class="form-label">Price (USD) *</label>
                            <input type="number" class="form-input" name="price" step="0.01" min="0" required
                                   placeholder="0.00">
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">Category *</label>
                            <select class="form-select" name="category" required>
                                <option value="">Select Category</option>
                                <option value="electronics">Electronics</option>
                                <option value="fashion">Fashion</option>
                                <option value="home">Home & Garden</option>
                                <option value="sports">Sports & Fitness</option>
                                <option value="books">Books & Media</option>
                                <option value="toys">Toys & Games</option>
                                <option value="health">Health & Beauty</option>
                                <option value="automotive">Automotive</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Condition *</label>
                            <select class="form-select" name="condition" required>
                                <option value="">Select Condition</option>
                                <option value="new">New</option>
                                <option value="used-like-new">Used - Like New</option>
                                <option value="used-good">Used - Good</option>
                                <option value="used-fair">Used - Fair</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Description *</label>
                        <textarea class="form-textarea" name="description" required
                                  placeholder="Describe your product in detail..."></textarea>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">Stock Quantity *</label>
                            <input type="number" class="form-input" name="stock" min="1" required
                                   placeholder="Available quantity">
                        </div>
                        <div class="form-group">
                            <label class="form-label">Weight (lbs)</label>
                            <input type="number" class="form-input" name="weight" step="0.1" min="0"
                                   placeholder="Shipping weight">
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">Shipping Time (days)</label>
                            <select class="form-select" name="shippingTime">
                                <option value="1-2">1-2 days</option>
                                <option value="3-5">3-5 days</option>
                                <option value="5-7">5-7 days</option>
                                <option value="7-14">1-2 weeks</option>
                                <option value="14+">2+ weeks</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Brand</label>
                            <input type="text" class="form-input" name="brand" 
                                   placeholder="Product brand">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Product Images *</label>
                        <input type="file" class="form-input" name="images" multiple accept="image/*" required>
                        <small style="color: var(--text-secondary); margin-top: 4px; display: block;">
                            Upload up to 5 images. First image will be the main product photo.
                        </small>
                    </div>
                    
                    <div class="form-actions">
                        <button type="button" class="btn btn-secondary" id="cancelProductBtn">
                            Cancel
                        </button>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i>
                            Save Product
                        </button>
                    </div>
                </form>
            </div>
            
            <!-- Seller Products List -->
            <div id="sellerProducts">
                <h3 style="margin-bottom: 24px;">Your Products</h3>
                <div id="sellerProductsList">
                    <!-- Seller products will be loaded here -->
                </div>
            </div>
        </section>
    </main>

    <!-- Cart Sidebar -->
    <div class="cart-sidebar" id="cartSidebar">
        <div class="cart-header">
            <h3 class="cart-title">Shopping Cart</h3>
            <button class="cart-close" id="cartCloseBtn">
                <i class="fas fa-times"></i>
            </button>
        </div>
        
        <div class="cart-items" id="cartItems">
            <div style="text-align: center; padding: 60px 20px; color: var(--text-secondary);">
                <i class="fas fa-shopping-cart" style="font-size: 3rem; margin-bottom: 16px; opacity: 0.3;"></i>
                <p style="font-size: 1.1rem; margin-bottom: 8px;">Your cart is empty</p>
                <p style="font-size: 0.9rem;">Add some amazing products!</p>
            </div>
        </div>
        
        <div class="cart-footer" id="cartFooter" style="display: none;">
            <div class="cart-subtotal">
                <span>Subtotal:</span>
                <span id="cartSubtotal">$0.00</span>
            </div>
            <div class="cart-shipping">
    <span>Shipping:</span>
    <span>Handled by Sellers</span>
            </div>
            <div class="cart-total">
                <span>Total:</span>
                <span id="cartTotal">$0.00</span>
            </div>
            <button class="btn btn-primary btn-lg" id="checkoutBtn" style="width: 100%;">
                <i class="fas fa-credit-card"></i>
                Proceed to Checkout
            </button>
        </div>
    </div>

    <!-- Authentication Modal -->
    <div class="modal" id="authModal">
        <div class="modal-content">
            <button class="modal-close" id="authModalClose">
                <i class="fas fa-times"></i>
            </button>
            
            <h2 class="modal-title" id="authTitle">Welcome Back</h2>
            <p style="text-align: center; color: var(--text-secondary); margin-bottom: 32px;" id="authSubtitle">
                Sign in to your account
            </p>
            
            <form id="authForm">
                <div class="form-group">
                    <label class="form-label">Email Address</label>
                    <input type="email" class="form-input" name="email" required 
                           placeholder="Enter your email">
                </div>
                
                <div class="form-group">
                    <label class="form-label">Password</label>
                    <input type="password" class="form-input" name="password" required
                           placeholder="Enter your password">
                </div>
                
                <div class="form-group" id="confirmPasswordGroup" style="display: none;">
                    <label class="form-label">Confirm Password</label>
                    <input type="password" class="form-input" name="confirmPassword"
                           placeholder="Confirm your password">
                </div>
                
                <div class="form-group" id="profileFieldsGroup" style="display: none;">
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">First Name</label>
                            <input type="text" class="form-input" name="firstName"
                                   placeholder="First name">
                        </div>
                        <div class="form-group">
                            <label class="form-label">Last Name</label>
                            <input type="text" class="form-input" name="lastName"
                                   placeholder="Last name">
                        </div>
                    </div>
                </div>
                
                <button type="submit" class="btn btn-primary btn-lg" style="width: 100%;" id="authSubmitBtn">
                    Sign In
                </button>
            </form>
            
            <div style="text-align: center; margin-top: 24px;">
                <p style="color: var(--text-secondary);">
                    <span id="authSwitchText">Don't have an account?</span>
                    <button type="button" style="background: none; border: none; color: var(--primary); cursor: pointer; text-decoration: underline;" id="authSwitchBtn">
                        Sign up
                    </button>
                </p>
            </div>
        </div>
    </div>

    <!-- Seller Subscription Modal -->
    <div class="subscription-modal" id="subscriptionModal">
        <div class="subscription-content">
            <button class="subscription-close" id="subscriptionClose">
                <i class="fas fa-times"></i>
            </button>
            
            <h2 class="subscription-title">WEB VTEC Seller Plan</h2>
            <div class="subscription-price">$25</div>
            <div class="subscription-period">per month</div>
            
            <ul class="subscription-features">
                <li><i class="fas fa-check check"></i> Unlimited product listings</li>
                <li><i class="fas fa-check check"></i> Advanced analytics dashboard</li>
                <li><i class="fas fa-check check"></i> Priority customer support</li>
                <li><i class="fas fa-check check"></i> Promotional tools & badges</li>
                <li><i class="fas fa-check check"></i> Multi-image uploads</li>
                <li><i class="fas fa-check check"></i> Bulk product management</li>
                <li><i class="fas fa-check check"></i> Custom store branding</li>
                <li><i class="fas fa-check check"></i> Automated inventory tracking</li>
            </ul>
            
            <button class="btn btn-primary btn-lg" id="subscribeBtn" style="width: 100%;">
                <i class="fas fa-credit-card"></i>
                Start Selling - $25/month
            </button>
            
            <p style="text-align: center; margin-top: 16px; color: var(--text-secondary); font-size: 0.9rem;">
                Cancel anytime. No setup fees.
            </p>
        </div>
    </div>

    <!-- Checkout Modal -->
    <div class="modal" id="checkoutModal">
        <div class="modal-content" style="max-width: 800px;">
            <button class="modal-close" id="checkoutClose">
                <i class="fas fa-times"></i>
            </button>
            
            <h2 class="modal-title">Secure Checkout</h2>
            
            <div id="checkoutContent">
                <!-- Checkout form will be loaded here -->
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-content">
            <div class="footer-section">
                <h3>About WEB VTEC</h3>
                <p>Your premier online marketplace connecting buyers and sellers worldwide. Discover amazing products, support businesses, and enjoy secure shopping with fast shipping.</p>
                <div style="margin-top: 24px;">
                    <a href="#" style="color: var(--accent); margin-right: 16px; font-size: 1.5rem;">
                        <i class="fab fa-facebook"></i>
                    </a>
                    <a href="#" style="color: var(--accent); margin-right: 16px; font-size: 1.5rem;">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="#" style="color: var(--accent); margin-right: 16px; font-size: 1.5rem;">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a href="#" style="color: var(--accent); font-size: 1.5rem;">
                        <i class="fab fa-youtube"></i>
                    </a>
                </div>
            </div>
            
            <div class="footer-section">
                <h3>Customer Service</h3>
                <ul class="footer-links">
                    <li><a href="#">Help Center</a></li>
                    <li><a href="#">Returns & Refunds</a></li>
                    <li><a href="#">Shipping Information</a></li>
                    <li><a href="#">Track Your Order</a></li>
                    <li><a href="#">Contact Support</a></li>
                </ul>
            </div>
            
            <div class="footer-section">
                <h3>For Sellers</h3>
                <ul class="footer-links">
                    <li><a href="#">Start Selling</a></li>
                    <li><a href="#">Seller Dashboard</a></li>
                    <li><a href="#">Seller Fees</a></li>
                    <li><a href="#">Seller Resources</a></li>
                    <li><a href="#">Seller Support</a></li>
                </ul>
            </div>
            
            <div class="footer-section">
                <h3>Company</h3>
                <ul class="footer-links">
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Careers</a></li>
                    <li><a href="#">Press</a></li>
                    <li><a href="#">Investor Relations</a></li>
                    <li><a href="#">Sustainability</a></li>
                </ul>
            </div>
        </div>
        
        <div class="footer-bottom">
            <p>&copy; 2024 WEB VTEC. All rights reserved. | <a href="#" style="color: inherit;">Privacy Policy</a> | <a href="#" style="color: inherit;">Terms of Service</a> | <a href="#" style="color: inherit;">Accessibility</a></p>
        </div>
    </footer>

    <!-- Scripts -->
    <!-- Firebase SDK v9 -->
    <script src="https://www.gstatic.com/firebasejs/9.22.0/firebase-app-compat.js"></script>
    <script src="https://www.gstatic.com/firebasejs/9.22.0/firebase-auth-compat.js"></script>
    <script src="https://www.gstatic.com/firebasejs/9.22.0/firebase-firestore-compat.js"></script>
    <script src="https://www.gstatic.com/firebasejs/9.22.0/firebase-storage-compat.js"></script>
    <script src="https://www.gstatic.com/firebasejs/9.22.0/firebase-functions-compat.js"></script>
    
    <!-- Stripe Payment SDK -->
    <script src="https://js.stripe.com/v3/"></script>

    <script>
        // ======================
        // FIREBASE CONFIGURATION
        // ======================
        // TODO: Replace with your Firebase config
        const firebaseConfig = {
            apiKey: "your-api-key-here",
            authDomain: "your-project.firebaseapp.com",
            projectId: "your-project-id",
            storageBucket: "your-project.appspot.com",
            messagingSenderId: "123456789012",
            appId: "your-app-id-here",
            measurementId: "your-measurement-id"
        };

        // Initialize Firebase
        firebase.initializeApp(firebaseConfig);
        const auth = firebase.auth();
        const db = firebase.firestore();
        const storage = firebase.storage();
        const functions = firebase.functions();

        // ======================
        // STRIPE CONFIGURATION
        // ======================
        // TODO: Replace with your Stripe publishable key
        const stripe = Stripe('pk_test_your_stripe_publishable_key_here');

        
// ======================
// GLOBAL VARIABLES
// ======================
let currentUser = null;
let userProfile = null;
let cart = [];
let products = [];
let categories = [];
let isSellerMode = false;
let currentAuthMode = 'signin';
let users = []; // Store users in memory

// Categories (static for structure)
const defaultCategories = [
    { id: 'electronics', name: 'Electronics', icon: 'fas fa-laptop', count: 0 },
    { id: 'fashion', name: 'Fashion', icon: 'fas fa-tshirt', count: 0 },
    { id: 'home', name: 'Home & Garden', icon: 'fas fa-home', count: 0 },
    { id: 'sports', name: 'Sports & Fitness', icon: 'fas fa-dumbbell', count: 0 },
    { id: 'books', name: 'Books & Media', icon: 'fas fa-book', count: 0 },
    { id: 'toys', name: 'Toys & Games', icon: 'fas fa-gamepad', count: 0 },
    { id: 'health', name: 'Health & Beauty', icon: 'fas fa-heart', count: 0 },
    { id: 'automotive', name: 'Automotive', icon: 'fas fa-car', count: 0 }
];

// ======================
// INITIALIZATION
// ======================
document.addEventListener('DOMContentLoaded', function() {
    initializeApp();
    setupEventListeners();
    loadInitialData();
});

function initializeApp() {
    console.log('Initializing WEB VTEC...');
    categories = [...defaultCategories];
    updateCartUI();
    updateAuthUI();
}

function setupEventListeners() {
    // Auth
    document.getElementById('accountBtn')?.addEventListener('click', handleAccountClick);
    document.getElementById('becomeSellerBtn')?.addEventListener('click', handleBecomeSellerClick);
    document.getElementById('authSwitchBtn')?.addEventListener('click', switchAuthMode);
    document.getElementById('authForm')?.addEventListener('submit', handleAuthSubmit);
    document.getElementById('authModalClose')?.addEventListener('click', () => hideModal('authModal'));

    // Cart
    document.getElementById('cartBtn')?.addEventListener('click', toggleCart);
    document.getElementById('cartCloseBtn')?.addEventListener('click', toggleCart);
    document.getElementById('checkoutBtn')?.addEventListener('click', proceedToCheckout);

    // Search
    document.getElementById('searchForm')?.addEventListener('submit', handleSearch);

    // Seller Dashboard
    document.getElementById('sellerBtn')?.addEventListener('click', toggleSellerDashboard);
    document.getElementById('addProductBtn')?.addEventListener('click', showProductForm);
    document.getElementById('cancelProductBtn')?.addEventListener('click', hideProductForm);
    document.getElementById('productForm')?.addEventListener('submit', handleAddProduct);
    document.getElementById('manageSubscriptionBtn')?.addEventListener('click', showSubscriptionModal);

    // Subscription
    document.getElementById('subscribeBtn')?.addEventListener('click', handleSubscription);
    document.getElementById('subscriptionClose')?.addEventListener('click', () => hideModal('subscriptionModal'));

    // Filters
    document.getElementById('categoryFilter')?.addEventListener('change', applyFilters);
    document.getElementById('sortFilter')?.addEventListener('change', applyFilters);
    document.getElementById('priceFilter')?.addEventListener('change', applyFilters);

    // Navigation
    document.querySelectorAll('.nav-item[data-category]').forEach(item => {
        item.addEventListener('click', (e) => {
            e.preventDefault();
            document.querySelectorAll('.nav-item').forEach(nav => nav.classList.remove('active'));
            item.classList.add('active');
            filterByCategory(item.dataset.category);
        });
    });

    // Home nav
    document.querySelector('.nav-item:not([data-category])')?.addEventListener('click', (e) => {
        e.preventDefault();
        document.querySelectorAll('.nav-item').forEach(nav => nav.classList.remove('active'));
        e.target.classList.add('active');
        document.getElementById('categoryFilter').value = '';
        applyFilters();
    });

    // Category cards
    document.addEventListener('click', (e) => {
        const categoryCard = e.target.closest('.category-card');
        if (categoryCard) {
            e.preventDefault();
            const categoryId = categoryCard.dataset.category;
            if (categoryId) {
                document.querySelectorAll('.nav-item').forEach(nav => nav.classList.remove('active'));
                document.querySelector(`[data-category="${categoryId}"]`)?.classList.add('active');
                filterByCategory(categoryId);
            }
        }
    });

    // Product actions
    document.getElementById('productsGrid')?.addEventListener('click', handleProductClick);

    // Modal close on outside click
    window.addEventListener('click', handleModalOutsideClick);

    // Make functions globally available
    window.addToCart = addToCart;
    window.updateCartQuantity = updateCartQuantity;
    window.removeFromCart = removeFromCart;
    window.toggleProductStatus = toggleProductStatus;
}

function loadInitialData() {
    categories = [...defaultCategories];
    products = [];
    renderCategories();
    populateCategoryFilter();
    renderProducts([]);
}

// ======================
// AUTHENTICATION
// ======================
function handleAccountClick(e) {
    e.preventDefault();
    if (currentUser) {
        showUserMenu();
    } else {
        showModal('authModal');
    }
}

function switchAuthMode() {
    currentAuthMode = currentAuthMode === 'signin' ? 'signup' : 'signin';
    
    const authTitle = document.getElementById('authTitle');
    const authSubtitle = document.getElementById('authSubtitle');
    const authSubmitBtn = document.getElementById('authSubmitBtn');
    const authSwitchText = document.getElementById('authSwitchText');
    const authSwitchBtn = document.getElementById('authSwitchBtn');
    const confirmPasswordGroup = document.getElementById('confirmPasswordGroup');
    const profileFieldsGroup = document.getElementById('profileFieldsGroup');
    
    if (currentAuthMode === 'signup') {
        authTitle.textContent = 'Create Account';
        authSubtitle.textContent = 'Join thousands of sellers and buyers';
        authSubmitBtn.textContent = 'Create Account';
        authSwitchText.textContent = 'Already have an account?';
        authSwitchBtn.textContent = 'Sign in';
        confirmPasswordGroup.style.display = 'block';
        profileFieldsGroup.style.display = 'block';
    } else {
        authTitle.textContent = 'Welcome Back';
        authSubtitle.textContent = 'Sign in to your account';
        authSubmitBtn.textContent = 'Sign In';
        authSwitchText.textContent = "Don't have an account?";
        authSwitchBtn.textContent = 'Sign up';
        confirmPasswordGroup.style.display = 'none';
        profileFieldsGroup.style.display = 'none';
    }
}

function handleAuthSubmit(e) {
    e.preventDefault();
    const formData = new FormData(e.target);
    const email = formData.get('email');
    const password = formData.get('password');
    
    try {
        if (currentAuthMode === 'signup') {
            const confirmPassword = formData.get('confirmPassword');
            const firstName = formData.get('firstName');
            const lastName = formData.get('lastName');
            
            if (password !== confirmPassword) {
                throw new Error('Passwords do not match');
            }
            
            if (users.find(u => u.email === email)) {
                throw new Error('Email already exists');
            }
            
            // Create user
            const newUser = {
                id: 'user_' + Date.now(),
                email: email,
                firstName: firstName,
                lastName: lastName,
                displayName: `${firstName} ${lastName}`,
                isSeller: false,
                isSubscribed: false,
                createdAt: new Date()
            };
            
            users.push(newUser);
            currentUser = newUser;
            userProfile = newUser;
            
            showAlert('Account created successfully!', 'success');
        } else {
            // Sign in
            const user = users.find(u => u.email === email);
            if (!user) {
                throw new Error('Invalid email or password');
            }
            
            currentUser = user;
            userProfile = user;
            showAlert('Welcome back!', 'success');
        }
        
        updateAuthUI();
        hideModal('authModal');
        document.getElementById('authForm').reset();
        
    } catch (error) {
        showAlert(error.message, 'error');
    }
}

function signOut() {
    currentUser = null;
    userProfile = null;
    cart = [];
    isSellerMode = false;
    updateCartUI();
    updateAuthUI();
    hideSellerDashboard();
    showAlert('Signed out successfully', 'success');
}

function updateAuthUI() {
    const accountText = document.getElementById('accountText');
    const accountBtn = document.getElementById('accountBtn');
    
    if (currentUser) {
        accountText.textContent = 'Account';
        accountBtn.innerHTML = `
            <i class="fas fa-user-circle"></i>
            <span>Hi, ${userProfile?.firstName || 'User'}</span>
        `;
    } else {
        accountText.textContent = 'Sign In';
        accountBtn.innerHTML = `
            <i class="fas fa-user"></i>
            <span>Account</span>
        `;
    }
}

function showUserMenu() {
    const existingMenu = document.querySelector('.user-menu');
    if (existingMenu) existingMenu.remove();
    
    const menu = document.createElement('div');
    menu.className = 'user-menu';
    menu.style.cssText = `
        position: absolute;
        top: 100%;
        right: 0;
        background: white;
        border: 1px solid var(--border);
        border-radius: 8px;
        box-shadow: var(--shadow-lg);
        min-width: 200px;
        z-index: 1000;
        margin-top: 8px;
    `;
    
    menu.innerHTML = `
        <div style="padding: 16px; border-bottom: 1px solid var(--border);">
            <div style="font-weight: 600;">${userProfile?.displayName || 'User'}</div>
            <div style="font-size: 0.9rem; color: var(--text-secondary);">${currentUser?.email}</div>
        </div>
        <div style="padding: 8px 0;">
            <a href="#" id="viewProfile" style="display: block; padding: 12px 16px; text-decoration: none; color: var(--text-primary);">
                <i class="fas fa-user" style="margin-right: 8px;"></i> View Profile
            </a>
            <a href="#" id="signOutBtn" style="display: block; padding: 12px 16px; text-decoration: none; color: var(--error);">
                <i class="fas fa-sign-out-alt" style="margin-right: 8px;"></i> Sign Out
            </a>
        </div>
    `;
    
    document.getElementById('accountBtn').style.position = 'relative';
    document.getElementById('accountBtn').appendChild(menu);
    
    menu.querySelector('#signOutBtn').addEventListener('click', (e) => {
        e.preventDefault();
        signOut();
        menu.remove();
    });
    
    // Close menu when clicking outside
    setTimeout(() => {
        document.addEventListener('click', function closeMenu(e) {
            if (!menu.contains(e.target) && !document.getElementById('accountBtn').contains(e.target)) {
                menu.remove();
                document.removeEventListener('click', closeMenu);
            }
        });
    }, 0);
}

// ======================
// PRODUCTS
// ======================
function renderCategories() {
    const categoriesGrid = document.getElementById('categoriesGrid');
    if (!categoriesGrid) return;
    
    categoriesGrid.innerHTML = categories.map(category => `
        <a href="#" class="category-card" data-category="${category.id}">
            <div class="category-icon">
                <i class="${category.icon}"></i>
            </div>
            <div class="category-name">${category.name}</div>
            <div class="category-count">${category.count} products</div>
        </a>
    `).join('');
}

function renderProducts(productsToRender) {
    const productsGrid = document.getElementById('productsGrid');
    if (!productsGrid) return;
    
    if (productsToRender.length === 0) {
        productsGrid.innerHTML = `
            <div style="grid-column: 1 / -1; text-align: center; padding: 60px 20px;">
                <i class="fas fa-search" style="font-size: 3rem; color: var(--text-muted); margin-bottom: 16px;"></i>
                <h3 style="margin-bottom: 8px;">No products found</h3>
                <p style="color: var(--text-secondary);">Be the first to add products in this category!</p>
            </div>
        `;
        return;
    }

    productsGrid.innerHTML = productsToRender.map(product => `
        <div class="product-card" data-product-id="${product.id}">
            <div class="product-image">
                ${product.badge ? `<div class="product-badge">${product.badge}</div>` : ''}
                <img src="${product.image}" alt="${product.title}" loading="lazy">
            </div>
            <div class="product-info">
                <h3 class="product-title">${product.title}</h3>
                <div class="product-seller">by ${product.sellerName}</div>
                <div class="product-rating">
                    <div class="stars">
                        ${generateStars(product.rating || 0)}
                    </div>
                    <span class="rating-text">(${product.reviews || 0})</span>
                </div>
                <div class="product-price">
                    $${product.price}
                    ${product.originalPrice ? `<span class="product-original-price">$${product.originalPrice}</span>` : ''}
                </div>
                <div class="product-shipping">${product.shipping || 'Shipping calculated by seller'}</div>
                <div class="product-actions">
                    <button class="btn btn-primary add-to-cart" data-product-id="${product.id}">
                        <i class="fas fa-cart-plus"></i>
                        Add to Cart
                    </button>
                    <button class="btn btn-secondary view-product" data-product-id="${product.id}">
                        <i class="fas fa-eye"></i>
                        View
                    </button>
                </div>
            </div>
        </div>
    `).join('');
}

function generateStars(rating) {
    const fullStars = Math.floor(rating);
    const hasHalfStar = rating % 1 !== 0;
    const emptyStars = 5 - Math.ceil(rating);
    
    let stars = '';
    for (let i = 0; i < fullStars; i++) {
        stars += '<i class="fas fa-star star"></i>';
    }
    if (hasHalfStar) {
        stars += '<i class="fas fa-star-half-alt star"></i>';
    }
    for (let i = 0; i < emptyStars; i++) {
        stars += '<i class="far fa-star star empty"></i>';
    }
    return stars;
}

function populateCategoryFilter() {
    const categoryFilter = document.getElementById('categoryFilter');
    if (!categoryFilter) return;
    
    categoryFilter.innerHTML = `
        <option value="">All Categories</option>
        ${categories.map(cat => `<option value="${cat.id}">${cat.name}</option>`).join('')}
    `;
}

function handleProductClick(e) {
    const target = e.target;
    const productCard = target.closest('.product-card');
    if (!productCard) return;
    
    const productId = productCard.dataset.productId;
    
    if (target.classList.contains('add-to-cart')) {
        e.preventDefault();
        addToCart(productId);
    } else if (target.classList.contains('view-product')) {
        e.preventDefault();
        showProductModal(productId);
    }
}

function addToCart(productId) {
    try {
        const product = products.find(p => p.id === productId);
        if (!product) {
            throw new Error('Product not found');
        }
        
        const existingItem = cart.find(item => item.id === productId);
        
        if (existingItem) {
            existingItem.quantity += 1;
        } else {
            cart.push({
                id: productId,
                title: product.title,
                price: product.price,
                image: product.image,
                sellerName: product.sellerName,
                quantity: 1
            });
        }
        
        updateCartUI();
        showAlert('Product added to cart!', 'success');
        
    } catch (error) {
        showAlert('Failed to add product to cart', 'error');
    }
}

function showProductModal(productId) {
    const product = products.find(p => p.id === productId);
    if (!product) return;
    
    const modal = document.createElement('div');
    modal.className = 'modal active';
    modal.id = 'productModal';
    
    modal.innerHTML = `
        <div class="modal-content" style="max-width: 900px;">
            <button class="modal-close" onclick="this.closest('.modal').remove()">
                <i class="fas fa-times"></i>
            </button>
            
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 32px; margin-bottom: 32px;">
                <div>
                    <img src="${product.image}" alt="${product.title}" 
                         style="width: 100%; border-radius: 12px;">
                </div>
                <div>
                    <h2 style="font-size: 1.75rem; margin-bottom: 16px;">${product.title}</h2>
                    <div style="margin-bottom: 16px;">
                        <div class="product-rating">
                            <div class="stars">${generateStars(product.rating || 0)}</div>
                            <span class="rating-text">(${product.reviews || 0} reviews)</span>
                        </div>
                    </div>
                    <div style="font-size: 2rem; font-weight: 700; color: var(--primary); margin-bottom: 16px;">
                        $${product.price}
                        ${product.originalPrice ? `<span style="font-size: 1.2rem; text-decoration: line-through; color: var(--text-secondary); margin-left: 8px;">$${product.originalPrice}</span>` : ''}
                    </div>
                    <div style="color: var(--success); margin-bottom: 24px; font-weight: 500;">
                        ${product.shipping || 'Shipping calculated by seller'}
                    </div>
                    <div style="margin-bottom: 24px;">
                        <h4 style="margin-bottom: 8px;">Description</h4>
                        <p style="color: var(--text-secondary);">${product.description}</p>
                    </div>
                    <div style="margin-bottom: 24px;">
                        <strong>Seller:</strong> ${product.sellerName}<br>
                        <strong>Stock:</strong> ${product.stock} available
                    </div>
                    <button class="btn btn-primary btn-lg" onclick="addToCart('${product.id}'); this.closest('.modal').remove();">
                        <i class="fas fa-cart-plus"></i>
                        Add to Cart - $${product.price}
                    </button>
                </div>
            </div>
        </div>
    `;
    
    document.body.appendChild(modal);
}

// ======================
// CART FUNCTIONS
// ======================
function updateCartUI() {
    const cartCount = document.getElementById('cartCount');
    const cartItems = document.getElementById('cartItems');
    const cartFooter = document.getElementById('cartFooter');
    
    const itemCount = cart.reduce((total, item) => total + item.quantity, 0);
    cartCount.textContent = itemCount;
    cartCount.style.display = itemCount > 0 ? 'flex' : 'none';
    
    if (cart.length === 0) {
        cartItems.innerHTML = `
            <div style="text-align: center; padding: 60px 20px; color: var(--text-secondary);">
                <i class="fas fa-shopping-cart" style="font-size: 3rem; margin-bottom: 16px; opacity: 0.3;"></i>
                <p style="font-size: 1.1rem; margin-bottom: 8px;">Your cart is empty</p>
                <p style="font-size: 0.9rem;">Add some amazing products!</p>
            </div>
        `;
        cartFooter.style.display = 'none';
    } else {
        renderCartItems();
        updateCartTotals();
        cartFooter.style.display = 'block';
    }
}

function renderCartItems() {
    const cartItems = document.getElementById('cartItems');
    cartItems.innerHTML = cart.map(item => `
        <div class="cart-item" data-item-id="${item.id}">
            <div class="cart-item-image">
                <img src="${item.image}" alt="${item.title}">
            </div>
            <div class="cart-item-info">
                <div class="cart-item-title">${item.title}</div>
                <div class="cart-item-price">$${item.price}</div>
                <div class="cart-item-controls">
                    <button class="qty-btn" onclick="updateCartQuantity('${item.id}', -1)">-</button>
                    <input type="number" class="qty-input" value="${item.quantity}" min="1" 
                           onchange="updateCartQuantity('${item.id}', 0, this.value)">
                    <button class="qty-btn" onclick="updateCartQuantity('${item.id}', 1)">+</button>
                    <button class="remove-btn" onclick="removeFromCart('${item.id}')">
                        <i class="fas fa-trash"></i>
                    </button>
                </div>
            </div>
        </div>
    `).join('');
}

function updateCartTotals() {
    const subtotal = cart.reduce((total, item) => total + (parseFloat(item.price) * item.quantity), 0);
    document.getElementById('cartSubtotal').textContent = `$${subtotal.toFixed(2)}`;
    document.getElementById('cartTotal').textContent = `$${subtotal.toFixed(2)}`;
}

function updateCartQuantity(itemId, change, newValue = null) {
    const item = cart.find(i => i.id === itemId);
    if (!item) return;
    
    if (newValue !== null) {
        item.quantity = Math.max(1, parseInt(newValue));
    } else {
        item.quantity = Math.max(1, item.quantity + change);
    }
    
    updateCartUI();
}

function removeFromCart(itemId) {
    cart = cart.filter(item => item.id !== itemId);
    updateCartUI();
    showAlert('Item removed from cart', 'info');
}

function toggleCart() {
    document.getElementById('cartSidebar').classList.toggle('active');
}

function proceedToCheckout() {
    if (!currentUser) {
        showAlert('Please sign in to checkout', 'error');
        showModal('authModal');
        return;
    }
    
    if (cart.length === 0) {
        showAlert('Your cart is empty', 'error');
        return;
    }
    
    showAlert('Checkout functionality would integrate with payment processor', 'info');
}

// ======================
// SELLER FUNCTIONS
// ======================
function handleBecomeSellerClick() {
    if (!currentUser) {
        showModal('authModal');
        return;
    }
    
    if (userProfile?.isSeller && userProfile?.isSubscribed) {
        toggleSellerDashboard();
    } else {
        showModal('subscriptionModal');
    }
}

function toggleSellerDashboard() {
    if (!currentUser || !userProfile?.isSeller) {
        showAlert('You need to be a subscribed seller', 'error');
        return;
    }
    
    isSellerMode = !isSellerMode;
    const dashboard = document.getElementById('sellerDashboard');
    
    if (isSellerMode) {
        dashboard.classList.add('active');
        loadSellerDashboard();
    } else {
        dashboard.classList.remove('active');
        hideProductForm();
    }
}

function hideSellerDashboard() {
    document.getElementById('sellerDashboard').classList.remove('active');
    hideProductForm();
    isSellerMode = false;
}

function loadSellerDashboard() {
    const sellerProducts = products.filter(p => p.sellerId === currentUser.id);
    renderSellerStats(sellerProducts);
    renderSellerProducts(sellerProducts);
}

function renderSellerStats(sellerProducts) {
    const dashboardStats = document.getElementById('dashboardStats');
    dashboardStats.innerHTML = `
        <div class="stat-card">
            <div class="stat-value">${sellerProducts.length}</div>
            <div class="stat-label">Products Listed</div>
        </div>
        <div class="stat-card">
            <div class="stat-value">0</div>
            <div class="stat-label">Total Orders</div>
        </div>
        <div class="stat-card">
            <div class="stat-value">$0.00</div>
            <div class="stat-label">Total Revenue</div>
        </div>
        <div class="stat-card" style="background: ${userProfile?.isSubscribed ? 'var(--success)' : 'var(--error)'};">
            <div class="stat-value">${userProfile?.isSubscribed ? 'ACTIVE' : 'INACTIVE'}</div>
            <div class="stat-label">Subscription</div>
        </div>
    `;
}

function renderSellerProducts(sellerProducts) {
    const sellerProductsList = document.getElementById('sellerProductsList');
    
    if (sellerProducts.length === 0) {
        sellerProductsList.innerHTML = `
            <div style="text-align: center; padding: 60px 20px; color: var(--text-secondary);">
                <i class="fas fa-box-open" style="font-size: 3rem; margin-bottom: 16px; opacity: 0.3;"></i>
                <h3 style="margin-bottom: 8px;">No products yet</h3>
                <p style="margin-bottom: 16px;">Start selling by adding your first product</p>
                <button class="btn btn-primary" onclick="showProductForm()">
                    <i class="fas fa-plus"></i> Add Product
                </button>
            </div>
        `;
        return;
    }
    
    sellerProductsList.innerHTML = `
        <div style="display: grid; gap: 16px;">
            ${sellerProducts.map(product => `
                <div class="seller-product-item" style="display: flex; gap: 16px; padding: 16px; border: 1px solid var(--border); border-radius: 12px;">
                    <img src="${product.image}" alt="${product.title}" style="width: 80px; height: 80px; object-fit: cover; border-radius: 8px;">
                    <div style="flex: 1;">
                        <h4 style="margin-bottom: 8px;">${product.title}</h4>
                        <div style="color: var(--text-secondary); margin-bottom: 8px;">
                            Price: $${product.price} • Stock: ${product.stock} • 
                            Status: <span style="color: ${product.isActive ? 'var(--success)' : 'var(--error)'}">
                                ${product.isActive ? 'Active' : 'Inactive'}
                            </span>
                        </div>
                        <div style="display: flex; gap: 8px;">
                            <button class="btn btn-sm ${product.isActive ? 'btn-danger' : 'btn-success'}" 
                                    onclick="toggleProductStatus('${product.id}', ${!product.isActive})">
                                <i class="fas fa-${product.isActive ? 'pause' : 'play'}"></i> 
                                ${product.isActive ? 'Deactivate' : 'Activate'}
                            </button>
                        </div>
                    </div>
                </div>
            `).join('')}
        </div>
    `;
}

function showProductForm() {
    document.getElementById('productFormContainer').classList.add('active');
    document.getElementById('productFormContainer').scrollIntoView({ behavior: 'smooth' });
}

function hideProductForm() {
    document.getElementById('productFormContainer').classList.remove('active');
    document.getElementById('productForm').reset();
}

function handleAddProduct(e) {
    e.preventDefault();
    
    if (!currentUser || !userProfile?.isSeller) {
        showAlert('You must be a subscribed seller to add products', 'error');
        return;
    }
    
    const formData = new FormData(e.target);
    const images = formData.getAll('images');
    
    if (images.length === 0 || !images[0].name) {
        showAlert('Please select at least one product image', 'error');
        return;
    }
    
    // Create image URL (in real app, upload to cloud storage)
    const imageUrl = URL.createObjectURL(images[0]);
    
    const newProduct = {
        id: 'prod_' + Date.now(),
        title: formData.get('title'),
        description: formData.get('description'),
        price: parseFloat(formData.get('price')).toFixed(2),
        category: formData.get('category'),
        condition: formData.get('condition'),
        stock: parseInt(formData.get('stock')),
        weight: parseFloat(formData.get('weight')) || 0,
        shippingTime: formData.get('shippingTime'),
        brand: formData.get('brand') || '',
        image: imageUrl,
        sellerId: currentUser.id,
        sellerName: userProfile.displayName,
        isActive: true,
        rating: 0,
        reviews: 0,
        shipping: getShippingText(formData.get('shippingTime')),
        createdAt: new Date()
    };
    
    products.push(newProduct);
    
    // Update category counts
    const category = categories.find(c => c.id === newProduct.category);
    if (category) category.count++;
    
    showAlert('Product added successfully!', 'success');
    hideProductForm();
    loadSellerDashboard();
    renderCategories();
    applyFilters();
}

function getShippingText(shippingTime) {
    const shippingMap = {
        '1-2': 'FREE overnight shipping',
        '3-5': 'FREE shipping in 3-5 days',
        '5-7': 'FREE shipping in 5-7 days',
        '7-14': 'FREE shipping in 1-2 weeks',
        '14+': 'Standard shipping (2+ weeks)'
    };
    return shippingMap[shippingTime] || 'Shipping calculated by seller';
}

function toggleProductStatus(productId, isActive) {
    const product = products.find(p => p.id === productId);
    if (product) {
        product.isActive = isActive;
        showAlert(`Product ${isActive ? 'activated' : 'deactivated'} successfully`, 'success');
        loadSellerDashboard();
        applyFilters();
    }
}

// ======================
// SUBSCRIPTION FUNCTIONS
// ======================
function showSubscriptionModal() {
    showModal('subscriptionModal');
}

function handleSubscription() {
    if (!currentUser) {
        showAlert('Please sign in to subscribe', 'error');
        return;
    }
    
    // Simulate subscription process
    userProfile.isSeller = true;
    userProfile.isSubscribed = true;
    
    // Update user in storage
    const userIndex = users.findIndex(u => u.id === currentUser.id);
    if (userIndex !== -1) {
        users[userIndex] = userProfile;
    }
    
    showAlert('Subscription activated! Welcome to WEB VTEC sellers!', 'success');
    hideModal('subscriptionModal');
    toggleSellerDashboard();
}

// ======================
// SEARCH & FILTER FUNCTIONS
// ======================
function handleSearch(e) {
    e.preventDefault();
    const query = document.getElementById('searchInput').value.trim().toLowerCase();
    
    if (!query) {
        renderProducts(products.filter(p => p.isActive !== false));
        return;
    }
    
    const filteredProducts = products.filter(product => 
        (product.isActive !== false) && (
            product.title.toLowerCase().includes(query) ||
            product.description.toLowerCase().includes(query) ||
            product.category.toLowerCase().includes(query) ||
            product.sellerName.toLowerCase().includes(query)
        )
    );
    
    renderProducts(filteredProducts);
    showAlert(`Found ${filteredProducts.length} products for "${query}"`, 'info');
}

function filterByCategory(categoryId) {
    document.getElementById('categoryFilter').value = categoryId;
    applyFilters();
}

function applyFilters() {
    let filteredProducts = products.filter(p => p.isActive !== false);
    
    // Category filter
    const categoryFilter = document.getElementById('categoryFilter').value;
    if (categoryFilter) {
        filteredProducts = filteredProducts.filter(product => 
            product.category === categoryFilter
        );
    }
    
    // Price filter
    const priceFilter = document.getElementById('priceFilter').value;
    if (priceFilter) {
        const [min, max] = priceFilter.split('-');
        filteredProducts = filteredProducts.filter(product => {
            const price = parseFloat(product.price);
            if (max) {
                return price >= parseFloat(min) && price <= parseFloat(max);
            } else {
                return price >= parseFloat(min);
            }
        });
    }
    
    // Sort filter
    const sortFilter = document.getElementById('sortFilter').value;
    switch (sortFilter) {
        case 'price-low':
            filteredProducts.sort((a, b) => parseFloat(a.price) - parseFloat(b.price));
            break;
        case 'price-high':
            filteredProducts.sort((a, b) => parseFloat(b.price) - parseFloat(a.price));
            break;
        case 'rating':
            filteredProducts.sort((a, b) => (b.rating || 0) - (a.rating || 0));
            break;
        case 'newest':
            filteredProducts.sort((a, b) => new Date(b.createdAt) - new Date(a.createdAt));
            break;
        default: // featured
            break;
    }
    
    renderProducts(filteredProducts);
}

// ======================
// UTILITY FUNCTIONS
// ======================
function showModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
        modal.classList.add('active');
        document.body.style.overflow = 'hidden';
    }
}

function hideModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
        modal.classList.remove('active');
        document.body.style.overflow = '';
    }
}

function handleModalOutsideClick(e) {
    if (e.target.classList.contains('modal') && e.target.classList.contains('active')) {
        e.target.classList.remove('active');
        document.body.style.overflow = '';
    }
}

function showAlert(message, type = 'info') {
    const alert = document.createElement('div');
    alert.className = `alert alert-${type} show`;
    
    const icon = type === 'success' ? 'check-circle' : 
                type === 'error' ? 'exclamation-triangle' : 
                type === 'info' ? 'info-circle' : 'bell';
    
    alert.innerHTML = `
        <i class="fas fa-${icon}"></i>
        <span>${message}</span>
    `;
    
    document.body.appendChild(alert);
    
    setTimeout(() => {
        alert.classList.remove('show');
        setTimeout(() => {
            if (alert.parentNode) {
                alert.parentNode.removeChild(alert);
            }
        }, 300);
    }, 4000);
}

console.log('WEB VTEC initialized successfully!');
</script>
 
    
</body>
</html>
