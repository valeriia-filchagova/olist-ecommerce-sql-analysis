-- Replace empty delivery dates with null
update orders
set order_delivered_customer_date = null
where order_delivered_customer_date = '';

select count (*)
from orders
where order_delivered_customer_date = '';

select count (*)
from orders
where order_delivered_customer_date is null;

-- Convert delivery date from text to timestamp
alter table orders
alter column order_delivered_customer_date
type timestamp
using order_delivered_customer_date::timestamp;

-- Check empty values in date columns
slect
count(*) filter (where order_purchase_timestamp = '') as empty_purchase_dates,
count(*) filter (where order_approved_at = '') as empty_approved_dates,
count(*) filter (where order_delivered_carrier_date = '') as empty_carrier_dates,
count(*) filter (where order_estimated_delivery_date = '') as empty_estimated_dates
from orders;

-- Replace empty strings wuth null
update orders 
set order_approved_at = null
where order_approved_at = '';

update orders o 
set order_delivered_carrier_date = null
where order_delivered_carrier_date = '';

-- Convert remaining date columns to timestamp
alter table orders 
alter column order_purchase_timestamp
type timestamp
using order_purchase_timestamp::timestamp;

alter table orders 
alter column order_approved_at
type timestamp
using order_approved_at::timestamp;

alter table orders 
alter column order_delivered_carrier_date
type timestamp
using order_delivered_carrier_date::timestamp;

alter table orders 
alter column order_estimated_delivery_date
type timestamp
using order_estimated_delivery_date::timestamp;