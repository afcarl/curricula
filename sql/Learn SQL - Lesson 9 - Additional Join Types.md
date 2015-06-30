### Additional Join Types

In a previous lesson, we introduced the concept of a join as a method of combining fields from multiple tables using one or more shared fields.

### Left and Right Joins
The previous lesson on joins focused on the `inner join` where the SQL expressions returns rows where the matching fields are present in both tables. When joining `Table A` to `Table B` on a shared `id` column using an innter join, the result set will only include rows where values of `id` are present in both tables. For example, if `Table A` includes `id` values `[1,2,3]` and `Table B` includes `id` values `[3,4,5]`, an inner join of the two tables would only return rows with an `id` value of 3.

A `left join` on two tables will return all the rows in the table on the left side of the join statement - specified first - and the rows in the table on the right side of the join where a match is found on the joining field. For values on the left side of the join where no match is found on the right side, null values will be returned in the right table's fields. A `right join` works the same way but with the order flipped. 

For this lesson, we'll create two simple temporary tables to illustrate the concepts.

```sql
DROP TABLE IF EXISTS tmp_table_a;
CREATE temporary TABLE tmp_table_a (id integer,value_a integer);

DROP TABLE IF EXISTS tmp_table_b;
CREATE temporary TABLE tmp_table_b (id integer,value_b integer);

INSERT INTO tmp_table_a
VALUES
(1,8),
(2,10),
(3,15);

INSERT INTO tmp_table_b
VALUES
(3,12),
(4,23),
(5,42);
```

Both tables feature a common `id` column which we'll use in joins of the two tables.

#### Left Join
If we want to retrieve all rows from `Table A` and the rows from `Table B` where the `id` column matches, we can use a left join.

```sql
SELECT *
FROM tmp_table_a
  LEFT JOIN tmp_table_b ON tmp_table_a.id = tmp_table_b.id;
```

This query will return a result set containing all three rows from `Table A` and one row from `Table B` where `id` equals 3.

#### Right Join
If we take the same query and reverse the join to a `right join`, the result set will contain all the rows in `Table B` and one row from `Table A` where `id` equals 3.

```sql
SELECT *
FROM tmp_table_a
  RIGHT JOIN tmp_table_b ON tmp_table_a.id = tmp_table_b.id;
```

### Full Joins
A `full join` is the union of the result sets of a left and right join. It returns all rows from both tables with null values in the fields where the matching field was not found in the table on the other side of the join.

```sql
SELECT *
FROM tmp_table_a
  FULL JOIN tmp_table_b ON tmp_table_a.id = tmp_table_b.id;
```

### Cross Joins
The result set of a `cross join` is the Cartesian product of all rows in the tables involved. Each row of the table on the left is combined with each row of the table on the right. We do not need the `on` keyword to specify joining fields. T

```sql
SELECT *
FROM tmp_table_a
  CROSS JOIN tmp_table_b;
```

