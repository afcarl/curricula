If you enjoyed learning `GROUP BY`, you'll really enjoy window functions. A window function partitions the data by user-specified key(s) and then iterates through each row of the partition and evaluates the results of the function, storing it in that row. Another way to think of it is aggregation over some partition without the use of `GROUP BY`. Some common uses for window functions are computing moving averages and selecting the first or last value of a partition.

Window functions are unsupported on current versions of MySQL. Postgres/Redshift and many other RDBMSes do support window functions. To run these examples, you'll need to be connected to an instance of Postgres or Redshift hosting the Hubway dataset.

### Syntax
Amazon offers a good [overview](http://docs.aws.amazon.com/redshift/latest/dg/r_Window_function_synopsis.html) of window function syntax.

```sql
function (expression) OVER (
[ PARTITION BY expr_list ]
[ ORDER BY order_list [ frame_clause ] ] )
```

Example SQL to get running total of an orders table by customer:

```sql
SUM(amount) OVER
	(PARTITION BY customer_id
	ORDER BY order_date
	ROWS UNBOUNDED PRECEDING)
```

### Basic Moving Average
If we wanted to see usage trands by station over time, we can compute the seven day moving average of daily trips started by station. This query first computes the total trips by station and date in a CTE, then averages them over station partition ordered by the date the trips occurred.

```sql
WITH date_trip_count AS
(
  SELECT DATE (start_date) trip_date,
         start_station_id,
         COUNT(*) trip_count
  FROM trips
  GROUP BY 1,
           2
)
SELECT trip_date,
       start_station_id,
       AVG(trip_count) OVER (
		   PARTITION BY start_station_id
		   ORDER BY trip_date
		   ROWS 6 PRECEDING) avg_trips
FROM date_trip_count
ORDER BY start_station_id,
trip_date
```

### Selecting First Observation
Often you might want to get the first instance of a partition, for example the first trip taken at a station. This could be accomplished with a subquery and join on minimum date, but the syntax using a CTE and window function is nice and clean. We use the `row_number` function on the `trips` table partitioned by `start_station_id` and ordered by `start_date` to assign a row number to each row in the parition, then we select from the result set where the row number is equal to one to get the first trip. 

```sql
WITH station_trip_rows AS
(
  SELECT *,
  ROW_NUMBER() OVER (
	PARTITION BY start_station_id
	ORDER BY start_date) row_num
  FROM trips
)
SELECT *
FROM station_trip_rows
WHERE row_num = 1;
```

### Two Different Partitions Simultaneously
You can also combine different partitions into the same statement. This query takes finds the median duration by station as well as the median duration for all stations. 

```sql
SELECT start_station_id,
       start_date,
       duration,
       median(duration) OVER (PARTITION BY start_station_id),
       median(duration) OVER ()
FROM trips
ORDER BY start_date LIMIT 1000;
```

