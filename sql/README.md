## Bike Share

The data in this test comes from Hubway, Boston's bike sharing service that has open-sourced info on their network.Please submit a written answer for each question, as well as the code (sql or python only) used to answer the questions in a separate document (text documents or ipython notebooks are fine).

Write-ups should include both text and visualizations. Writeups should be brief, but not more brief than is necessary to provide a complete explanation. A good writeup will provide a clear takeaway, offer concise support for that takeaway with clear text and visuals, and be of sound logic and thoughtful approach.

_Questions coming soon_

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
