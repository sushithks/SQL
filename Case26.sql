-------------------- Question ----------------------

--Imagine you manage a table Person:
--Person: "person_id" (integer), "person_name" (String), weight" (integer), turn" (integer)

--Question :-- A bus has a weight capacity of 1900 kilograms, and people are lining up to board. Due to this weight restriction, some may be left behind.

--Write a solution to determine the name of the last person that can board the bus without the weight exceeding the limit.


-- Table Creation --

-- Create the Products table
CREATE TABLE persons (
    person_id INT PRIMARY KEY,
    person_name VARCHAR(100),
    weight INT,
    turn INT
);

-- Insert data into Products table

INSERT INTO persons (person_id, person_name, weight, turn) VALUES
(5, 'Alice', 250, 1),
(4, 'Bob', 175, 5),
(3, 'Alex', 350, 2),
(6, 'John Cena', 400, 3),
(1, 'Winston', 500, 6),
(2, 'Marie', 200, 4);

