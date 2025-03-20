-------------------- Question ----------------------

--Imagine you manage a table Logs:
--Logs: "id" (integer), "num" (integer).


--Find all numbers that appear at least three times consecutively.

-- Table Creation --

CREATE TABLE logs (
    id INT,
    num INT
);

INSERT INTO logs (id, num)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 2),
    (5, 1),
    (6, 2),
    (7, 2);

------------------------- Query 1 --------------------------------

with num_table as(
    select
        num,
        lead(num,1) over (order by num) as next_num,
        lag(num,1) over (order by num) as last_num
    from logs
)

select
    distinct num
from
    num_table
where
    num = next_num = last_num
