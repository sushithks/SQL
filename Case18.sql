-------------------- Question ----------------------

--Imagine you manage a table Delivery:
--Delivery: "delivery_id " (integer), "customer_id " (integer), "order_date " (date), "customer_pref_delivery_date " (date).


--Write a solution to find the percentage of immediate orders in the first orders of all customers,
-- If delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.

-- Table Creation --

CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    customer_pref_delivery_date DATE
);



-- Insert data into the table
INSERT INTO deliveries (delivery_id, customer_id, order_date, customer_pref_delivery_date)
VALUES
    (1, 1, '2019-08-01', '2019-08-02'),
    (2, 2, '2019-08-02', '2019-08-02'),
    (3, 1, '2019-08-11', '2019-08-12'),
    (4, 3, '2019-08-24', '2019-08-24'),
    (5, 3, '2019-08-21', '2019-08-22'),
    (6, 2, '2019-08-11', '2019-08-13'),
    (7, 4, '2019-08-09', '2019-08-09');

------------------------- Query 1 --------------------------------



with main as (
	select
		customer_id,
        min(order_date) as first_order,
        min(customer_pref_delivery_date) as delivery_date
	from
		deliveries
	group by
		customer_id
)
select
	AVG(case when first_order = delivery_date then 1 else 0 end ) as immediate_percentage
from
	main