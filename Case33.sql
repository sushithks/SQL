-------------------- Question ----------------------

--Imagine you manage a table Employees:
--Employees: "employee_id" (integer), "name" (String),"manager_id" (integer), "salary" (integer)
--Question :-- Find the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company. When a manager leaves the company, their information is deleted from the Employees table, but the reports still have their manager_id set to the manager that left.
------------------- Table Creation --------------------
-- Create the Employees table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT,
    salary INT
);

-- Insert data into the Employees table
INSERT INTO Employees (employee_id, name, manager_id, salary) VALUES
(3, 'Mila', 9, 60301),
(12, 'Antonella', NULL, 31000),
(13, 'Emery', NULL, 67084),
(1, 'Kalel', 11, 21241),
(9, 'Mikaela', NULL, 50937),
(11, 'Joziah', 6, 28485);

------------------------- Query  --------------------------------


select employee_id
from Employees
where salary < 30000
and manager_id not in (select employee_id from Employees)
order by employee_id
