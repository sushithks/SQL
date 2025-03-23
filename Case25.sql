-------------------- Question ----------------------

--Imagine you manage a table Products:
--Products: "product_id" (integer), "new_price" (integer), change_date" (Date)

--Question :-- Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.



-- Table Creation --

-- Create the Products table
CREATE TABLE Products  (
    product_id INT,
    new_price DECIMAL(10, 2),
    change_date DATE
);

-- Insert data into Products table
INSERT INTO Products (product_id, new_price, change_date)
VALUES
    (1, 20, '2019-08-14'),
    (2, 50, '2019-08-14'),
    (1, 30, '2019-08-15'),
    (1, 35, '2019-08-16'),
    (2, 65, '2019-08-17'),
    (3, 20, '2019-08-18');

