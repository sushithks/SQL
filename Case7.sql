-------------------- Question ----------------------

--Imagine you manage a table Students:
--"Students" contains "StudentID" (integer), "Name" (string), and "DateOfBirth" (date.

--Devise aquery to find the student whose name does not start or end with a vowel.


-- Table Creation --
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    DateOfBirth DATE
);


-- Data Insert --

INSERT INTO Students (StudentID, Name, DateOfBirth)
VALUES
(1, 'John Doe', '2001-05-15'),
(2, 'Jane Smith', '2000-03-22'),
(3, 'Emily Johnson', '2002-07-30'),
(4, 'Michael Williams', '2001-11-05'),
(5, 'Sarah Brown', '2000-09-10'),
(6, 'David Jones', '2002-01-18'),
(7, 'Jessica Garcia', '2001-12-25'),
(8, 'Daniel Martinez', '2000-06-14'),
(9, 'Samantha Hernandez', '2002-04-02'),
(10, 'William Lopez', '2001-08-23'),
(11, 'Olivia Gonzalez', '2000-12-03'),
(12, 'James Wilson', '2002-02-28'),
(13, 'Charlotte Moore', '2001-10-13'),
(14, 'Benjamin Taylor', '2000-07-05'),
(15, 'Sophia Anderson', '2002-06-17');

-- Query --

SELECT
    DISTINCT Name
FROM
    Students
WHERE
    LEFT(Name, 1) NOT IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U') AND
    RIGHT(Name, 1) NOT IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');

