use pizza_runner
DROP TABLE IF EXISTS customer_orders;

CREATE TABLE customer_orders (
  "order_id" INTEGER,
  "customer_id" INTEGER,
  "pizza_id" INTEGER,
  "exclusions" VARCHAR(10),
  "extras" VARCHAR(10),
  "order_time" DATETIME);

INSERT INTO customer_orders  ("order_id", "customer_id", "pizza_id", "exclusions", "extras", "order_time")
VALUES  ('1', '101', '1', '', '', '2020-01-01 18:05:02'),
        ('2', '101', '1', '', '', '2020-01-01 19:00:52'),
        ('3', '102', '1', '', '', '2020-01-02 23:51:23'),
        ('3', '102', '2', '', NULL, '2020-01-02 23:51:23'),
        ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
        ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
        ('4', '103', '2', '4', '', '2020-01-04 13:23:46'),
        ('5', '104', '1', 'null', '1', '2020-01-08 21:00:29'),
        ('6', '101', '2', 'null', 'null', '2020-01-08 21:03:13'),
        ('7', '105', '2', 'null', '1', '2020-01-08 21:20:29'),
        ('8', '102', '1', 'null', 'null', '2020-01-09 23:54:33'),
        ('9', '103', '1', '4', '1, 5', '2020-01-10 11:22:59'),
        ('10', '104', '1', 'null', 'null', '2020-01-11 18:34:49'),
        ('10', '104', '1', '2, 6', '1, 4', '2020-01-11 18:34:49');

select * from customer_orders
/*
select order_id, customer_id, pizza_id, trim(c1.value) as exclusions, trim(c2.value) as extras, order_time from customer_orders
cross apply (select value from string_split(customer_orders.exclusions, ',')) c1
cross apply (select value from string_split(customer_orders.extras, ',')) c2
*/
DROP TABLE IF EXISTS customer_orders_dummy;
CREATE TABLE customer_orders_dummy (  "order_id" INTEGER,
									  "customer_id" INTEGER,
									  "pizza_id" INTEGER,
									  "exclusions" VARCHAR(10),
									  "extras" VARCHAR(10),
									  "order_time" DATETIME);

select * from customer_orders_dummy

insert into customer_orders_dummy
select order_id, customer_id, pizza_id,
case when exclusions like 'null' or exclusions = '' then '' else exclusions end as exclusions,
case when extras like 'null' or extras = '' or extras is null then '' else extras end as extras,
order_time from customer_orders

select * from customer_orders_dummy


truncate table customer_orders

insert into customer_orders
select * from customer_orders_dummy

select * from customer_orders

drop table customer_orders_dummy


