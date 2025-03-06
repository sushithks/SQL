-------------------- Question ----------------------

--Imagine you manage two tables Signups, Confirmations :
-- Signups : "user_id " (integer), "time_stamp" (DATETIME)
-- Confirmations :   "user_id" (integer), "time_stamp" (DATETIME), "action" (VARCHAR)


-- Question : Write a SQL query to find the confirmation rate of each user ?


-- Table Creation --
-- Create Signups table
CREATE TABLE Signups (
    user_id INT,
    time_stamp DATETIME
);

-- Create Confirmations table
CREATE TABLE Confirmations (
    user_id INT,
    time_stamp DATETIME,
    action VARCHAR(50)
);


-- Data Insert --

-- Insert data into Signups table
INSERT INTO Signups (user_id, time_stamp) VALUES
(3, '2020-03-21 10:16:13'),
(7, '2020-01-04 13:57:59'),
(2, '2020-07-29 23:09:44'),
(6, '2020-12-09 10:39:37');

-- Insert data into Confirmations table
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES
(3, '2021-01-06 03:30:46', 'timeout'),
(3, '2021-07-14 14:00:00', 'timeout'),
(7, '2021-06-12 11:57:29', 'confirmed'),
(7, '2021-06-13 12:58:28', 'confirmed'),
(7, '2021-06-14 13:59:27', 'confirmed'),
(2, '2021-01-22 00:00:00', 'confirmed'),
(2, '2021-02-28 23:59:59', 'timeout');


-- Query --


select
    sig.user_id,
    round(AVG(case when action = 'confirmed' then 1 else 0 end),2)as confirmation_rate
from
    Signups sig
left join
    Confirmations con
on
    sig.user_id = con.user_id
group by
    sig.user_id