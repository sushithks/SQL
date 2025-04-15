-------------------- Question ----------------------

--Imagine you manage a table Employee :
--Employee: "id" (integer), "salary" (integer)

--Question :-- Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null

------------------ Table Creation --------------------

-- Create the Employee table
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    salary INT
);


-- Insert data into Employee table
INSERT INTO employee (id, salary) VALUES
(1, 75000),
(2, 85000),
(3, 90000),
(4, 65000),
(5, 72000),
(6, 85000),
(7, 78000),
(8, 91000),
(9, 88000),
(10, 70000);



------------------------- Query  --------------------------------

WITH main AS
    (SELECT
        DISTINCT salary
    FROM
        employee
    ORDER BY
        salary DESC
    limit 2)

SELECT
    CASE
        WHEN COUNT(*) = 1 THEN  null
    ELSE
        (SELECT * FROM main LIMIT 1,1)
    END AS sal
FROM
    main