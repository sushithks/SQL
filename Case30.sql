-------------------- Question ----------------------

--Imagine you manage three tables:
--Movies: "movie_id" (integer), "title" (String)
--Users: "user_id" (integer), "name" (String)
--MovieRating: "movie_id" (integer), "user_id" (integer),"rating" (integer), "created_at" (Date)

--Question:
--Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
-- Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.

-- Table Creation --
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE MovieRating (
    movie_id INT,
    user_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    created_at DATE NOT NULL
);


---------------------------- Data Insert ---------------------------------

INSERT INTO Movies (movie_id, title) VALUES
(1, 'Avengers'),
(2, 'Frozen 2'),
(3, 'Joker');

INSERT INTO Users (user_id, name) VALUES
(1, 'Daniel'),
(2, 'Monica'),
(3, 'Maria'),
(4, 'James');

INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES
(1, 1, 3, '2020-01-12'),
(1, 2, 4, '2020-02-11'),
(1, 3, 2, '2020-02-12'),
(1, 4, 1, '2020-01-01'),
(2, 1, 5, '2020-02-17'),
(2, 2, 2, '2020-02-01'),
(2, 3, 2, '2020-03-01'),
(3, 1, 3, '2020-02-22'),
(3, 2, 4, '2020-02-25');


-- Query --


with Huser as(
    SELECT name
    FROM
        Users
        NATURAL JOIN MovieRating
    GROUP BY user_id
    ORDER BY COUNT(*) DESC, name
    LIMIT 1
    ),
Hmovies as (
    SELECT title
    FROM
        Movies
        NATURAL JOIN MovieRating
        WHERE YEAR (created_at) = 2020 AND MONTH (created_at) = 2
    GROUP BY movie_id
    ORDER BY AVG(rating) DESC, title
    LIMIT 1
    )

Select name as results
from Huser
UNION ALL
select title
from Hmovies

