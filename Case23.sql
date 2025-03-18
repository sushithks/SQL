-------------------- Question ----------------------

--Imagine you manage TWO  table Employees and Sales:
--Employees: "id" (integer),"name" (String), department" (String), "salary" (integer), "hired_on" (Date)
--Sales : "employee_id" (integer),"product" (String), sales_date" (Date), "sales_amount" (integer),


--Write a solution to report all the employees whose total sales amount exceeds 8,000 in the last 2 months.


-- Table Creation --

-- Create the Employees table
CREATE TABLE Employee (
    id INT ,
    name VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10, 2),
    hired_on DATE
)

--Create the Sales table
CREATE TABLE Sales (
    employee_id INT,
    product VARCHAR(100),
    sales_date DATE,
    sales_amount DECIMAL(10, 2)
)


-- Insert data into Employees table

INSERT INTO Employee1 (id, name, department, salary, hired_on)
VALUES
    (1, 'John Doe', 'Sales', 55000.00, '2020-01-15'),
    (2, 'Jane Smith', 'Marketing', 60000.00, '2019-06-01'),
    (3, 'Alice Brown', 'Sales', 52000.00, '2021-03-25'),
    (4, 'Bob White', 'Sales', 57000.00, '2018-11-20'),
    (5, 'Charlie Black', 'HR', 65000.00, '2022-05-30');


 INSERT INTO sales1 (employee_id, product, sales_date, sales_amount) VALUES
    (1, 'Laptop', '2024-03-10', 1250.00),
    (1, 'Smartphone', '2024-04-15', 850.00),
    (1, 'Smartwatch', '2024-05-01', 320.00),
    (2, 'Tablet', '2024-03-12', 650.00),
    (2, 'Laptop', '2024-05-10', 1300.00),
    (2, 'Smartphone', '2024-06-01', 1000.00),
    (3, 'Laptop', '2024-03-14', 1300.00),
    (3, 'Smartphone', '2024-03-16', 900.00),
    (3, 'Tablet', '2024-07-05', 700.00),
    (4, 'Laptop', '2024-03-17', 1400.00),
    (4, 'Smartphone', '2024-03-19', 950.00),
    (4, 'Smartwatch', '2024-05-25', 350.00),
    (5, 'Tablet', '2024-03-20', 700.00),
    (5, 'Smartphone', '2024-03-22', 900.00),
    (5, 'Laptop', '2024-03-23', 1400.00),
    (1, 'Smartwatch', '2025-03-05', 350.00),
    (2, 'Tablet', '2025-05-10', 700.00),
    (3, 'Laptop', '2025-04-10', 1350.00),
    (4, 'Laptop', '2025-04-01', 1450.00),
    (5, 'Smartwatch', '2025-05-01', 370.00);

