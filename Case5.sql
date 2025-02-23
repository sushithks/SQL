-------------------- Question ----------------------

--Imagine you manage a table Orders:
--Orders contains "OrderlD" (integer), "OrderDate" (date), "CustomerID" (integer), and "TotalAmount" (decimal).

--Formulate a SQL query to compute the total order amount per customer for the year 2023, sorted by total amount in descending order.



-- Table Creation --
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    TotalAmount DECIMAL(10, 2)
);



-- Data Insert --

INSERT INTO Orders (OrderID, OrderDate, CustomerID, TotalAmount) VALUES
(1, '2021-01-15', 101, 250.75),
(2, '2021-03-10', 102, 130.50),
(3, '2021-06-05', 103, 500.00),
(4, '2021-09-17', 104, 75.00),
(5, '2021-11-22', 105, 320.40),
(6, '2022-01-18', 106, 140.60),
(7, '2022-03-12', 107, 215.90),
(8, '2022-06-20', 108, 400.00),
(9, '2022-08-02', 109, 99.99),
(10, '2022-10-30', 110, 180.50),
(11, '2023-01-22', 111, 350.20),
(12, '2023-03-05', 112, 255.30),
(13, '2023-05-11', 113, 125.00),
(14, '2023-08-15', 114, 475.80),
(15, '2023-12-10', 115, 630.10),
(16, '2024-02-10', 116, 215.60),
(17, '2024-04-18', 117, 185.00),
(18, '2024-06-05', 118, 320.45),
(19, '2024-09-23', 119, 510.30),
(20, '2024-11-02', 120, 150.90),
(21, '2023-05-12', 113, 243.00),
(22, '2023-04-01', 114, 1245.80),
(23, '2023-11-20', 115, 653.10);


---------------------- Main Query ---------------------


select
	CustomerID,
    sum(TotalAmount) as FinalTotalAmount
from
	Orders
where
	YEAR(OrderDate) = 2023
GROUP BY
	CustomerID
ORDER BY
	FinalTotalAmount DESC
