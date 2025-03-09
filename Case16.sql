-------------------- Question ----------------------

--Imagine you manage a table Activity:
--Animal: "name" (integer), "bread" (date), "position" (string), "rating" (float).


--Write a sql query to find each animal name, the quality and poor_query_percentage.
-- quality = The average of the ratio between query rating and its position.
-- poor query percentage = The percentage of all queries with rating less than 3.

-- Table Creation --
CREATE TABLE Animal (
    name VARCHAR(50),
    bread VARCHAR(50),
    position INT,
    rating INT
);


-- Data Insert --

INSERT INTO Animal (name, bread, position, rating)
VALUES
    ('Dog', 'Golden Retriever', 1, 5),
    ('Dog', 'German Shepherd', 2, 5),
    ('Dog', 'Mule', 200, 1),
    ('Cat', 'Shirazi', 5, 2),
    ('Cat', 'Siamese', 3, 3),
    ('Cat', 'Sphynx', 7, 4);


