-------------------- Question ----------------------

--Imagine you manage 3 tables Employees, Department, Salaries:
--Department :-   DepartmentID, DepartmentName
--Employees :-   EmployeeID, Name , DepartmentID
--Salaries :-   EmployeeID, Salary DECIMAL, SalaryDate

--Write a SQL query to find the highest salary ever paid in each department and the name of the employee who earned that salary ?


-- Creating the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(255)
);

-- Creating the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(255),
    DepartmentID INT
);

-- Creating the Salaries table
CREATE TABLE Salaries (
    EmployeeID INT,
    Salary DECIMAL(10, 2),
    SalaryDate DATE
);


-------------------- Data Insert -------------------

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Human Resources'),
(2, 'IT'),
(3, 'Marketing'),
(4, 'Finance'),
(5, 'Sales');

INSERT INTO Employees (EmployeeID, Name, DepartmentID) VALUES
(101, 'Alice Johnson', 1),
(102, 'Bob Smith', 2),
(103, 'Charlie Brown', 3),
(104, 'David White', 4),
(105, 'Eve Davis', 5);


INSERT INTO Salaries (EmployeeID, Salary, SalaryDate) VALUES
(101, 60000.00, '2023-01-01'),
(102, 75000.00, '2023-01-01'),
(103, 55000.00, '2023-01-01'),
(104, 90000.00, '2023-01-01'),
(105, 50000.00, '2023-01-01'),
(101, 62000.00, '2024-01-01'),
(102, 77000.00, '2024-01-01'),
(103, 57000.00, '2024-01-01'),
(104, 92000.00, '2024-01-01'),
(105, 51000.00, '2024-01-01');

-- Query --



select
	dep.DepartmentName,
    emp.Name,
    max(sal.Salary) as Salary
from
	Employees emp
join
	Departments dep on emp.DepartmentID = dep.DepartmentID
join
	Salaries sal on emp.EmployeeID = sal.EmployeeID
group by
	dep.DepartmentName,emp.Name
















