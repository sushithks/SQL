-------------------- Question ----------------------

--Imagine you manage three  Students, Subjects and Examinations:
-- Students : "student_id " (integer), "student_name  " (string)
-- Subjects :   "subject_name " (string)
-- Examinations :   "student_id" (integer), "subject_name" (string)


-- Question : Write a SQL query to find the number of times each student attended each exam?


-- Table Creation --
CREATE TABLE Student (
    student_id INT,
    student_name VARCHAR(100)
);

CREATE TABLE Subject (
    subject_name VARCHAR(100)
);

CREATE TABLE Examinations (
    student_id INT,
    subject_name VARCHAR(100)
);

-- Data Insert --

INSERT INTO Student (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

CREATE TABLE Subject (
    subject_name VARCHAR(100)
);

-- Insert more data into Examinations table
INSERT INTO Examinations (student_id, subject_name) VALUES
(1, 'Physics'),
(1, 'Mathematics'),
(1, 'Chemistry'),
(2, 'Physics'),
(2, 'Chemistry'),
(2, 'Mathematics'),
(3, 'Mathematics'),
(3, 'Physics'),
(3, 'Chemistry'),
(1, 'Mathematics'),
(1, 'Physics'),
(2, 'Chemistry'),
(2, 'Mathematics'),
(3, 'Physics'),
(3, 'Chemistry'),
(1, 'Chemistry'),
(2, 'Physics'),
(2, 'Chemistry'),
(3, 'Mathematics'),
(1, 'Physics'),
(3, 'Chemistry');


-- Query --


SELECT
    stu.student_id,
    stu.student_name,
    sub.subject_name,
    COUNT(ex.subject_name) AS attended_exams
FROM
    Students stu
CROSS JOIN
    Subjects sub
LEFT JOIN
    Examinations ex
ON
    stu.student_id = ex.student_id AND
    sub.subject_name = ex.subject_name
GROUP BY
    stu.student_id,
    stu.student_name,
    sub.subject_name
ORDER BY
    stu.student_id