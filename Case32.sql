-------------------- Question ----------------------

--Imagine you manage a table Insurance:
--accounts: "id" (integer), "tiv_2015" (DECIMAL),"tiv_2016" (DECIMAL), "lat" (DECIMAL),"lon" (DECIMAL)

--Question :-- Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:

--have the same tiv_2015 value as one or more other policyholders, and
--are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).

------------------- Table Creation --------------------

-- Create the Booking table
CREATE TABLE Insurance (
    pid INT PRIMARY KEY,
    tiv_2015 DECIMAL(10,2),
    tiv_2016 DECIMAL(10,2),
    lat DECIMAL(10,6),
    lon DECIMAL(10,6)
);
-- Insert data into Booking table
INSERT INTO Insurance (pid, tiv_2015, tiv_2016, lat, lon) VALUES
(1, 10, 5, 10, 10),
(2, 20, 20, 20, 20),
(3, 10, 30, 20, 20),
(4, 10, 40, 40, 40);


------------------------- Query 1 --------------------------------




SELECT ROUND(SUM(tiv_2016),2) AS tiv_2016 FROM
(
    SELECT *,
        COUNT(*) OVER (PARTITION BY tiv_2015) as tiv_count,
        COUNT(*) OVER (PARTITION BY lat, lon) as loc_count
    FROM Insurance
) sub
WHERE
    sub.tiv_count >1 AND
    loc_count = 1




------------------------- Query 2 --------------------------------

SELECT
    round(SUM(tiv_2016), 2) as tiv_2016
FROM
    Insurance
WHERE
    tiv_2015 IN(
        SELECT tiv_2015
        FROM Insurance
        GROUP BY tiv_2015
        HAVING COUNT(*) >1
    )
    AND (lat,lon) IN (
        SELECT lat,lon
        FROM Insurance
        GROUP BY lat,lon
        HAVING COUNT(*)=1
    )