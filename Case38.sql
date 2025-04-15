
-------------------- Question ----------------------

--Imagine you manage a table Activities :
--Activities: "sell_date" (DATE), "product" (String)

--Question :-- Write a solution to find for each date the number of different products sold and their names.
--The sold products names for each date should be sorted lexicographically.
------------------ Table Creation --------------------

-- Create the Activities table

CREATE TABLE Employee (
    sell_date DATE,
    product VARCHAR(255)
);


-- Insert data into Activities table

INSERT INTO Activities (sell_date, product) VALUES
('2020-05-30', 'Headphone'),
('2020-06-01', 'Pencil'),
('2020-06-02', 'Mask'),
('2020-05-30', 'Basketball'),
('2020-06-01', 'Bible'),
('2020-06-02', 'Mask'),
('2020-05-30', 'T-Shirt');


