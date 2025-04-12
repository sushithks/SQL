-------------------- Question ----------------------

--Imagine you manage a table Person :
--Employees: "id" (integer), "email" (String)

--Question :-- Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.

------------------ Table Creation --------------------

-- Create the Employee table
CREATE TABLE Person (
    id INT PRIMARY KEY,
    email VARCHAR(255)
);


-- Insert data into Employee table
INSERT INTO Person (id, email) VALUES
(1, 'john@example.com'),
(2, 'bob@example.com'),
(3, 'john@example.com'),
(4, 'alice@example.com'),
(5, 'john@example.com'),
(6, 'bob@example.com'),
(7, 'carol@example.com'),
(8, 'alice@example.com'),
(9, 'bob@example.com');


------------------------- Query  --------------------------------

DELETE FROM
    Person
WHERE
    id IN (
        SELECT id
        FROM (
            SELECT
                id,
               ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rn
            FROM Person
        ) t
        WHERE rn > 1
    )
