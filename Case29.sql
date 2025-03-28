-------------------- Question ----------------------

--Imagine you manage a table Sales:
--Sales: "id" (integer), "SaleDate" (DATE), Amount: "id" (DECIMAL)

--Question :-- Identify Employees with Increasing Sales for Four Consecutive Quarters


------------------- Table Creation --------------------

-- Create the Booking table
CREATE TABLE Sales (
    EmployeeId INT,
    SaleDate DATE,
    Amount DECIMAL(10, 2)
);



-- Insert data for Q1 2024 (January, February, March)
INSERT INTO Sales (EmployeeId, SaleDate, Amount) VALUES
(101, '2024-01-15', 1500.00),
(101, '2024-02-20', 1300.00),
(101, '2024-03-25', 1600.00),
(102, '2024-01-10', 1800.00),
(102, '2024-02-05', 2200.00),
(102, '2024-03-18', 1900.00);

-- Insert data for Q2 2024 (April, May, June)
INSERT INTO Sales (EmployeeId, SaleDate, Amount) VALUES
(101, '2024-04-10', 1450.00),
(101, '2024-05-15', 1750.00),
(101, '2024-06-22', 1400.00),
(102, '2024-04-05', 1800.00),
(102, '2024-05-25', 2000.00),
(102, '2024-06-18', 1950.00);

-- Insert data for Q3 2024 (July, August, September)
INSERT INTO Sales (EmployeeId, SaleDate, Amount) VALUES
(101, '2024-07-12', 1600.00),
(101, '2024-08-20', 1700.00),
(101, '2024-09-28', 1200.00),
(102, '2024-07-06', 1900.00),
(102, '2024-08-15', 1700.00),
(102, '2024-09-22', 2100.00);

-- Insert data for Q4 2024 (October, November, December)
INSERT INTO Sales (EmployeeId, SaleDate, Amount) VALUES
(101, '2024-10-10', 1650.00),
(101, '2024-11-05', 1550.00),
(101, '2024-12-18', 1800.00),
(102, '2024-10-03', 2000.00),
(102, '2024-11-12', 2100.00),
(102, '2024-12-25', 2200.00);
(111, '2024-01-15', 1000.00),  -- Q1
(111, '2024-02-20', 1200.00),  -- Q1
(111, '2024-03-25', 1100.00),  -- Q1
(111, '2024-04-10', 1150.00),  -- Q2
(111, '2024-05-15', 1300.00),  -- Q2
(111, '2024-06-22', 1250.00),  -- Q2
(111, '2024-07-12', 1400.00),  -- Q3
(111, '2024-08-20', 1500.00),  -- Q3
(111, '2024-09-28', 1450.00),  -- Q3
(111, '2024-10-10', 1600.00),  -- Q4
(111, '2024-11-05', 1700.00),  -- Q4
(111, '2024-12-18', 1650.00),  -- Q4
(112, '2024-01-10', 2000.00),  -- Q1
(112, '2024-02-05', 2200.00),  -- Q1
(112, '2024-03-18', 2100.00),  -- Q1
(112, '2024-04-05', 2300.00),  -- Q2
(112, '2024-05-25', 2500.00),  -- Q2
(112, '2024-06-18', 2400.00),  -- Q2
(112, '2024-07-06', 2600.00),  -- Q3
(112, '2024-08-15', 2700.00),  -- Q3
(112, '2024-09-22', 2650.00),  -- Q3
(112, '2024-10-03', 2800.00),  -- Q4
(112, '2024-11-12', 2900.00),  -- Q4
(112, '2024-12-25', 2850.00);  -- Q4


------------------------- Query  --------------------------------


 WITH QuarterlySales AS (
  SELECT
    EmployeeId,
    QUARTER(SaleDate) AS Quarter,
    SUM(Amount) AS QuarterlyAmount
  FROM
    Sales
  GROUP BY
    EmployeeId,
    QUARTER(SaleDate)
),
SalesTrend AS (
  SELECT
    EmployeeId,
    Quarter,
    QuarterlyAmount,
    LAG(QuarterlyAmount, 1) OVER (PARTITION BY EmployeeId ORDER BY Quarter) AS PrevQuarter1,
    LAG(QuarterlyAmount, 2) OVER (PARTITION BY EmployeeId ORDER BY Quarter) AS PrevQuarter2,
    LAG(QuarterlyAmount, 3) OVER (PARTITION BY EmployeeId ORDER BY Quarter) AS PrevQuarter3
  FROM
    QuarterlySales
)
SELECT
  EmployeeId,
  PrevQuarter3 as Quarter1,
  PrevQuarter2 as Quarter2,
  PrevQuarter1 as Quarter3,
  QuarterlyAmount as Quarter4
FROM
  SalesTrend
HAVING
  QuarterlyAmount > PrevQuarter1
  AND PrevQuarter1 > PrevQuarter2
  AND PrevQuarter2 > PrevQuarter3;
