# SQL-Project-II
__Pizza Runner Case Study (source: https://8weeksqlchallenge.com/case-study-2/)__
### Available Data
All datasets exist within the ___pizza_runner___ database schema - be sure to include this reference within your SQL scripts as you start exploring the data and answering the case study questions.

  __Entity Relationship Diagram__
  
  ![Screenshot (19)](https://github.com/chandan725/SQL-Project-II/assets/108787425/0ac14223-895a-483d-8c61-7fdee843b949)

  __Table 1: runners__
  
  The runners table shows the registration_date for each new runner.
  
  __Table 2: customer_orders__

Customer pizza orders are captured in the customer_orders table with 1 row for each individual pizza that is part of the order.

The pizza_id relates to the type of pizza which was ordered whilst the exclusions are the ingredient_id values which should be removed from the pizza and the extras are the ingredient_id values which need to be added to the pizza.

Note that customers can order multiple pizzas in a single order with varying exclusions and extras values even if the pizza is the same type!

The exclusions and extras columns will need to be cleaned up before using them in your queries.

__Table 3: runner_orders__

After each orders are received through the system - they are assigned to a runner - however not all orders are fully completed and can be cancelled by the restaurant or the customer.

The pickup_time is the timestamp at which the runner arrives at the Pizza Runner headquarters to pick up the freshly cooked pizzas. The distance and duration fields are related to how far and long the runner had to travel to deliver the order to the respective customer.

There are some known data issues with this table so be careful when using this in your queries - make sure to check the data types for each column in the schema SQL!

__Table 4: pizza_names__

At the moment - Pizza Runner only has 2 pizzas available the Meat Lovers or Vegetarian!

__Table 5: pizza_recipes__

Each pizza_id has a standard set of toppings which are used as part of the pizza recipe.

__Table 6: pizza_toppings__

This table contains all of the topping_name values with their corresponding topping_id value

### Case Study Questions






