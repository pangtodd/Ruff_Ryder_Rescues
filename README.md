# README
# Ruff Ryders Rescues

#### By Todd Pangilinan

API for a pet shelter

## Technologies used:

* Ruby (developed with 2.6.5)
* Rails (developed with 5.2.8)
* RSPEC
* Swagger
* Factorybot
* Faker
* Pry
* markdown
* Postgres
* SQL


## Description:
Using Ruby on Rails and Postgres, this is an API for rescue animals who need to be adopted. Via CURL or Postman, users can interact with this API to look up, create, modify or delete pet entries (full CRUD functionality). Dummy entries can be added to the database via faker (see instructions below). This is not neccessary for testing, Factory bot is also incorporated.

## Setup/Installation Requirements
### general setup:
* If you don't have git installed on your machine, follow these [instructions.](https://www.learnhowtoprogram.com/introduction-to-programming/getting-started-with-intro-to-programming/git-and-github)
* Via your terminmal, navigate to the directory you want to store my files in.
* Clone my git hub directory by typing or cutting pasting: "git clone https://github.com/pangtodd/Ruff_Ryder_Rescues.git" into your terminal
* To run this program, you must have Ruby 2.6.5 and Rails 5.2.0 installed on your machine. If you do not, you can follow these instructions: [Mac](https://www.learnhowtoprogram.com/ruby-and-rails-part-time/getting-started-with-ruby/installing-ruby-on-mac) or [PC](https://www.learnhowtoprogram.com/ruby-and-rails-part-time/getting-started-with-ruby/installing-ruby-on-windows).
* Once you have the project downloaded, navigate to the root of the project in your terminal and type "bundle install".
* you will also need Postgres installed on your machine. If you do not, you can follow these [instructions.](https://www.learnhowtoprogram.com/ruby-and-rails-part-time/getting-started-with-ruby/installing-postgres)
* In the terminal at the root of the project, type "Postgres" to make sure Postgres is running.
### terminal commands after general setup:
* Type "rake db:create"
* Type "rake db:migrate"
* Type "rake db:test:prepare"
* Type "rake db:seed" if you'd like the database populated with dummy/test info. This is not necessary for testing.
* Type "rails s" into your terminal. This should launch Rails.
* Please note, this application was built with a Mac system. You may need to make adjustments (such as creating adding/hiding your Postgres password, or using slightly different commands to launch Postgres) if using a PC.
* In your terminal, type in "rspec" to run established tests and make sure everything is still working as expected (all tests should pass.)
* You can test routes by either using Postman or CURL in your terminal. See section below for API endpoints you can test.
### Swagger setup
* Swagger provides an interactive documentation of API endpoints, accessed via a browswer.
* After setting up the project and getting the server up, go to your terminal and type in "rake rswag:specs:swaggerize"
* In your browswer, go to http://localhost:3000/api-docs 
* from there, you should be able to see all of the end points and try them out, either in the browswer, or by cutting and pasting the Curl commands into your terminal.

## API Endpoints

| Method |Path| example URL | Result|
| :--- |:---| :---| :---|
|GET | `localhost:3000/pets`| `localhost:3000/pets`| Returns a list of all quotes in the database|
|GET | `localhost:3000/pets/:id`| `localhost:3000/pets/38`|Returns all information related to quote with ID=38|
|GET |  `http://localhost:3000/pets?name=:name`|`http://localhost:3000/pets?name=DMX`| Returns all pets in database where name is DMX|
|GET |  `http://localhost:3000/pets?animal_type=:animal_type` |`http://localhost:3000/pets?animal_type=dog` | Returns pets with animal_type "dog"|
|GET |  `http://localhost:3000/pets/random`|`http://localhost:3000/pets/random`| Returns a random pet from the database|
|POST|  `http://localhost:3000/pets/?name=:names&animal_type=:animal_type`|`http://localhost:3000/pets/?name=Swizz Beats&animal_type=cat`|Adds pet to database. name:"Swizz Beats", animal_type: "cat". If POST is succesfull, returns database object for newly created quote.|
|PUT/EDIT| `http://localhost:3000/pets/38?name=:name&animal_type`| `http://localhost:3000/pets/38?name=eve&animal_type=cat`|Updates the pet name and type for entry with ID=38 (now Eve, cat). If PUT/EDIT is succesfull, returns database object for newly updated quote.|
|DELETE| `http://localhost:3000/pets/:id`|`http://localhost:3000/pets/38`|Deletes the quote with ID=38 from database. If DELETE is successful, it returns a success message.|

## Known Bugs

As of 7/2/22:
* While Swagger covers the most important routes, it does not include "search" routes (see next point).
* Search routes are true endpoints- they just allow users to pass in parameters. Wasn't sure if those needed to be documented.
* Random route is also not a true endpoint, it's just the GET route with a conditional (if params[id]== "random"...). But it works.
* Realized when setting up Swagger I needed error handling/exceptions for patch/put routes, ran out of time to set those up.
* no other known bugs.
* If you notice other mistakes or bugs, please email pang.todd@gmail.com

## License

[MIT](https://opensource.org/licenses/MIT)
Copyright 2022 (c) Todd Pangilinan 
