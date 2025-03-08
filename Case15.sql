-------------------- Question ----------------------

--Imagine you manage two tables Users, Register :
-- Users : "user_id " (integer), "user_name" (String)
-- Register : "contest_id" (integer), "user_id" (integer)


-- Question : Write a SQL query to ind the percentage of the users registered in each contest rounded to two decimals and ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order. ?


-- Table Creation --

-- Create the Users table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(255)
);

-- Create the Register table
CREATE TABLE Register (
    contest_id INT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


-- Data Insert --

-- Insert data into Users table
INSERT INTO Users (user_id, user_name) VALUES
(6, 'Alice'),
(2, 'Bob'),
(7, 'Alex');

-- Insert data into Register table
INSERT INTO Register (contest_id, user_id) VALUES
(215, 6),
(209, 2),
(208, 2),
(210, 6),
(208, 6),
(209, 7),
(209, 6),
(215, 7),
(208, 7),
(210, 2),
(207, 2),
(210, 7);

-- Query --
