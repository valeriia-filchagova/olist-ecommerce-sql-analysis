-- =========================================
-- CUSTOMER ANALYSIS
-- =========================================

-- How many unique customers placed orders?
select 
count (distinct customer_unique_id) as unique_customers
from customers;

-- How many customers placed more than one order?
with repeat_customers as (select 
c.customer_unique_id as  unique_customers,
count (o.order_id) as number_of_orders
from customers as c
inner join orders as o
on c.customer_id = o.customer_id
group by c.customer_unique_id
having count (o.order_id) > 1)
select
count (*) as number_of_repeat_customers
from repeat_customers;

with repeat_customers as (select 
c.customer_unique_id as  unique_customers,
count (o.order_id) as number_of_orders
from customers as c
inner join orders as o
on c.customer_id = o.customer_id
group by c.customer_unique_id
having count (o.order_id) > 1)
select
count (*) * 100.0 /
(select count(distinct customer_unique_id) from customers) as repeat_customer_percentage
from repeat_customers;

-- Repeat customer rate: 3.12%
-- Only 3.12% of unique customers placed more than one order

-- How many orders does a customer place on average?
with customer_orders as (
select 
c.customer_unique_id, 
count (o.order_id) as number_of_orders
from customers as c
inner join orders as o
on c.customer_id = o.customer_id 
group by c.customer_unique_id)
select 
round (avg (number_of_orders), 2) as avg_orders_per_customer
from customer_orders;

-- Top 10 Most Active Customers
with customer_orders as (
select 
c.customer_unique_id, 
count (o.order_id) as number_of_orders
from customers as c
inner join orders as o
on c.customer_id = o.customer_id 
group by c.customer_unique_id)
select 
customer_unique_id,
number_of_orders
from customer_orders
order by number_of_orders  desc
limit 10;