"Group By" is where SQL gets fun. Like pivot tables in Excel, the group by function allows you to slice up aggregate data by category. Let's dive in. 

Basic Group By
What if we want to know how many bike rides were taken by men vs how many rides were taken by women? One way would be to use the WHERE function. We could run the following two queries:
```sql
SELECT 
    gender, COUNT(trip_id)
FROM
    trips
WHERE
    gender = 'Male'
```
```sql
SELECT 
    gender, COUNT(trip_id)
FROM
    trips
WHERE
    gender = 'Female'
```
This is unwieldy, and also requires you to know what categories are in each column. Let's try this instead:

>>>> SELECT gender, COUNT(trip_id) from trips GROUP BY gender

Way easier! Plus we also see that there are huge number of 'Unknown's. (We also see that biking may have something of a gender problem...) 

Try it out with other aggregate functions 
Group by works with all aggregate functions. For example we might want to know the average trip duration by gender:

>>>> SELECT gender, AVG(duration) from trips GROUP BY gender

Or we might want to know the maximum duration of a trip by gender:

>>>> SELECT gender, MAX(duration) from trips GROUP BY gender

Multiple Categories
With group by, we can slice this data up by multiple categories. For example, what if we wanted to know the average trip duration by both gender and zipcode? We could use this query:

>>>> SELECT gender, zip_code, AVG(duration) from trips GROUP BY gender, zip_code

Order By
Often, we want to order our results by a certain column. For example we might want to know the average trip durations by zip code, and order this from lowest durations to highest durations:

>>>> SELECT zip_code, AVG(duration) from trips GROUP BY zip_code ORDER BY AVG(duration) ASC

We can also order in a descending fashion:

>>>> SELECT zip_code, AVG(duration) from trips GROUP BY zip_code ORDER BY AVG(duration) DESC
