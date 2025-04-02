-------------------- Question ----------------------

--Imagine you manage a table Customer:
--accounts: "customer_id" (integer), "name" (String),"visited_on" (Date), "amount" (integer)

--Question :-- Write a solution to Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.


------------------- Table Creation --------------------

-- Create the Booking table
CREATE TABLE Customer_02 (
    customer_id INT,
    name VARCHAR(50),
    visited_on DATE,
    amount INT,
);

-- Insert data into Booking table
INSERT INTO Customer_02 (customer_id, name, visited_on, amount) VALUES
(1, 'Jhon', '2019-01-01', 100),
(2, 'Daniel', '2019-01-02', 110),
(3, 'Jade', '2019-01-03', 120),
(4, 'Khaled', '2019-01-04', 130),
(5, 'Winston', '2019-01-05', 110),
(6, 'Elvis', '2019-01-06', 140),
(7, 'Anna', '2019-01-07', 150),
(8, 'Maria', '2019-01-08', 80),
(9, 'Jaze', '2019-01-09', 110),
(1, 'Jhon', '2019-01-10', 130),
(3, 'Jade', '2019-01-10', 150);

------------------------- Query 1 --------------------------------


WITH
    amount_by_day AS (
        SELECT visited_on, SUM(amount) AS amount
        FROM Customer
        GROUP BY visited_on
),
amount_window AS (
    SELECT
        visited_on,
        SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount
    FROM amount_by_day
    ORDER BY visited_on
    LIMIT 1000
    OFFSET 6
)

SELECT
    visited_on,
    amount,
    ROUND(amount / 7, 2) AS average_amount
FROM
    amount_window



------------------------- Query 2 --------------------------------

select
    distinct visited_on,
    sum(amount) over w as amount,
    round((sum(amount) over w)/7, 2) as average_amount
from
    Customer
WINDOW w AS (
            order by
                visited_on
            range between interval 6 day PRECEDING and current row
    )
    Limit 6, 1000
