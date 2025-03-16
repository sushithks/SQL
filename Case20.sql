-------------------- Question ----------------------

--Imagine you manage two  Sales and Product:
-- Sales : "sale_id" (integer), "product_id" (integer), "year" (integer), "quantity" (integer), "price" (integer)
-- Product  : "product_id" (integer), "product_name" (string)


-- Question : Write a query to fetch the product ID, year, quantity, and price for the initial year of sale for every product


-- Table Creation --
CREATE TABLE Activity (
    user_id INT,
    session_id INT,
    activity_date DATE,
    activity_type VARCHAR(50)
);

-- Data Insert --
INSERT INTO Activity (user_id, session_id, activity_date, activity_type)
VALUES
    (1, 1, '2019-07-20', 'open_session'),
    (1, 1, '2019-07-20', 'scroll_down'),
    (1, 1, '2019-07-20', 'end_session'),
    (2, 4, '2019-07-20', 'open_session'),
    (2, 4, '2019-07-21', 'send_message'),
    (2, 4, '2019-07-21', 'end_session'),
    (3, 2, '2019-07-21', 'open_session'),
    (3, 2, '2019-07-21', 'send_message'),
    (3, 2, '2019-07-21', 'end_session'),
    (4, 3, '2019-06-25', 'open_session'),
    (4, 3, '2019-06-25', 'end_session');

-- Query --

SELECT product_id,
    year AS first_year,
    quantity,
    price
FROM
    sales
WHERE (product_id, year) IN (
    SELECT product_id, MIN(year)
    FROM sales
    GROUP BY product_id
)