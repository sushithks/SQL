-------------------- Question ----------------------

--Imagine you manage a table Employees, Department :
--Employees: "id" (integer), "name" (String),"salary" (integer), "departmentId" (integer)
--Department : "id" (integer), "name" (String)


--Question :-- Write a solution to find the employees who are high earners in each of the departments.
-- A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

------------------ Table Creation --------------------

-- Create the Department table
CREATE TABLE Department01 (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Create the Employee table
CREATE TABLE Employee01 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    departmentId INT
);



-- Insert data into Department table
INSERT INTO Department01 (id, name) VALUES
(1, 'IT'),
(2, 'Sales');

-- Insert data into Employee table
INSERT INTO Employee01 (id, name, salary, departmentId) VALUES
(1, 'Joe', 85000, 1),
(2, 'Henry', 80000, 2),
(3, 'Sam', 60000, 2),
(4, 'Max', 90000, 1),
(5, 'Janet', 69000, 1),
(6, 'Randy', 85000, 1),
(7, 'Will', 70000, 1);

