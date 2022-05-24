/*Film-obsessed City
Description: Write a query to find the city which generated the maximum revenue for the organisation.
Sample Output
city
Abu Dhabi*/
# address, city, customer, payment

USE sakila;

/*
SELECT cust_city.city as city FROM 
	(SELECT customer_id, COUNT(customer_id) as count, SUM(amount) as amount FROM payment GROUP BY customer_id) pay 
RIGHT OUTER JOIN (
	SELECT cu.customer_id, ci.city_id, ci.city as city, count(city) as count FROM address a
	RIGHT JOIN customer cu ON cu.address_id = a.address_id
	LEFT JOIN city ci ON a.city_id = ci.city_id
	GROUP BY cu.customer_id, ci.city_id, ci.city
	ORDER BY count DESC) cust_city 
ON pay.customer_id = cust_city.customer_id
ORDER BY amount DESC
LIMIT 1
*/

/*
select City from city
inner join address using (city_id)
inner join customer using (address_id)
inner join payment using (customer_id)
group by city order by sum(amount) desc limit 1;
*/


/*
# Create views

CREATE VIEW film_ex AS (SELECT i.inventory_id as inventory_id, f.film_id as film_id, title, rental_id,rental_rate FROM inventory AS i
INNER JOIN film AS f ON f.film_id = i.film_id
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY inventory_id, film_id, title, rental_id, rental_rate)
*/
/*
CREATE VIEW customer_ex AS (
SELECT cust.customer_id, cust.first_name, cust.address_id, a.address, a.city_id, c.city as city FROM address a 
RIGHT OUTER JOIN customer cust ON cust.address_id = a.address_id
LEFT OUTER JOIN city c ON a.city_id = c.city_id
);
SELECT c.city AS city, COUNT(r.rental_id) as count FROM rental r
LEFT OUTER JOIN customer_ex c ON r.customer_id = c.customer_id
GROUP BY city
ORDER BY count DESC
*/

/*
SELECT a.address, COUNT(customer_id) AS count FROM customer cu
INNER JOIN address a ON cu.address_id = a.address_id
GROUP BY a.address
ORDER BY count DESC
*/


/*
SELECT title FROM film WHERE film_id = (
SELECT film_id FROM (
SELECT film_id, title, rental_rate, count, count * rental_rate AS revenue FROM (
SELECT f.film_id as film_id, title, rental_rate,COUNT(rental_id) AS count FROM inventory AS i
INNER JOIN film AS f ON f.film_id = i.film_id
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY film_id, title, rental_rate
) AS x
ORDER BY revenue DESC
LIMIT 1
) AS y
)
*/