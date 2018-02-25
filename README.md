# README

* Developing
   Ruby: 2.4
   Rails: 5.1.4

## cont_web
Rails project which provides service

### note
Job engine should be executed manualy when operation


## cont_engine
Main engine of executing each contest
Operates independently from cont_web and executed by scheduled job

### note
Executing command of engine.rb when testing: ruby engine.rb cont_000 -d
