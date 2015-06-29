## Dates and Times in SQL
In many analysis tasks, it is common to work with dates and times. Knowing how to effectively handle dates in SQL enables aggregation and processing to be performed quickly on the DB rather than manually in your analysis tool of choice. 

### Overview
In Redshift, dates can be represented as timestamps or dates. Timestamps have time and timezone data, while dates do not. A [date literal](http://docs.aws.amazon.com/redshift/latest/dg/r_Date_and_time_literals.html) is a string representation of a date datatype. Date literals can have varying levels of precision, typically you'll only need date-level precision in most queries (no time data). To encode a date as a date literal in a SQL expression, use the `'YYYY-MM-DD HH:MM:SS'` format.

This query demonstrates usage of a date literal with timestamp and one without in a where clause. Date fields can be used in selection criteria the same way as numeric fields using equality and inequality operators. When hard-coding a date as a date literal in a SQL expression, wrap the date in single quotes.

```sql
SELECT COUNT(*)
FROM trips
WHERE start_date >= '2014-01-01 05:00:00'
AND   start_date <= '2014-01-31';
```

Be careful when comparing timestamps to dates. The query below evaluates to false. The first `GETDATE` call evaluates to a timestamp, while the second one is cast as a date literal. Even through they share the same date, they are not considered equal as the second does not have a time component.

```sql
SELECT GETDATE() = DATE(getdate ())
```

### Date Functions
In these examples we'll use the Redshift [implementations](http://docs.aws.amazon.com/redshift/latest/dg/Date_functions_header.html) of these functions, but in general these will be applicable to any RDBMS with minor syntax tweaks. 

#### DATEDIFF
`DATEDIFF` computes the difference between two dates.

```sql
DATEDIFF ( datepart, expression, expression )
```

Here we'll find the difference in weeks between the first and last trips in the hubway database. The datepart parameter is `week`, and the first date parameter will be subtracted from the second date parameter.

```sql
select
	datediff(week, min(start_date), max(start_date))
from
	trips;
```

#### DATE_TRUNC
`DATE_TRUNC` shortens a timestamp to the provided date_part.

```sql
DATE_TRUNC('datepart', source)
```

Here we'll use `DATE_TRUNC` to find total trips by month.

```sql
SELECT DATE_TRUNC('month',start_date) trip_month,
       COUNT(*) trip_count
FROM trips
GROUP BY 1
ORDER BY 1;
```

#### DATEADD
`DATEADD` adds the specfied date part to a date.

```sql
DATEADD ( datepart, interval, expression )
```

This query subtracts a year from the most recent date in the trips table.

```sql
SELECT dateadd(year,-1,MAX(start_date))
FROM trips;
```

#### EXTRACT
`Extract` allows us to select a date part from a date.

```sql
EXTRACT ( datepart FROM
{ TIMESTAMP 'literal' | timestamp }
)
```

Here we count the number of trips by weekday. 

```sql
SELECT EXTRACT(weekday FROM start_date),
       COUNT(*)
FROM trips
GROUP BY 1
ORDER BY 1;
```

#### GETDATE
`GETDATE` returns Redshift's system time.

```sql
SELECT GETDATE();
```

#### CONVERT_TIMEZONE
By default Redshift stores timestamps in UTC. You can use `CONVERT_TIMEZONE` to change the timezone

```sql
CONVERT_TIMEZONE ( ['source_zone',] 'target_zone', 'timestamp')
```

In the Hubway database, timezones have been stored in Eastern time. Here's a query that converts the oldest trip time into Pacific DST.

```sql
SELECT convert_timezone('EDT','PDT',min(start_date))
from trips;
```
