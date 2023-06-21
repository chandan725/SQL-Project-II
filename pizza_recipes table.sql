use pizza_runner
DROP TABLE IF EXISTS pizza_recipes;

CREATE TABLE pizza_recipes(pizza_id INTEGER, toppings varchar(50));

INSERT INTO pizza_recipes(pizza_id, toppings) VALUES(1, '1, 2, 3, 4, 5, 6, 8, 10'), (2, '4, 6, 7, 9, 11, 12');

select * from pizza_recipes 


select pizza_id, trim(value) as topping_id from pizza_recipes cross apply string_split(toppings, ',');

DROP TABLE IF EXISTS pizza_recipes_dummy;
create table pizza_recipes_dummy (pizza_id int, topping_id varchar(20))


insert into pizza_recipes_dummy 
select pizza_id, ltrim(trim(value)) as topping_id from pizza_recipes cross apply string_split(toppings, ',')

truncate table pizza_recipes


insert into pizza_recipes select * from pizza_recipes_dummy


drop table pizza_recipes_dummy

select * from pizza_recipes

alter table pizza_recipes alter column toppings int

