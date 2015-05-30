Onto the first real lesson! In general, the pattern here will be do first, explain later. Let's start doing. 

The Select Statement
SQL is a programming language for interacting with databases. The most common way you will interact with databases is retrieving data from databases. With SQL you do this with the "SELECT" statement. Enter the following code in the statement box

>>>> SELECT * FROM stations

Execute this code. It may take ~30 seconds to run. It should return a bunch of data. We are working with a dataset based on Boston's Hubway bike-sharing program. This dataset includes a table for all the individuals took on Hubway bikes and the stations. We've also added fake user data to this data set.

You can think of a table as similar to an excel spreadsheet table. Each row is a record, and each column has values for that record. 

The code you ran retrieved all the data from the station table. Let's unpack how the statement works:

>>>> SELECT <column(s)> FROM <table>

The asterisk  is used to indicate "all columns". So here, we told the database to "Get all columns from the stations table"


Selecting Individual Columns
Typically, you only want to select the columns you need. To do this, you explicitly state the columns like so:

>>>> SELECT stations_id, stations_name  FROM stations

Voila - you can now indicate the individual columns you want.

Limiting the data you retrieve
This table has143 records. the "trips" table, however has 1579025 records. If you select all the columns and all the records from the "trips" table, you will be sitting around for a while as the computer retrieves all that data. It's often smart to limit the number of rows to only what you need. You do this with "LIMIT", like so:

>>>> SELECT stations_id, station  FROM stations LIMIT 10

Now you only get 10 rows. 

Other database operations (CRUD)
We will almost entirely be working with "Select" statements. However, Select represents just one of the four primary ways SQL lets you interact with a database:
- Create/Insert (create data) 
- Select (read data)
- Update (update data)
- Delete (delete data)
These four operations are often referred to as the CRUD operations. 