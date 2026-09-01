# Enterprise Data Dictionary

## Table: `users`
Stores system accounts including platform administrators and retail customers.

| Column | Data Type | Constraints | Business Meaning |
|---|---|---|---|
| `id` | `BIGSERIAL` | `PRIMARY KEY` | Unique auto-incrementing user identification key |
| `email` | `VARCHAR(255)` | `UNIQUE, NOT NULL` | Verified user email address used for identity |
| `password_hash` | `VARCHAR(255)` | `NOT NULL` | Argon2/Bcrypt hashed credential |
| `role` | `VARCHAR(50)` | `NOT NULL, CHECK` | Account system privilege level (`admin`, `customer`) |
| `created_at` | `TIMESTAMPTZ` | `NOT NULL, DEFAULT NOW()` | Account creation epoch |

## Table: `products`
Defines items available for sale within the platform catalog.

| Column | Data Type | Constraints | Business Meaning |
|---|---|---|---|
| `id` | `BIGSERIAL` | `PRIMARY KEY` | Unique product identifier |
| `sku` | `VARCHAR(100)` | `UNIQUE, NOT NULL` | Stock Keeping Unit code |
| `name` | `VARCHAR(255)` | `NOT NULL` | Display name of the product |
| `category_id` | `INT` | `FOREIGN KEY` | Category relation identifier |
| `price` | `NUMERIC(12, 2)`| `NOT NULL, CHECK (>0)` | Base unit price in system currency |
| `stock_quantity` | `INT` | `NOT NULL, CHECK (>=0)`| Live units in warehouse |

## Table: `orders`
Header table for customer purchasing transactions.

| Column | Data Type | Constraints | Business Meaning |
|---|---|---|---|
| `id` | `BIGSERIAL` | `PRIMARY KEY` | Unique order tracking number |
| `user_id` | `BIGINT` | `FOREIGN KEY` | Reference to purchasing `users.id` |
| `status` | `VARCHAR(50)` | `NOT NULL` | Lifecycle state (`pending`, `paid`, `shipped`, `delivered`) |
| `total_amount` | `NUMERIC(12, 2)`| `NOT NULL` | Sum total of line items plus taxes/shipping |
| `created_at` | `TIMESTAMPTZ` | `NOT NULL, DEFAULT NOW()` | Order placement timestamp |

## Table: `order_items`
Line-item specifics associated with distinct transaction records.

| Column | Data Type | Constraints | Business Meaning |
|---|---|---|---|
| `id` | `BIGSERIAL` | `PRIMARY KEY` | Unique line-item key |
| `order_id` | `BIGINT` | `FOREIGN KEY` | Reference to parent `orders.id` |
| `product_id` | `BIGINT` | `FOREIGN KEY` | Reference to catalog `products.id` |
| `unit_price` | `NUMERIC(12, 2)`| `NOT NULL` | Historical unit price at time of checkout |
| `quantity` | `INT` | `NOT NULL, CHECK (>0)` | Volume of item purchased |
