-------------------- Question ----------------------

--Imagine you manage a table Booking:
--accounts: "id" (integer), "name" (String)

--Question :-- Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.



------------------- Table Creation --------------------

-- Create the Booking table
CREATE TABLE Booking (
    id INT ,
    name VARCHAR(50)
);
-- Insert data into Booking table

INSERT INTO Booking (id, name) VALUES
(1, 'Abbot'),
(2, 'Doris'),
(3, 'Emerson'),
(4, 'Green'),
(5, 'Jeames');


------------------------- Query 1 --------------------------------


select
    case
        when id % 2 = 1 and id + 1 in (select id from Booking) then id + 1
        when id % 2 = 0 then id - 1
        else id
    end as id,
    name
from
    Booking
order by
    id

