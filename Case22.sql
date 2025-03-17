-------------------- Question ----------------------

--Imagine you manage a table Employees:
--Employees: "employee_id" (integer), "department_id" (integer), "primary_flag" (String)


--Write a solution to report all the employees with their primary department. For employees who belong to one department, report their only department.


-- Table Creation --

-- Create the Employees table
create table Employees(
	employee_id   INTEGER,
    department_id INTEGER,
    primary_flag  varchar(10))


-- Insert data into Employees table
INSERT INTO Employees (employee_id, department_id, primary_flag)
VALUES
    (1, 1, 'N'),
    (2, 1, 'Y'),
    (2, 2, 'N'),
    (3, 3, 'N'),
    (4, 2, 'N'),
    (4, 3, 'Y'),
    (4, 4, 'N');

------------------------- Query 1 --------------------------------

select
    employee_id,
    department_id
from
    Employee
where
    primary_flag ='Y'
UNION ALL
select
    employee_id,
    department_id
from
    Employee
group by
    employee_id
having count(employee_id) = 1

