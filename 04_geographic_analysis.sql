-- Top 10 states by unique customers
select customer_state, 
count (distinct customer_unique_id) as total_customers
from customers 
group by customer_state
order by total_customers desc
limit 10;

-- Top 10 Customers by Total Spending
with customers_total_spending as (
select 
c.customer_unique_id,
sum(oi.price) AS total_spending
from customers as c
inner join orders as o
on c.customer_id = o.customer_id 
inner join order_items as oi
on o.order_id = oi.order_id
group by c.customer_unique_id)
select 
customer_unique_id,
total_spending
from customers_total_spending
order by total_spending  desc
limit 10;

-- Average Spending per Customer
with customers_total_spending as (
select 
c.customer_unique_id,
sum(oi.price) AS total_spending
from customers as c
inner join orders as o
on c.customer_id = o.customer_id 
inner join order_items as oi
on o.order_id = oi.order_id
group by c.customer_unique_id)
select
round(avg(total_spending)::numeric, 2) as avg_customer_spending
from customers_total_spending;

-- Which states generate the highest revenue?
select 
c.customer_state,
sum (oi.price) as total_spending
from customers as c
inner join orders as o
on c.customer_id = o.customer_id 
inner join order_items as oi
on o.order_id = oi.order_id
where o.order_status = 'delivered'
group by c.customer_state
order by total_spending desc
limit 10;

-- Top 10 Cities by Revenue
select 
c.customer_city,
sum (oi.price) as total_spending
from customers as c
inner join orders as o
on c.customer_id = o.customer_id 
inner join order_items as oi
on o.order_id = oi.order_id
where o.order_status = 'delivered'
group by c.customer_city
order by total_spending desc
limit 10;

-- Average Order Value by State
select 
c.customer_state,
round((sum(oi.price) / count (distinct o.order_id))::numeric, 2) as avg_order_value 
from customers as c
inner join orders as o
on c.customer_id = o.customer_id 
inner join order_items as oi
on o.order_id = oi.order_id
where o.order_status = 'delivered'
group by c.customer_state
order by avg_order_value desc;
