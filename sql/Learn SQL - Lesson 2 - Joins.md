Joins are one of the things that make SQL difficult. Let's dive into the abyss. 

### Your first join
Run this code: 

```sql 
SELECT 
    trips.trip_id, trips.duration, stations.municipality
FROM
    stations
        JOIN
    trips ON stations.station_id = trips.start_station_id
LIMIT 100
```

This code gets us a list of 100 individual bike trips, how long they took, and the municipality that they were started in. The hubway data set however stores this data on two tables. The trip_id and duration are connected to the trip record; the municipality information is connected to the station record. 

We connect this data by joining the two tables. Let's unpack the statement:

```sql
SELECT 
    <columns>
FROM 
    <table 1> 
        JOIN 
    <table 2> ON <matching key on table 1> = <matching key on table 2>
```

We are saying to the database:

```
"Give us the 'trip_id' and 'duration' column from the 'trips' table, and the 'municipality' column from the 'stations' table. Connect these table by matching "start_station_id" from 'trips' with the 'station_id' from 'stations'
```

### Quick explanation of relational databases
Why do we need to connect tables at all? Relational databases reduce the redundancy of stored data by separating out the data into multiple tables. Then, when we want to connect the data, we just define the columns from each table that match the data up.

### A maybe helpful way to think about Joins
When you think about joins, I think it's helpful to think about SQL building a temporary table from two tables. This is helpful because it's important to understand that SQL will combine these two tables first, and then do other operations such as aggregation (to come later) and filtering (to come later) after it has done the join. 

### Of Inner, Outer, Left, and Right Joins
Joins are not so simple as always using "join". There are different types of joins, particularly "left joins" and "right joins". We will save them for a later lesson. However, it's important to call out now that using the correct join is critical to using SQL correctly. Until you lean and understand all the joins, you cannot use SQL responsibly. 
