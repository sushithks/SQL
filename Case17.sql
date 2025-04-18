-------------------- Question ----------------------

--Imagine you manage a table Transactions:
--Transactions: "id" (integer), "country" (string), "state" (string), "amount" (integer), "trans_date" (date).


--Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

-- Table Creation --

CREATE TABLE Transactions (
    id INT,
    country VARCHAR(2),
    state VARCHAR(10),
    amount INT,
    trans_date DATE
);

INSERT INTO Transactions (id, country, state, amount, trans_date)
VALUES
(121, 'US', 'approved', 1000, '2018-12-18'),
(122, 'US', 'declined', 2000, '2018-12-19'),
(123, 'US', 'approved', 2000, '2019-01-01'),
(124, 'DE', 'approved', 2000, '2019-01-07');

------------------------- Query  --------------------------------

select
	DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    count(id) as trans_count ,
    sum(case when state = 'approved' then 1 else 0 end ) as approved_count,
    sum(amount) as trans_total_amount ,
    sum(case when state = 'approved' then amount else 0 end ) as approved_total_amount
from
	Transactions
group by
	DATE_FORMAT(trans_date, '%Y-%m'),
    country