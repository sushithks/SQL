-------------------- Question ----------------------

--Imagine you manage three tables:
--"Employees," "Departments," and "Salaries."
--The "Employees" table features "EmployeelD" (integer),"FirstName" (string), "LastName" (string), and
--"DepartmentID" (integer).
--The "Departments" table includes "DepartmentID" (integer) and "DepartmentName" (string).
--"Salaries" table has "EmployeelD" (integer) and "Salary" (decimal).
--Craft a SQL query to extract department names with their corresponding average salaries.


-- Table Creation --
create table Employees (
	EmployeeID Int primary key,
    FirstName varchar(50),
    LastName varchar(50),
    DepartmentID Int
)

create table Department (
	DepartmentID Int primary key,
    DepartmentName varchar(50)
)

create table Salaries (
	EmployeeID Int ,
    Salary  Decimal(10,2)
)


-- Data Insert --

INSERT INTO Department (DepartmentID, DepartmentName)
VALUES
(1, 'Human Resources'),
(2, 'Engineering'),
(3, 'Marketing'),
(4, 'Sales');

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID)
VALUES
(101, 'John', 'Doe', 2),
(102, 'Jane', 'Smith', 1),
(103, 'Michael', 'Johnson', 3),
(104, 'Emily', 'Davis', 4),
(115, 'Alex', 'Martinez', 2),
(116, 'Rebecca', 'Lee', 1),
(117, 'Joshua', 'Perez', 4),
(118, 'Lily', 'Clark', 3),
(119, 'Ethan', 'Walker', 2),
(120, 'Amelia', 'Lewis', 1),
(121, 'Daniel', 'Young', 4),
(122, 'Ava', 'King', 3),
(123, 'Matthew', 'Scott', 2),
(124, 'Ella', 'Green', 3);

INSERT INTO Salaries (EmployeeID, Salary)
VALUES
(101, 75000.00),
(102, 60000.00),
(103, 55000.00),
(104, 65000.00),
(115, 63000.00),
(116, 48000.00),
(117, 55000.00),
(118, 67000.00),
(119, 72000.00),
(120, 80000.00),
(121, 52000.00),
(122, 73000.00),
(123, 85000.00),
(124, 69000.00);


-- Query --

SELECT DepartmentName, AVG(sa.Salary)
FROM Department de
JOIN Employees em
  ON de.DepartmentID = em.DepartmentID
JOIN Salaries sa
  ON sa.EmployeeID = em.EmployeeID
GROUP BY DepartmentName;

