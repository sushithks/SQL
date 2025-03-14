-------------------- Question ----------------------

--Imagine you manage a table Weather:
--Weather: "id" (integer), "recordDate" (date), "temperature" (integer).


--Write a sql query to find all dates with higher temperatures compared to its previous dates (yesterday).


-- Table Creation --
CREATE TABLE Weather (
    id INT,
    recordDate DATE,
    temperature INT
);


-- Data Insert --

INSERT INTO Weather (id, recordDate, temperature) VALUES
(1, '2025-02-28', 20),
(2, '2025-03-01', 22),
(3, '2025-03-02', 19),
(4, '2025-03-03', 23),
(5, '2025-03-04', 21),
(6, '2025-03-05', 25),
(7, '2025-03-06', 27),
(8, '2025-03-07', 26);

-- Query --


SELECT
    w1.recordDate,
    (w1.temperature - w2.temperature) as temperature_difference
FROM
    weather w1
JOIN
    weather w2
ON
    w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE
    w1.temperature > w2.temperature