# CSVLlama

A web app that takes in a CSV file of N-Rows and spits out the corresponding state of an object based on a user's query parameters (object_type, id & timestamp).

## Live Version
 [https://csvllama.herokuapp.com](https://csvllama.herokuapp.com)

## Planning
![CSV Trello Kanban](http://i.imgur.com/xYZ3Bd4.png)
Broke down the project into pieces and listed all todos using Trello kanban board.

## Relationship Diagram
![CSV Llama Relationship Diagram](http://i.imgur.com/GeALoqL.jpg)
Modelled this problem slightly differently, as I thought it made sense to view orders,invoices and products as different entities.
Each row in the CSV file would be viewed as an 'update' to a corresponding object_type with a timestamp.
On query, these 'updates' can be manipulated to give the desired hash result.

## Wireframe
![CSV Llama Wireframe](http://i.imgur.com/HH3djK8.jpg)
Did a quick sketch to get an idea of what routes and data are required to populate this app before I started to code.

## Challenges faced
* Encountered some issues in configuring  Rspec and am still figuring out how to overcome these to implement testing.

* Took quite a fair bit of time to figure out how to upload CSV to update each model in the database. One issue encountered was escape apostrophes preventing file from being read. This was eventually resolved.

* Time constraints during a wedding weekend! Trello board helped loads in breaking work down into manageable chunks and in quickly getting a minimal viable product to ship.

## Moving forward
* To configure Rspec correctly and implement testing. Ideally, approach new features with TDD.

* Uploaded CSV headers should be improved to become "order-agnostic". Currently, they are being hard coded in #import_csv method , e.g. row[0],etc. In the event customer's CSV is not in order, app would not work correctly.

* Aesthetics - incorporate flash messages to notify successful CSV upload. Also to include CSS and bootstrap stylings for entire app.

* Incorporate devise for authentication and in turn a user/company model? Makes sense that company model should have order,invoice and products. Each user should have a different query result unique to only what he/she has uploaded.

## Built With

* Ruby On Rails
* PostgreSQL
* Heroku
