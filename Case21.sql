-------------------- Question ----------------------

--Imagine you manage a table Employees:
--Employees: "employee_id" (integer), "name" (String), "reports_to" (integer), "age" (integer).


--Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports
-- Table Creation --

-- Create the Employees table
CREATE TABLE Employees (
    employee_id INT,
    name VARCHAR(50),
    reports_to INT,
    age INT
);


-- Insert data into Employees table
INSERT INTO Employees (employee_id, name, reports_to, age)
VALUES
    (1, 'Michael', NULL, 45),
    (2, 'Alice', 1, 38),
    (3, 'Bob', 1, 42),
    (4, 'Charlie', 2, 34),
    (5, 'David', 2, 40),
    (6, 'Eve', 3, 37),
    (7, 'Frank', NULL, 50),
    (8, 'Grace', NULL, 48);

------------------------- Query  --------------------------------



SELECT
    fir.employee_id,
    fir.name,
    count(sec.reports_to) as reports_count,
    ROUND(AVG(sec.age)) as average_age
FROM
    employees fir
JOIN
    employees sec
ON
    fir.employee_id = sec.reports_to
GROUP BY
    fir.employee_id
ORDER BY
    fir.employee_id