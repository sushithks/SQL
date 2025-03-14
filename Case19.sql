-------------------- Question ----------------------

--Imagine you manage a table Activity:
--Activity: "player_id" (integer), "device_id" (integer), "event_date" (date), "games_played" (integer).


--Write a solution to report the fraction of players that logged in again on the day after the day they first logged in

-- Table Creation --

CREATE TABLE Activity (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT
);



-- Insert data into the table
INSERT INTO Activity (player_id, device_id, event_date, games_played)
VALUES
    (1, 2, '2016-03-01', 5),
    (1, 2, '2016-03-02', 6),
    (2, 3, '2017-06-25', 1),
    (3, 1, '2016-03-02', 0),
    (3, 4, '2018-07-03', 5);

------------------------- Query 1 --------------------------------


