# SQL-Project-II
__Pizza Runner Case Study (source: https://8weeksqlchallenge.com/case-study-2/)__
### Available Data
All datasets exist within the ___pizza_runner___ database schema - be sure to include this reference within your SQL scripts as you start exploring the data and answering the case study questions.

  __Entity Relationship Diagram__
  
  ![Screenshot (19)](https://github.com/chandan725/SQL-Project-II/assets/108787425/0ac14223-895a-483d-8c61-7fdee843b949)

  __Table 1: runners__
  
  The runners table shows the ___registration_date___ for each new runner.
  
  __Table 2: customer_orders__

Customer pizza orders are captured in the ___customer_orders___ table with 1 row for each individual pizza that is part of the order.

The ___pizza_id___ relates to the type of pizza which was ordered whilst the ___exclusions___ are the ___ingredient_id___ values which should be removed from the pizza and the ___extras___ are the ___ingredient_id___ values which need to be added to the pizza.

Note that customers can order multiple pizzas in a single order with varying ___exclusions___ and ___extras___ values even if the pizza is the same type!

The ___exclusions___ and ___extras___ columns will need to be cleaned up before using them in your queries.

__Table 3: runner_orders__

After each orders are received through the system - they are assigned to a runner - however not all orders are fully completed and can be cancelled by the restaurant or the customer.

The ___pickup_time___ is the timestamp at which the runner arrives at the Pizza Runner headquarters to pick up the freshly cooked pizzas. The ___distance___ and ___duration___ fields are related to how far and long the runner had to travel to deliver the order to the respective customer.

__There are some known data issues with this table so be careful when using this in your queries - make sure to check the data types for each column in the schema SQL!__

__Table 4: pizza_names__

At the moment - Pizza Runner only has 2 pizzas available the ___Meat Lovers___ or ___Vegetarian!___

__Table 5: pizza_recipes__

Each ___pizza_id___ has a standard set of ___toppings___ which are used as part of the pizza recipe.

__Table 6: pizza_toppings__

This table contains all of the ___topping_name___ values with their corresponding ___topping_id___ value

### Case Study Questions
This case study has LOTS of questions - they are broken up by area of focus including:

1. Pizza Metrics
2. Runner and Customer Experience
3. Ingredient Optimisation
4. Pricing and Ratings
5. Bonus DML Challenges (DML = Data Manipulation Language)

Each of the following case study questions can be answered using a single SQL statement.

___Before you start writing your SQL queries however - you might want to investigate the data, you may want to do something with some of those null values and data types in the customer_orders and runner_orders tables!___

### A. Pizza Metrics
1. How many pizzas were ordered?
2. How many unique customer orders were made?
3. How many successful orders were delivered by each runner?
4. How many of each type of pizza was delivered?
5. How many Vegetarian and Meatlovers were ordered by each customer?
6. What was the maximum number of pizzas delivered in a single order?
7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
8. How many pizzas were delivered that had both exclusions and extras?
9. What was the total volume of pizzas ordered for each hour of the day?
10. What was the volume of orders for each day of the week?

### B. Runner and Customer Experience
1. How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)
2. What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?
3. Is there any relationship between the number of pizzas and how long the order takes to prepare?
4. What was the average distance travelled for each customer?
5. What was the difference between the longest and shortest delivery times for all orders?
6. What was the average speed for each runner for each delivery and do you notice any trend for these values?
7. What is the successful delivery percentage for each runner?

### C. Ingredient Optimisation
1. What are the standard ingredients for each pizza?
2. What was the most commonly added extra?
3. What was the most common exclusion?
4. Generate an order item for each record in the customers_orders table in the format of one of the following:
   
   Meat Lovers
   
   Meat Lovers - Exclude Beef
   
   Meat Lovers - Extra Bacon
   
   Meat Lovers - Exclude Cheese, Bacon - Extra Mushroom, Peppers
   
6. Generate an alphabetically ordered comma separated ingredient list for each pizza order from the customer_orders table and add a 2x in front of any relevant ingredients

   For example: "Meat Lovers: 2xBacon, Beef, ... , Salami"
7. What is the total quantity of each ingredient used in all delivered pizzas sorted by most frequent first?

### D. Pricing and Ratings
1. If a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges for changes - how much money has Pizza Runner made so far if there are no delivery fees?
2. What if there was an additional $1 charge for any pizza extras?
 
   Add cheese is $1 extra
3. The Pizza Runner team now wants to add an additional ratings system that allows customers to rate their runner, how would you design an additional table for this new dataset - generate a schema for this new table and insert your own data for ratings for each successful customer order between 1 to 5.
4. Using your newly generated table - can you join all of the information together to form a table which has the following information for successful deliveries?
   
 customer_id

 order_id

 runner_id

 rating

 order_time

 pickup_time

 Time between order and pickup

 Delivery duration

 Average speed

 Total number of pizzas

6. If a Meat Lovers pizza was $12 and Vegetarian $10 fixed prices with no cost for extras and each runner is paid $0.30 per kilometre traveled - how much money does Pizza Runner have left over after these deliveries?

### E. Bonus Questions

If Danny wants to expand his range of pizzas - how would this impact the existing data design? Write an INSERT statement to demonstrate what would happen if a new Supreme pizza with all the toppings was added to the Pizza Runner menu?







