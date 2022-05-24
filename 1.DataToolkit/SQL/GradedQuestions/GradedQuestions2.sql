USE sakila;


/* Busiest Actor
Description: Write a query to find the full name of the actor who has acted in the maximum number of movies.
Sample Output
Full_name: PENELOPE GUINESS*/

/*
# Using join
SELECT Full_name FROM (
SELECT CONCAT(first_name, ' ', last_name) AS Full_name, COUNT(film_id) as films
FROM actor AS a INNER JOIN film_actor as fm ON a.actor_id = fm.actor_id
GROUP BY a.actor_id, Full_name
ORDER BY films DESC
LIMIT 3
) AS af
*/
/*
# Using nested queries
SELECT CONCAT(first_name, ' ', last_name) AS Full_name FROM actor 
WHERE actor_id = (SELECT actor_id FROM 
	(SELECT actor_id, COUNT(*) AS films FROM film_actor
	GROUP BY actor_id
	ORDER BY films DESC
	LIMIT 1) AS actor_films
)
*/

/* Third most Busy Actor
Description: Write a query to find the full name of the actor who has acted in the third most number of movies.
Sample Output: 
Actor_name
PENELOPE GUINESS
*/

/*
SELECT Actor_name FROM (
SELECT CONCAT(first_name, ' ', last_name) AS Actor_name, COUNT(film_id) as films
FROM actor AS a INNER JOIN film_actor as fm ON a.actor_id = fm.actor_id
GROUP BY a.actor_id, Actor_name
ORDER BY films DESC
LIMIT 2, 1
) AS af
*/

/*Highest Grossing Film
Description: Write a query to find the film which grossed the highest revenue for the video renting organisation.
Sample Output
title
ACADEMY DINOSAUR
*/

SELECT title FROM film WHERE film_id = (
SELECT film_id FROM (
SELECT film_id, title, rental_rate, count, count * rental_rate AS revenue FROM (
SELECT /*i.inventory_id,*/ f.film_id as film_id, title, rental_rate, /*rental_id, rental_rate,*/ COUNT(rental_id) AS count FROM inventory AS i
INNER JOIN film AS f ON f.film_id = i.film_id
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY film_id, title, rental_rate
) AS x
ORDER BY revenue DESC
LIMIT 1
) AS y
)


