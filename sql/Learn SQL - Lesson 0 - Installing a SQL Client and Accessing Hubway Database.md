First things first - you need access to sql.

1. Download MySQL Workbench
* Go to http://dev.mysql.com/downloads/workbench/
..* Click on the package for your operating system
..* Go through the process of installing SQL Workbench/J

2. Enter Connection Details
..* Open MySQL Workbench
..* The first window you see is the connection window. Click the plus symbol next to ‘MySQL Connections’ in the upper lift.
..* You can use these credentials to access the database:
'''
connection name: datasci
hostname: 104.236.178.198
port: 3305
username: datasci
password: sql
'''

3. Test the connection
..* You should now be in the main interface. In the center is the query editor. Here is where you will be writing your SQL statements. 
..* Towards the bottom of the left pane will be a section title “Schemas”. Double-click on bikeshare.
..* enter the below code in the statement box and click the lightning symbol to execute the query:
‘’’sql
SELECT 
    *
FROM
    stations
LIMIT 5
‘’’
..* You should get an output that shows five rows of data on subway stations.
..* If you did not get an error, we got over the hardest part of this journey.

What is MySQL Workbench? It is a GUI tool that makes it easy to interface with a database using SQL. We are using MySQL as our RDBMS (relational database management system). MySQL is a very common form of SQL. The other common form of SQL is Postgres (or Postgres as it's  often called).  MySQL and Postgres are very similar. While the languages of these systems  are nearly identical, knowing which system you are using is important for the times when syntax and performance vary between systems. 
