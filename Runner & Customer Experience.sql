use pizza_runner
select * from runners
select * from runner_orders
alter table runner_orders alter column pickup_time datetime

select * from customer_orders
alter table customer_orders alter column order_time datetime

select * from pizza_names
alter table pizza_names alter column pizza_name varchar(20)

select * from pizza_recipes

select * from pizza_toppings
alter table pizza_toppings alter column topping_name varchar(20)


--1. How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)
select 
sum(case when registration_date between '2021-01-01' and dateadd(day, 6, '2021-01-01') then 1 else 0 end) as week1_runners_count,
sum(case when registration_date between dateadd(day, 7, '2021-01-01') and dateadd(day, 12, '2021-01-01') then 1 else 0 end) as week2_runners_count,
sum(case when registration_date between dateadd(day, 13, '2021-01-01') and dateadd(day, 18, '2021-01-01') then 1 else 0 end) as week3_runners_count
from runners


--2. What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?
select runner_id, round((avg(datediff(SECOND, order_time, pickup_time)))/60.0, 2) as avg_time_in_minute
from runner_orders ro inner join customer_orders co on co.order_id=ro.order_id
where cancellation = ''
group by runner_id

-- runner 3 has delivered only one delivery here, so can be considered as outlier here.
-- Otherwise, (for runner 1 & runner 2), average time to reach HQ to pickup the order is less for runner 1.



--3. Is there any relationship between the number of pizzas and how long the order takes to prepare?
with cte as
		(select co.order_id, count(co.order_id) as no_of_pizza_ordered, datediff(second, order_time, pickup_time)/60.0 as time_diff
		from runner_orders ro inner join customer_orders co on co.order_id=ro.order_id
		where cancellation = ''
		group by co.order_id, datediff(second, order_time, pickup_time)/60.0)
select no_of_pizza_ordered, avg(time_diff) as time_taken_for_prep from cte 
group by no_of_pizza_ordered

-- It's obvious, if 3 pizzas are ordered for an order, it will take more preparation time as compared to 1 or 2 pizzas are ordered



--4. What was the average distance travelled for each customer?
select customer_id, round(avg(distance), 2) as avg_distance_travelled from customer_orders co inner join runner_orders ro on co.order_id=ro.order_id
where cancellation = ''
group by customer_id



--5. What was the difference between the longest and shortest delivery times for all orders?
select max(duration) - min(duration) as diff_longest_shorest
from runner_orders 
where cancellation = ''



--6. What was the average speed for each runner for each delivery and do you notice any trend for these values?
select runner_id, order_id, round(distance/(duration/60.0), 2) as speed_for_each_order,
round(avg(distance/(duration/60.0)) over(partition by runner_id), 2) avg_speed_per_runner
from runner_orders
where cancellation = ''
order  by 1, 2
-- runner 3 has only one delivery here, so can be assumed as outlier here. Otherwise, (for runner 1 & runner 2), avg_speed is inversely related to no. of order


--7. What is the successful delivery percentage for each runner?
select runner_id, sum(case when cancellation = '' then 1 else 0 end) order_delivered,
sum(case when cancellation <> '' then 1 else 0 end) order_failed,
concat(sum(case when cancellation = '' then 1 else 0 end)*100 / (sum(case when cancellation = '' then 1 else 0 end) + sum(case when cancellation <> '' then 1 else 0 end)), '%')
as succesful_deliver_percentage
from runner_orders
group by runner_id





