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
