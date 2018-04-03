# README

***Under implementing***

This is the web application being developd to contest some people (supporsing my friends) how thir programs work.
It functions on web server. Each parson's program moves their machine and transfer data using rest API.

* Developing in 
  - Ruby: 2.4
  - Rails: 5.1.4

## cont_web
Rails project which will provide web-based service listed below.
  - View of contest list
  - View of contest's state
  - User management
  - API connection with users
  - Contest registration (Admin)


### Screens overview
<img src="./doc/uml/screens.png" width=50% height=50%>

### Note
Job engine should be executed manualy when operation.


## cont_engine
Main engine of executing each contest.
Operates independently from cont_web and executed by scheduled job when contest is committed.

It Exchanges data with cont_web by using sqlite3 database.

### Operation overwiew
<img src="./doc/uml/engine.png" width=50% height=50%>

### Note
In deployment environment, cont_engine will be executed by job controller.
But when testing, Executing command of engine.rb is : ruby engine.rb *contest_id* -d

## Usage
Execute cont_web as rails project. Do not change directory structure (cont_web is referring cont_engine with relative path)
At the same time, job engine won't be executed automatically and should execute by manual.

## ToDo
* cont_web
  - Create API interface
  - Create Realtime contest view
  - Create API authentification function (uses token created for each user)
  - In engine-contest, db access is not sophisticated so should think how manage it (e.g. create DAO?)
  - Confirm that job execution is not delayed (If it delays, must create buffer function)
