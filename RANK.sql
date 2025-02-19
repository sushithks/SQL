

-- Table Creation --
CREATE TABLE taxi_trips (
    trip_id INT64 AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each trip
    trip_miles FLOAT64 NOT NULL,              -- Distance of the trip in miles
    tips FLOAT64 NOT NULL                     -- Tip amount
);

-- Data Insert --

INSERT INTO taxi_trips (trip_miles, tips)
VALUES
    (2.0, 95.0),
    (2.0, 85.5),
    (2.0, 76.0),
    (2.0, 68.2),
    (2.0, 55.0),
    (2.0, 45.8),
    (2.0, 38.0),
    (2.0, 25.6),
    (2.0, 15.0),
    (2.0, 10.5);


-- RANK, DENSE_RANK, ROW_ NUMBER function --
SELECT
    trip_miles
    tips,
    RANK() OVER(PARTITION BY CAST (trips miles AS INT64) ORDER BY tips DESC) AS tip rank,
    DENSE_RANK() OVER(PARTITION BY CAST (trip miles AS INT64) ORDER BY tips DESC) AS tip_d_rank,
    ROW_ NUMBER() OVER(PARTITION BY CAST(trip miles AS INT64) ORDER BY tips DESC) AS tip_row_num
FROM taxi_trips
WHERE trip_miles = 2.0
    AND tips <= 100
ORDER BY tips DESC;

