-- Migration: V2__indexes.sql
-- Description: Performance Optimization Indices

-- Foreign Key Lookup Acceleration
CREATE INDEX idx_products_category ON products(category_id);
CREATE INDEX idx_orders_user ON orders(user_id);
CREATE INDEX idx_order_items_order ON order_items(order_id);
CREATE INDEX idx_order_items_product ON order_items(product_id);

-- Analytical & Filter Optimization (Composite & Partial Indexes)
CREATE INDEX idx_orders_status_created AT ON orders(status, created_at DESC);
CREATE INDEX idx_active_products ON products(id) WHERE stock_quantity > 0;
CREATE INDEX idx_users_email_hash ON users USING hash(email);
