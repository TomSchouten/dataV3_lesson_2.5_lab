USE sakila;
--     Select all the actors with the first name ‘Scarlett’.
SELECT *
FROM actor
WHERE first_name = 'SCARLETT';
--     How many films (movies) are available for rent (titles of physical copies?) and how many films have been rented (as of now or in total)?
SELECT COUNT(DISTINCT inventory_id) FROM inventory; -- Gives total physical copies
SELECT COUNT(DISTINCT film_id) FROM inventory; -- Gives total unique movie Titles
SELECT COUNT(rental_date) FROM rental; -- Gives total amount of rented out movies
SELECT COUNT(return_date) FROM rental; -- Gives total of returned movies. Difference is movies not yet returned (rented out)

--     What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) AS 'max_duration' FROM film;
SELECT MIN(length) AS 'min_duration' FROM film;

--     What's the average movie duration expressed in format (hours, minutes)?
SELECT FLOOR(AVG(length) / 60) AS hours, ROUND(AVG(length) % 60) AS minutes
FROM film;

--     How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) FROM actor;

--     Since how many days has the company been operating (check DATEDIFF() function)?

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS 'operating days'
FROM rental;

--     Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, 
	   DATE_FORMAT(rental_date, "%W") AS 'Day', 
       DATE_FORMAT(rental_date, "%b") AS 'Month'
FROM   rental
LIMIT  20;

--     Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, DATE_FORMAT(rental_date, '%M') AS 'month',  DATE_FORMAT(rental_date, '%W') AS 'weekday',
CASE
WHEN DATE_FORMAT(rental_date, '%W') IN ('Saturday', 'Sunday') then 'weekend'
WHEN DATE_FORMAT(rental_date, '%W') IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday') then 'workday'
ELSE 'INCORRECT DATE'
END AS 'day_type'
FROM sakila.rental;

--     Get release years.
SELECT release_year
FROM   film;

--     Get all films with ARMAGEDDON in the title.
SELECT *
FROM   film
WHERE  title
LIKE   ('%ARMAGEDDON%');

--     Get all films which title ends with APOLLO.
SELECT *
FROM   film
WHERE  title
LIKE   ('%APOLLO');

--     Get 10 the longest films.

SELECT   *
FROM     film
ORDER BY length DESC
LIMIT    10;

--     How many films include Behind the Scenes content?
SELECT *
FROM   film
WHERE  special_features
LIKE   ('%behind the scenes%');
