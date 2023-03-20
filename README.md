Project Title
Pizza Restaurant Tracker API

Introduction
The Pizza Restaurant Tracker API is an application that allows users to keep track of their favorite pizza restaurants and their menu. It is a Ruby on Rails API backend with at least three resources.

Requirements
Create a Rails API backend.
Have at least three resources (three DB tables).
Project Setup
Create a new Rails project.
Create a new GitHub repository (NB: ENSURE IT IS PRIVATE).
Add your TM as a contributor to the project.
Ensure you regularly commit to the repository.
Guidelines
Models
You need to create the following relationships:

A Restaurant has many Pizzas through RestaurantPizza
A Pizza has many Restaurants through RestaurantPizza
A RestaurantPizza belongs to a Restaurant and belongs to a Pizza
Start by creating the models and migrations for the following database tables:

markdown
Copy code
- restaurants
  - id: integer
  - name: string
  - address: string

- pizzas
  - id: integer
  - name: string
  - ingredients: string

- restaurant_pizzas
  - id: integer
  - restaurant_id: integer
  - pizza_id: integer
  - price: decimal(8,2)
Add any code needed in the model files to establish the relationships. Then, run the migrations.

You are welcome to generate your own seed data to test the application.

Validations
Add validations to the RestaurantPizza model:

must have a price between 1 and 30
Routes
Set up the following routes. Make sure to return JSON data in the format specified along with the appropriate HTTP verb.

GET /restaurants: Return JSON data in the format below:
css
Copy code
[  {    "id": 1,    "name": "Sottocasa NYC",    "address": "298 Atlantic Ave, Brooklyn, NY 11201"  },  {    "id": 2,    "name": "PizzArte",    "address": "69 W 55th St, New York, NY 10019"  }]
GET /restaurants/:id: If the Restaurant exists, return JSON data in the format below:
json
Copy code
{
  "id": 1,
  "name": "Sottocasa NYC",
  "address": "298 Atlantic Ave, Brooklyn, NY 11201",
  "pizzas": [
    {
      "id": 1,
      "name": "Cheese",
      "ingredients": "Dough, Tomato Sauce, Cheese"
    },
    {
      "id": 2,
      "name": "Pepperoni",
      "ingredients": "Dough, Tomato Sauce, Cheese, Pepperoni"
    }
  ]
}
If the Restaurant does not exist, return the following JSON data, along with the appropriate HTTP status code:

json
Copy code
{
  "error": "Restaurant not found"
}
DELETE /restaurants/:id: If the Restaurant exists, it should be removed from the database, along with any RestaurantPizzas that are associated with it (a RestaurantPizza belongs to a Restaurant, so you need to delete the RestaurantPizzas before the Restaurant can be deleted).
After deleting the Restaurant, return an empty response body, along with the appropriate HTTP status code.

If the Restaurant does not exist, return the following JSON data, along with the appropriate HTTP status code:

json
Copy code
{
  "error": "Restaurant not found"
}

