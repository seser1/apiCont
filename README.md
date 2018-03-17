# README
This is the web application being developd to contest some people (supporsing my friends) how thir programs work.
It functions on web server. Each parson's program moves their machine and transfer data using rest API.

* Developing in 
   - Ruby: 2.4
   - Rails: 5.1.4

## cont_web
Rails project which provides web-based service.

### note
Job engine should be executed manualy when operation.


## cont_engine
Main engine of executing each contest.
Operates independently from cont_web and executed by scheduled job.

### note
In deployment environment, cont_engine will be executed by job controller.
But when testing, Executing command of engine.rb is : ruby engine.rb *contest_id* -d
