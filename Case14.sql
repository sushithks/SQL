-------------------- Question ----------------------

--Imagine you manage two tables Prices , UnitsSold  :
-- Prices : "product_id" (integer), "start_date" (DATE), "end_date" (DATE), "price" (integer)
-- UnitsSold : "product_id" (integer), "purchase_date" (DATE), "units" (integer)


-- Question : Write a SQL query to  find the average selling price for each product.
-- average_price should be rounded to 2 decimal places. If a product does not have any sold units,
-- its average selling price is assumed to be 0?


-- Table Creation --

-- Create Prices table
CREATE TABLE Prices (
    product_id INT,
    start_date DATE,
    end_date DATE,
    price DECIMAL(10, 2)
);

-- Create UnitsSold table
CREATE TABLE UnitsSold (
    product_id INT,
    purchase_date DATE,
    units INT
);


-- Data Insert --

-- Insert data into Prices table
INSERT INTO Prices (product_id, start_date, end_date, price) VALUES
(1, '2019-02-17', '2019-02-28', 5),
(1, '2019-03-01', '2019-03-22', 20),
(2, '2019-02-01', '2019-02-20', 15),
(2, '2019-02-21', '2019-03-31', 30);


-- Insert data into UnitsSold table
INSERT INTO UnitsSold (product_id, purchase_date, units) VALUES
(1, '2019-02-25', 100),
(1, '2019-03-01', 15),
(2, '2019-02-10', 200),
(2, '2019-03-22', 30);


-- Query --

SELECT
	pri.product_id,
	ROUND(IFNULL(SUM(pri.price*uni.units)/SUM(uni.units),0),2) as average_price
FROM
	Prices pri
LEFT JOIN
	UnitsSold uni
ON
	pri.product_id = uni.product_id AND
	uni.purchase_date BETWEEN pri. start_date AND pri.end_date
GROUP BY
pri.product_id

