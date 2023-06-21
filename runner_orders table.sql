use pizza_runner
DROP TABLE IF EXISTS runner_orders;

CREATE TABLE runner_orders (    "order_id" INTEGER,
			        "runner_id" INTEGER,
				"pickup_time" VARCHAR(20),
				"distance" VARCHAR(20),
				 "duration" VARCHAR(20),
				 "cancellation" VARCHAR(30));

INSERT INTO runner_orders  ("order_id", "runner_id", "pickup_time", "distance", "duration", "cancellation")
VALUES ('1', '1', '2020-01-01 18:15:34', '20km', '32 minutes', ''),
       ('2', '1', '2020-01-01 19:10:54', '20km', '27 minutes', ''),
       ('3', '1', '2020-01-03 00:12:37', '13.4km', '20 mins', NULL),
       ('4', '2', '2020-01-04 13:53:03', '23.4', '40', NULL),
       ('5', '3', '2020-01-08 21:10:57', '10', '15', NULL),
       ('6', '3', 'null', 'null', 'null', 'Restaurant Cancellation'),
       ('7', '2', '2020-01-08 21:30:45', '25km', '25mins', 'null'),
       ('8', '2', '2020-01-10 00:15:02', '23.4 km', '15 minute', 'null'),
       ('9', '2', 'null', 'null', 'null', 'Customer Cancellation'),
       ('10', '1', '2020-01-11 18:50:20', '10km', '10minutes', 'null');

select * from runner_orders

select order_id, runner_id, 
case when pickup_time = 'null' then '' else pickup_time end as pickup_time,
case when distance = 'null' then ''
when distance like '%km' then trim('km' from distance)
else distance end as distance,
case when duration = 'null' then '' else substring(duration, 1, 2) end as duration,
case when cancellation = 'null' or cancellation = '' or cancellation is null then '' else cancellation end as cancellation
from runner_orders

DROP TABLE IF EXISTS runner_orders_dummy
CREATE TABLE runner_orders_dummy ( "order_id" INTEGER,
				  "runner_id" INTEGER,
				  "pickup_time" datetime,
				  "distance" VARCHAR(7),
				  "duration" VARCHAR(10),
				  "cancellation" VARCHAR(30));

INSERT INTO runner_orders_dummy  ("order_id", "runner_id", "pickup_time", "distance", "duration", "cancellation")
select order_id, runner_id, 
case when pickup_time = 'null' then '' else pickup_time end as pickup_time,
case when distance = 'null' then ''
when distance like '%km' then trim('km' from distance)
else distance end as distance,
case when duration = 'null' then '' else substring(duration, 1, 2) end as duration,
case when cancellation = 'null' or cancellation = '' or cancellation is null then '' else cancellation end as cancellation
from runner_orders


select * from runner_orders_dummy

truncate table runner_orders

insert into runner_orders
select * from runner_orders_dummy

alter table runner_orders alter column pickup_time datetime
alter table runner_orders alter column distance float
alter table runner_orders alter column duration int

select * from runner_orders

drop table runner_orders_dummy
