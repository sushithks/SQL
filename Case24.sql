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


------------------------- Query 2 --------------------------------

select
    distinct l1.num
from
    logs l1,
    logs l2,
    logs l3
where
    l1.Id = l2.Id - 1
    and l2.Id = l3.Id - 1
    and l1.num = l2.num
    and l2.num = l3.num


------------------------- Query 3 --------------------------------

select
    distinct l1.num
from
    logs l1
join
    logs l2
on
    l1.num = l2.num
    and l1.id = l2.id -1
join
    logs l3
 on
    l2.num = l3.num
    and l2.id = l3.id -1