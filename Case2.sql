-------------------- Question ----------------------

--Imagine you manage two tables:
--Products, Categories.
--"Products" containing "ProductID" (integer), "CategorylD" (integer), "ProductName" (string), and "UnitsinStock" (integer).
--"Categories" table, which holds "CategoryID" (integer) and "CategoryName" (string).
--Compose a SQL query to find the top 3 categories with the highest average units in stock.


-- Table Creation --
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);

-- Creating the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    CategoryID INT,
    ProductName VARCHAR(255) NOT NULL,
    UnitsInStock INT);


-- Data Insert --

INSERT INTO Categories (CategoryID, CategoryName)
VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books'),
(4, 'Furniture');

INSERT INTO Products (ProductID, CategoryID, ProductName, UnitsInStock)
VALUES
(1, 1, 'Smartphone', 50),
(2, 1, 'Laptop', 30),
(3, 1, 'Smartwatch', 120),
(4, 1, 'Headphones', 80),
(5, 1, 'Bluetooth Speaker', 60),
(6, 2, 'T-shirt', 100),
(7, 2, 'Jeans', 75),
(8, 2, 'Jacket', 40),
(9, 2, 'Sneakers', 90),
(10, 2, 'Dress', 50),
(11, 3, 'Novel', 200),
(12, 3, 'Cookbook', 150),
(13, 3, 'Self-help Book', 80),
(14, 3, 'E-book Reader', 40),
(15, 3, 'Magazine Subscription', 300),
(16, 4, 'Sofa', 10),
(17, 4, 'Dining Table', 15),
(18, 4, 'Bookshelf', 25),
(19, 4, 'Coffee Table', 20),
(20, 4, 'Recliner Chair', 12);

-- Query --

select cat.CategoryName, avg(UnitsInStock) as AverageStock
from Categories cat
join Products pro
  on cat.CategoryID = pro.CategoryID
group by cat.CategoryName
order by avg(UnitsInStock) desc
limit 3



with CategoryAverage AS(
select cat.CategoryName, avg(UnitsInStock) as AverageStock
from Categories cat
join Products pro
  on cat.CategoryID = pro.CategoryID
group by cat.CategoryName
)

select AverageStock, AverageStock
from CategoryAverage
order by AverageStock desc
limit 3
