-- =========================================
-- SALES ANALYSIS
-- =========================================

-- Total product revenue
select sum(price) as total_revenue
from order_items;

select sum(oi.price) as delivered_revenue
from orders as o
inner join order_items as oi
on oi.order_id = o.order_id
where o.order_status = 'delivered';

select o.order_id,
sum (oi.price) as order_total
from orders as o
inner join order_items as oi
on oi.order_id = o.order_id
where o.order_status = 'delivered'
group by o.order_id;

with order_totals as (select o.order_id,
sum (oi.price) as order_total
from orders as o
inner join order_items as oi
on oi.order_id = o.order_id
where o.order_status = 'delivered'
group by o.order_id)
select AVG(order_total) as average_order_value
from order_totals;

-- Monthly revenue from delivered orders
select 
date_trunc('month', o.order_purchase_timestamp) as month,
sum(oi.price) as monthly_revenue
from orders as o
inner join order_items as oi
on o.order_id = oi.order_id
where o.order_status = 'delivered'
group by month
order by month;

-- Number of delivered orders by month
select 
date_trunc('month', order_purchase_timestamp) as month,
count (*) as number_of_orders
from orders
where order_status = 'delivered'
group by month
order by month;

-- Average order value by month
with order_total as (select
date_trunc('month', o.order_purchase_timestamp) as month,
o.order_id,
sum(oi.price) AS order_total
from orders as o 
inner join order_items as oi
on o.order_id = oi.order_id
where o.order_status = 'delivered'
group by month, o.order_id
order by month)
select month,
avg(order_total) as average_order_value
from order_total
group by month;

-- Product category performance: revenue, sales volume, and average price
with delivered_items as (select 
o.order_id,
oi.price,
oi.product_id
from orders as o
inner join order_items as oi
on o.order_id = oi.order_id
where o.order_status = 'delivered')
select
coalesce(ct.product_category_name_english, 'Unknown') AS category,
sum(price) as category_revenue,
count(*) as items_sold,
round(avg(price)::numeric) as average_item_price
from delivered_items as di
left join products as p
on p.product_id = di.product_id
left join category_translation as ct
on ct.product_category_name = p.product_category_name
group by category
order by category_revenue desc;

-- Data qulity 
select 
count (*) as total_delivered_items
from orders as o 
inner join order_items as oi
on o.order_id = oi.order_id
where order_status = 'delivered';

-- Data quality findings:
-- 1,559 delivered order items (1.41%) have no product category.
-- These items represent 175,967.02 in revenue (approximately 1.33%).
-- Missing categories are labeled as 'Unknown' to preserve revenue.