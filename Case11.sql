-------------------- Question ----------------------

--Imagine you manage a table Activity:
--Activity: "machine_id" (integer), "process_id" (date), "activity_typ" (string), "timestamp" (float).


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


------------------------- Query 1 --------------------------------

SELECT
    A.machine_id,
    ROUND(AVG(B.timestamp - A.timestamp), 3) AS processing_time
FROM
    Activity A
JOIN
    Activity B
ON
    A.machine_id = B.machine_id AND
    A.process_id = B.process_id AND
    A.activity_type = 'start' AND
    B.activity_type = 'end'
GROUP BY
    A.machine_id;
