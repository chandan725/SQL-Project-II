use pizza_runner
select * from runners
select * from runner_orders

select * from customer_orders

select * from pizza_names
alter table pizza_names alter column pizza_name varchar(20)

select * from pizza_recipes

select * from pizza_toppings
alter table pizza_toppings alter column topping_name varchar(20)


--1. How many pizzas were ordered?
select count(*) as pizza_ordered from customer_orders 


--2. How many unique customer orders were made?
select count(distinct order_id) as unique_customer_order from customer_orders


--3. How many successful orders were delivered by each runner?
select runner_id, count(*) as delivered_order_count from runner_orders
where cancellation = ''
group by runner_id


--4. How many of each type of pizza was delivered? 
select pizza_name, count(*) as pizza_count from runner_orders ro
inner join customer_orders co on ro.order_id=co.order_id 
inner join pizza_names pn on co.pizza_id=pn.pizza_id
where cancellation = ''
group by pizza_name


--5. How many Vegetarian and Meatlovers were ordered by each customer?
select customer_id, pizza_name, count(pn.pizza_id) as pizza_count from customer_orders co
inner join pizza_names pn on co.pizza_id=pn.pizza_id
group by customer_id, pizza_name
order by 1, 2


--6. What was the maximum number of pizzas delivered in a single order?
select top 1 co.order_id, count(*) as max_pizza_delivered from customer_orders co 
inner join runner_orders ro on co.order_id=ro.order_id
where cancellation = ''
group by co.order_id
order by count(*) desc


--7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes? 
select customer_id,
sum(case when exclusions = '' and extras = '' then 1 else 0 end) as pizza_with_no_change,
sum(case when exclusions = '' and extras = '' then 0 else 1 end) as pizza_with_change
from customer_orders co inner join runner_orders ro on co.order_id=ro.order_id
where cancellation = ''
group by customer_id
order by 1 


--8. How many pizzas were delivered that had both exclusions and extras?
select count(*) as delivered_pizza_with_exclusions_and_extras from customer_orders co inner join runner_orders ro on co.order_id=ro.order_id
where cancellation = '' and exclusions <> '' and extras <> ''


--9. What was the total volume of pizzas ordered for each hour of the day?
select  DATEPART(hour, order_time) as order_hour, count(*) as pizza_ordered_per_hour from customer_orders
group by DATEPART(hour, order_time)


--10. What was the volume of orders for each day of the week?
select CAST(order_time AS DATE) as order_date, DATEPART(DAY, order_time) as order_day,
DATENAME(WEEKDAY, order_time) as order_day_name, count(*) as total_pizza_ordered from customer_orders
group by cast(order_time as date), DATEPART(day, order_time), datename(weekday, order_time)



