## Learn SQL

Let’s dive into SQL! There are a number of SQL guides out there - this one is meant to get you up and running querying data quickly. It focuses primarily on practical use and less on the underlying philosophies of database design and relational algebra. That said, these topics are important to use SQL effectively and responsibly in a real-world environment and should not be overlooked. 


The data in this guide comes from Hubway, Boston's bike sharing service that has open-sourced info on their network.

If you have issues, questions, or suggestions as you go through this guide, please email jonathan@datascience.com. Thank you!


#### Tables

`bikeshare.trips`

| Name | Type | Description | Keys |
| ----- |-----|-----| -----|
| seq_id | integer | unique record ID ||
| trip_id | integer | trip id ||
| status | varchar | trip status; "closed" indicates a trip has terminated ||
| duration | integer |  time of trip in seconds ||
| start_date | timestamp |  start date of trip with date and time, in EST ||
| strt_statn | integer |  id of start station | `stations.id`|
| end_date |timestamp| end date of trip with date and time, in EST ||
| end_statn | integer |   id of end station | `stations.id`|
| bike_nr | integer | id of bicycle used ||
| subsc_type | varchar |  subscription type - "Registered" is user with membership; "Casual" is user without membership ||
| zip_code | varchar |  zipcode of user (only available for registered users)||
| birth_date | integer |  birth year of user ||
| gender | varchar |  gender of user |||


`bikeshare.stations`

| Name | Type | Description | Keys |
| ----- |-----|-----| -----|
| id | integer|  station id | `trips.start_station` , `trips.end_station_id` |
| terminal | varchar | Hubway-assigned station identifier ||
| station | varchar | station name ||
| municipal | vharchar |  Municipality ||
| lat | decimal | station latitude ||
| lng | decimal |  station longitude ||
| status | varchar |  Existing station locations and ones that have been removed or relocated |||
