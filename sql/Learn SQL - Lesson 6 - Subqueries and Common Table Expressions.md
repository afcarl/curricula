## Subqueries
A subquery (also known as nested query) is a query whose result set can be joined to another query or otherwise used as a criteria. Subqueries are enclosed in parentheses and executed before the enclosing outer query or queries. When used in a join, subqueries should be aliased (given a name) using the same syntax as in a select statement.

### Syntax

With a join

```sql
SELECT
	...
FROM
	table
join
	(SELECT ... FROM ...) subquery
ON
	table.key = subquery.key
```

As a criteria

```sql
SELECT
	...
FROM
	table
WHERE
	column > (SELECT ... FROM ...)
```

### Examples
A common use case for subqueries is performing some kind of grouping and then joining back to the same table to get the entire row. In this example, we'll select the row corresponding to the first trip for each bike in the Hubway system. 

```sql
SELECT trips.*
FROM trips
  JOIN (SELECT bike_number,
               MIN(start_date) min_date
        FROM trips
        GROUP BY 1) min_trips
    ON trips.bike_number = min_trips.bike_number
   AND trips.start_date = min_trips.min_date;
```

We can also use a subquery in a where clause. Here, we'll select all trips that have a duration greater than the average duration plus two standard deviations.

```sql
SELECT *
FROM trips
WHERE duration >= (SELECT AVG(duration) + 2 * stddev(duration) FROM trips);
```

## Common Table Expressions
A Common Table Expression ([CTE](https://en.wikipedia.org/wiki/Hierarchical_and_recursive_queries_in_SQL#Common_table_expression)) is a temporary result set that can be referenced in the scope of another SQL statement such as `SELECT`. CTEs are similar to subqueries and views, and are useful for generating intermediate results in a complex query that can then be joined to other result sets in a final `SELECT`.

CTEs are created using a `WITH` clause preceding another query expression (e.g. `SELECT`). Because CTEs are defined sequentially at the top of an expression, they can be easier to read than a series of nested subqueries, though the functionality is identical. CTEs are not indexable, for cases where an indexable temporary result set is desired a temporary table is suggested instead.

### Syntax
From the Redshift [documentation](http://docs.aws.amazon.com/redshift/latest/dg/r_WITH_clause.html):

```sql
[ WITH with_subquery [, ...] ]
```

```sql
with_subquery_table_name [ ( column_name [, ...] ) ] AS ( query )
```

The name of the first result set is placed immediately following the `WITH` keyword folled by `AS` and then the `SELECT` enclosed in parentheses. Subsequent CTEs are separated by commas.

### Example
The example query below uses a CTE to find earliest and the most recent start times by station, then joins the result to the stations table to get the station name. The CTE result set is named `station_first_last`.

```sql
WITH station_first_last AS
(
  SELECT start_station_id,
         MIN(start_date) first_date,
         MAX(start_date) last_date
  FROM trips
  GROUP BY 1
)
SELECT station,
       first_date,
       last_date
FROM stations
  JOIN station_first_last ON start_station_id = station_id;
```
