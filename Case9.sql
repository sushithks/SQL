-------------------- Question ----------------------

--Imagine you manage two  Visits and Transactions:
-- Visits : "visit_id"  (integer), "customer_id"  (integer)
-- Transactions :   "transaction_id"  (integer), "visit_id"  (integer), "amount" (integer)

-- Question : Write a SQL query to list users who had visits without any transactions and how many times they visited?


-- Table Creation --
CREATE TABLE Visits (
    visit_id INT,
    customer_id INT
);

CREATE TABLE Transactions (
    transaction_id INT,
    visit_id INT,
    amount INT
);


-- Data Insert --

INSERT INTO Visits (visit_id, customer_id) VALUES
(1, 23),
(2, 9),
(4, 30),
(5, 54),
(6, 96),
(7, 54),
(8, 54);


INSERT INTO Transactions (transaction_id, visit_id, amount) VALUES
(2, 5, 310),
(3, 5, 300),
(9, 5, 200),
(12, 1, 910),
(13, 2, 970);

-- Query --


select
    customer_id,
    count(vis.visit_id) as count_of_transactions
from
    Visits vis
left join
    Transactions trans on vis.visit_id = trans.visit_id
where
    transaction_id is null
group by
    customer_id
