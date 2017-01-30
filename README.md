TOURNAMENT PROJECT
This project is completed by Minyoung Chun as her project submission for Udacity Full Stack Developer Nanodegree. 
This project is designed to learn how to create and use databases throught the use of database schemas and how to manipulate the data inside the database. 

FILES
"tournament.sql" is used to set up database schema (table representation of data structure)
"tournament.py" is used to provide access to tournament database via a library of functions which can add, delete or query data in database to another python program
"tournament_test.py" is a client program which will use your functions written in the tournament.py module

HOW TO
You will need to install VirtualBox and Vagrant to run this code.
In terminal, run "vagrant up" then "vagrant ssh" to start running Vagrant.
Access Postgre by running "psql".
Import your tournament.sql file to connect to the database by typing "\i tournament.sql"
Quit out of psql and run "python tournament_test.py"
