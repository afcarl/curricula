Very often, we are more interested in summary data than individual records. For example, we might want to know how many trips were taken that were less than 600 seconds or what was the average trips length. 

### Using Aggregate functions
So how do we get the total number of trips that were less than 600 seconds? We use this query:

```sql
SELECT 
    COUNT(duration)
FROM
    trips
WHERE
    duration < 600
```
What about the average trip duration? We use this query:

```sql
SELECT 
    AVG(duration)
FROM
    trips
```

This same construction works across all aggregate functions. These are the common aggregate functions:
AVG() - Returns the average value
COUNT() - Returns the number of rows
FIRST() - Returns the first value
LAST() - Returns the last value
MAX() - Returns the largest value
MIN() - Returns the smallest value
SUM() - Returns the sum

### The Distinct function
DISTINCT() is a not an aggregate function, but it is used frequently. It gives you distinct records. For example, we might want to get a list of all bikes that have been used. If we were to query a list of all "bike numbers" in the trips database, the list would be redundant. Instead we would use:

```sql
SELECT DISTINCT
    (bike_number)
FROM
    trips
```

DISTINCT() is often paired with COUNT(). For example, a media website might ask how many distinct users did we have this month? Continuing our bike example, we might want to know how many bikes were used for trips:

```sql
SELECT 
    COUNT(DISTINCT (bike_number))
FROM
    trips
```
