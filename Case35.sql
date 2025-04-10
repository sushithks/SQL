-------------------- Question ----------------------

--Imagine you manage a table Employees :
--Employees: "id" (integer), "name" (String)

--Question :-- Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.
------------------ Table Creation --------------------


-- Create the Employee table
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),

);



-- Insert data into Employee table
INSERT INTO Employees (id, name) VALUES
(1, 'Joe henry' ),
(2, 'carter Henry'),
(3, 'Sam' ),
(4, 'Max' ),
(5, 'Janet'),
(6, 'randy willy'),
(7, 'Will');



------------------------- Query  --------------------------------


SELECT
    CASE
        -- If it's a single name
        WHEN LOCATE(' ', name) = 0 THEN CONCAT(
            UPPER(LEFT(name, 1)),
            LOWER(SUBSTRING(name, 2))
        )
        -- If full name
        ELSE CONCAT(
            UPPER(LEFT(SUBSTRING_INDEX(name, ' ', 1), 1)),
            LOWER(SUBSTRING(SUBSTRING_INDEX(name, ' ', 1), 2)),
            ' ',
            UPPER(LEFT(SUBSTRING_INDEX(name, ' ', -1), 1)),
            LOWER(SUBSTRING(SUBSTRING_INDEX(name, ' ', -1), 2))
        )
    END AS name
FROM Employees;
