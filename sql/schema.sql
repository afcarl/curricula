CREATE TABLE bikeshare.trips (
  seq_id 	INT,
  trip_id 	BIGINT,
  status 	VARCHAR(10),
  duration 	INT,
  start_date 	VARCHAR(30),
  strt_statn 	INT,
  end_date 	VARCHAR(30),
  end_statn 	INT,
  bike_nr 	VARCHAR(20),
  subsc_type 	VARCHAR(20),
  zip_code 	VARCHAR(6),
  birth_date 	INT,
  gender 	VARCHAR(10),
  primary key (seq_id)
);

UPDATE bikeshare.trips
  SET start_date = STR_TO_DATE(start_date, '%c/%e/%Y %H:%i:%s'),
    end_date = STR_TO_DATE(end_date, '%c/%e/%Y %H:%i:%s'),
    zip_code = SUBSTRING(zip_code, 1);

CREATE TABLE bikeshare.stations (
  statn_id INT,
  terminal VARCHAR(10),
  station VARCHAR (100),
  municipal VARCHAR (20),
  lat DECIMAL(10, 8),
  lng DECIMAL(11, 8),
  status VARCHAR (10)
);
