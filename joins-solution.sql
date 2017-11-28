-- addresses and people
SELECT customers.first_name, customers.last_name, addresses.street, addresses.city, addresses.state, addresses.zip FROM
customers
JOIN addresses ON customers.id = addresses.customer_id;

-- Get all orders and their line items.
SELECT * FROM orders 
JOIN line_items ON orders.id = line_items.order_id
-- Which warehouses have cheetos?
SELECT * FROM warehouse w 
JOIN warehouse_product w_p ON w.id=w_p.warehouse_id
JOIN products p ON p.id=w_p.product_id
where p.description = 'cheetos'
-- Which warehouses have diet pepsi?
SELECT * FROM warehouse w 
JOIN warehouse_product w_p ON w.id=w_p.warehouse_id
JOIN products p ON p.id=w_p.product_id
where p.description = 'diet pepsi'
-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT c.*, COUNT(o.id) FROM customers c
JOIN addresses a ON c.id = a.customer_id
JOIN orders o ON a.id = o.address_id
GROUP BY (c.id);
-- How many customers do we have?
SELECT COUNT(c.id) FROM customers c;

-- How many products do we carry?
SELECT COUNT(p.id) from products p;

-- What is the total available on-hand quantity of diet pepsi?

SELECT COUNT(p.id) FROM warehouse w 
JOIN warehouse_product w_p ON w.id=w_p.warehouse_id
JOIN products p ON p.id=w_p.product_id
WHERE p.description = 'diet pepsi';
GROUP BY (p.id) 
