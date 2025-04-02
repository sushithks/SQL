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
