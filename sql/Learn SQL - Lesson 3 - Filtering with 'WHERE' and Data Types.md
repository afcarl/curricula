We often want to just get certain data. For example, what if I just wanted to know what Hubway stations are in Cambridge? The WHERE clause lets us specify the data we are looking for.

### Overview of WHERE
Execute the following code:

```sql
SELECT 
    station, municipality
FROM
    stations
WHERE
    municipality = 'Cambridge'
```
This query will return only records where the municipality is 'Cambridge'. 

Execute this code:

```sql
SELECT 
    station, municipality
FROM
    stations
WHERE
    municipality != 'Cambridge'
```

This query will return only records where the municipality is not 'Cambridge'

Greater than, less than, etc
You can also filter based on comparison. Comparisons include:
* > (greater than)
* < (less than)
* >= (greater than or equal to)
* <= (less than or equal to)
* between (between)

For example what if we want to see trips that took less than 600 seconds (10 minutes)? We'd execute the following code:

```sql
SELECT 
    trip_id, duration
FROM
    trips
WHERE
    duration < 600
LIMIT 10
```

### Combine multiple WHERE clauses with AND and OR
What if you want trips of duration less than 600 seconds that are also taken by a female You can combine multiple clauses together with AND:

```sql 
SELECT 
    trip_id, duration, gender
FROM
    trips
WHERE
    duration < 600 AND gender = 'Female'
LIMIT 10
```
What if you want trips that were either less than 600 seconds or taken by a female? You can also string multiple clauses together with OR:

```sql
SELECT 
    trip_id, duration, gender
FROM
    trips
WHERE
    duration < 600 OR gender = 'Female'
LIMIT 10
```

SQL evaluates AND before OR. You can use parentheses if you want to alter this order of operations. For example, say you want to retrieve trips that are either less than 600 seconds or more than 3600 seconds (1 hour), and that are also taken by a female you could use the following query:

```sql
SELECT 
    trip_id, duration, gender
FROM
    trips
WHERE
    (duration < 600 OR duration > 3600)
        AND gender = 'Female'
LIMIT 10
```
You can also use NOT, however, that's less common because  in most cases it's more sensible to to use '!=' (not equal to).

### Data types
You may notice that we put Cambridge in single quotes, but integers like 600 were not put in quotes. This is because these are different types of data. 'Cambridge' is what is called a "string". A "string" is a string of characters, whereas 600 is an integer. Strings requires quotes. 

Types of data include:
* strings  (called varchar in SQL)
* Integers
* Floats (floating point values - basically numbers with decimal points, such as 4.7)
* Booleans (True or False)
* Dates

### Quick explanation of relational databases
Why do we need to connect tables at all? Relational databases reduce the redundancy of stored data by separating out the data into multiple tables. Then, when we want to connect the data, we just define the columns from each table that match the data up.

### A maybe helpful way to think about Joins
When you think about joins, I think it's helpful to think about SQL building a temporary table from two tables. This is helpful because it's important to understand that SQL will combine these two tables first, and then do other operations such as aggregation (to come later) and filtering (to come later) after it has done the join. 

### Of Inner, Outer, Left, and Right Joins
Joins are not so simple as always using "join". There are different types of joins, particularly "left joins" and "right joins". We will save them for a later lesson. However, it's important to call out now that using the correct join is critical to using SQL correctly. Until you lean and understand all the joins, you cannot use SQL responsibly. 

