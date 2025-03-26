-------------------- Question ----------------------

--Imagine you manage a table accounts:
--accounts: "account_id" (integer), "income" (Integer)

--Question :-- Write a solution to calculate the number of bank accounts for each salary category. The salary categories are:

-- "Low Salary": All the salaries strictly less than $20000.
-- "Average Salary": All the salaries in the inclusive range [$20000, $50000].
-- "High Salary": All the salaries strictly greater than $50000.



------------------- Table Creation --------------------

-- Create the Account table
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    income INT
);
-- Insert data into Products table

INSERT INTO accounts (account_id, income) VALUES
(3, 108939),
(2, 12747),
(8, 87709),
(6, 91796);



------------------------- Query 1 --------------------------------

with low as(
    select
        case when 1=1 then 'Low Salary' end as category,
        count(*)  as accounts_count
    from
        accounts
    where
        income < 20000
),
Average as (
    select
        case when 1=1 then 'Average Salary' end as category,
        count(*)  as accounts_count
    from
        accounts
    where
        income between 20000 and 50000
),
High as (
    select
        case when 1=1 then 'High Salary' end as category,
        count(*)  as accounts_count
    from
        accounts
    where
        income > 50000
)
select * from low
UNION
select * from Average
UNION
select * from High
