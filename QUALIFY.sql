

-- Table Creation --
CREATE TABLE sales (
    Product VARCHAR(100),
    Region VARCHAR(100),
    Sales DECIMAL(10, 2)
);


-- Data Insert --

INSERT INTO sales (Product, Region, Sales)
VALUES
    ('Laptop', 'North America', 50000.00),
    ('Smartphone', 'Europe', 30000.00),
    ('Tablet', 'Asia', 15000.00),
    ('Smartwatch', 'Australia', 12000.00),
    ('Headphones', 'North America', 8000.00),
    ('Camera', 'Europe', 20000.00),
    ('Monitor', 'Asia', 10000.00),
    ('Keyboard', 'North America', 5000.00),
    ('Mouse', 'Europe', 7000.00),
    ('Speaker', 'Australia', 6000.00);



-- Using sub-query --
Select * from
    (select Product,
        Region,
        Sales,
        ROW_NUMBER() OVER(PARTITION BY Region ORDER BY Sales DESC) as rev
     from sales)
     where rev = 1

----- Using QUALIFY -------

select Product, Region, Sales
from sales
QUALIFY ROW_NUMBER() OVER(PARTITION BY Region ORDER BY Sales DESC) = 1

