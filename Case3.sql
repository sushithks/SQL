-------------------- Question ----------------------

--Imagine you manage a table Students:
--"Students" contains "StudentID" (integer), "FirstName" (string), "LastName" (string), and "DateOfBirth" (date.

--Devise a SQL query to determine each student's age in years, rounded to the nearest whole number.


-- Table Creation --
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE
);


-- Data Insert --

INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth)
VALUES
(1, 'John', 'Doe', '2001-05-15'),
(2, 'Jane', 'Smith', '2000-03-22'),
(3, 'Emily', 'Johnson', '2002-07-30'),
(4, 'Michael', 'Williams', '2001-11-05'),
(5, 'Sarah', 'Brown', '2000-09-10'),
(6, 'David', 'Jones', '2002-01-18'),
(7, 'Jessica', 'Garcia', '2001-12-25'),
(8, 'Daniel', 'Martinez', '2000-06-14'),
(9, 'Samantha', 'Hernandez', '2002-04-02'),
(10, 'William', 'Lopez', '2001-08-23'),
(11, 'Olivia', 'Gonzalez', '2000-12-03'),
(12, 'James', 'Wilson', '2002-02-28'),
(13, 'Charlotte', 'Moore', '2001-10-13'),
(14, 'Benjamin', 'Taylor', '2000-07-05'),
(15, 'Sophia', 'Anderson', '2002-06-17');

-- Query --


select
	StudentID,
    FirstName,
    LastName,
    ROUND(DATEDIFF(CURDATE(), DateOfBirth )/ 365.25,0) AS Age
from Students
