
-------------------- Question ----------------------

--Imagine you manage two table Orders, Products  :
--Products: "product_id" (integer), "product_name" (String), "product_category" (String)
--Orders: "product_id" (integer), "order_date" (Date), "unit" (integer)

--Question :-- Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.

------------------ Table Creation --------------------

-- Create the Activities table

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    product_category VARCHAR(50)
);


CREATE TABLE Orders (
    product_id INT,
    order_date DATE,
    unit INT
);

-- Insert data into Products table

INSERT INTO Products (product_id, product_name, product_category) VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'),
(4, 'Lenovo', 'Laptop'),
(5, 'Leetcode Kit', 'T-shirt');



INSERT INTO Orders (product_id, order_date, unit) VALUES
(1, '2020-02-05', 60),
(1, '2020-02-10', 70),
(2, '2020-01-18', 30),
(2, '2020-02-11', 80),
(3, '2020-02-17', 2),
(3, '2020-02-24', 3),
(4, '2020-03-01', 20),
(4, '2020-03-04', 30),
(4, '2020-03-04', 60),
(5, '2020-02-25', 50),
(5, '2020-02-27', 50),
(5, '2020-03-01', 50);

