-- solution_b.sql - Truy vấn đơn hàng

-- 1. Liệt kê các hóa đơn của khách hàng
SELECT order_id, user_id, total_amount FROM orders;

-- 2. Liệt kê số lượng các hóa đơn của khách hàng
SELECT user_id, COUNT(order_id) AS total_orders FROM orders GROUP BY user_id;

-- 3. Liệt kê thông tin hóa đơn
SELECT orders.order_id, orders.total_amount, COUNT(order_items.product_id) AS total_items
FROM orders
JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY orders.order_id;

-- 4. Liệt kê thông tin mua hàng của người dùng
SELECT users.user_id, users.name, orders.order_id, products.product_name
FROM users
JOIN orders ON users.user_id = orders.user_id
JOIN order_items ON orders.order_id = order_items.order_id
JOIN products ON order_items.product_id = products.product_id
GROUP BY users.user_id, orders.order_id, products.product_name;

-- 5. Liệt kê người dùng có số lượng đơn hàng nhiều nhất
SELECT user_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY user_id
ORDER BY total_orders DESC
LIMIT 1;

-- 6. Liệt kê 7 người mua sản phẩm có tên chứa 'Samsung' hoặc 'Apple'
SELECT DISTINCT users.user_id, users.name, orders.order_id, products.product_name
FROM users
JOIN orders ON users.user_id = orders.user_id
JOIN order_items ON orders.order_id = order_items.order_id
JOIN products ON order_items.product_id = products.product_id
WHERE products.product_name LIKE '%Samsung%' OR products.product_name LIKE '%Apple%'
LIMIT 7;

-- 7. Liệt kê danh sách mua hàng của user theo tổng giá trị đơn hàng
SELECT users.user_id, users.name, orders.order_id, orders.total_amount
FROM users
JOIN orders ON users.user_id = orders.user_id
ORDER BY orders.total_amount DESC;

-- 8. Liệt kê danh sách mua hàng của user theo tổng giá trị cao nhất mỗi user
SELECT user_id, MAX(total_amount) AS max_order_value FROM orders GROUP BY user_id;

-- 9. Liệt kê danh sách mua hàng có tổng giá trị lớn nhất
SELECT user_id, order_id, total_amount FROM orders ORDER BY total_amount DESC LIMIT 1;

-- 10. Liệt kê danh sách mua hàng có số sản phẩm nhiều nhất
SELECT orders.user_id, orders.order_id, COUNT(order_items.product_id) AS total_products
FROM orders
JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY orders.user_id, orders.order_id
ORDER BY total_products DESC LIMIT 1;
