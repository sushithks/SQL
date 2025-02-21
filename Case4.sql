-------------------- Question ----------------------

--Imagine you manage tables Employees, Managers:
--Employees table holds "EmployeelD" (integer), "FirstName" (string), "LastName" (string), and "ManagerlD" (integer).
--The Managers table offers "ManagerlD" (integer) and "ManagerName" (string).

--Write a SQL query to find all the details of employees along with the manager details who are assigned to multiple managers.


-- Creating the Managers table
CREATE TABLE Managers (
    ManagerID INT PRIMARY KEY,
    ManagerName VARCHAR(100)
);

-- Creating the Employees table
CREATE TABLE Employees1 (
    EmployeeID INT ,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ManagerID INT
);


-- Data Insert --
INSERT INTO Managers (ManagerID, ManagerName)
VALUES
(1, 'Alice Johnson'),
(2, 'Bob Smith'),
(3, 'Charlie Davis');

-- Inserting data into the Employees table
INSERT INTO Employees1 (EmployeeID, FirstName, LastName, ManagerID)
VALUES
(101, 'John', 'Doe', 1),
(102, 'Jane', 'Smith', 2),
(103, 'Emily', 'Jones', 1),
(104, 'David', 'Brown', 3),
(105, 'Sarah', 'Davis', 2),
(106, 'Michael', 'Wilson', 1),
(107, 'Olivia', 'Taylor', 3),
(108, 'James', 'Hernandez', 2),
(109, 'Sophia', 'Moore', 1),
(109, 'Sophia', 'Moore', 2),
(110, 'William', 'Garcia', 3);

-- Query --

