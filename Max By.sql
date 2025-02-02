

-- Table Creation --
CREATE TABLE vegetables (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- Data Insert --

INSERT INTO vegetables (name, price) VALUES
    ('Broccoli', 10.15),
    ('Cabbage', 5.25),
    ('Arugula', 1.05),
    ('Carrot', 2.50),
    ('Spinach', 3.75),
    ('Lettuce', 4.10),
    ('Kale', 6.30),
    ('Cauliflower', 7.80),
    ('Bell Pepper', 8.90),
    ('Zucchini', 3.45);


-- Max By function --
SELECT MAX_BY (name, price) as Exp_grocery
FROM groceries;

-- Same process using subquery --

SELECT
name
FROM groceries
WHERE price = (SELECT MAX(price) FROM groceries)

