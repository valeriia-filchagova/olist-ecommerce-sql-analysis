-- =========================================
-- DATA EXPLORATION
-- =========================================

-- Number of customers
SELECT COUNT(*) AS number_of_customers
FROM customers;

-- Number of orders
SELECT COUNT(*) AS number_of_orders
FROM orders;

-- Number of order items
SELECT COUNT(*) AS number_of_order_items
FROM order_items;

-- Number of products
SELECT COUNT(*) AS number_of_products
FROM products;

-- Number of payment records
SELECT COUNT(*) AS number_of_payments
FROM payments;

-- Number of product categories
SELECT COUNT(*) AS number_of_categories
FROM category_translation;

-- Order status distribution
select order_status,
count (*) as number_of_orders
from orders
group by order_status 
order by number_of_orders desc;

-- Date range of orders
select min (order_purchase_timestamp) as first_order_date,
max (order_purchase_timestamp) as last_order_date
from orders;

-- Missing delivery dates
select
count (*) as number_of_missing_delivery_dates
from orders
where order_delivered_customer_date is null;

select order_status,
order_delivered_customer_date
from orders
where order_status = 'canceled'
limit 20;

select count(*) as empty_delivery_dates
from orders
where order_delivered_customer_date = '';

-- Order statuses for missing delivery dates
select order_status,
count (*) as number_of_orders
from orders 
where order_delivered_customer_date is null
group by order_status
order by number_of_orders desc;
-- Note: 8 delivered orders have no recorded delivery date

-- Delivered orders with missing delivery dates
select order_id, 
order_status,
order_purchase_timestamp,
order_delivered_customer_date
from orders 
where order_status = 'delivered' and order_delivered_customer_date is null;

-- Check order_id uniqueness
select
count (*) as number_of_orders,
count (distinct order_id) as unique_order_ids
from orders; 

-- Compare customer IDs and unique customers
select 
count (customer_id) as number_of_customer_ids,
count (distinct customer_unique_id) as unique_customers
from customers;

-- Check orders in November 2016
select 
count (*) as number_of_orders
from orders
where order_purchase_timestamp >= '2016-11-01' 
and order_purchase_timestamp < '2016-12-01';





