/*Movie Fans from Arlington
Description: Write a query to find the full names of those customers who have rented at least one movie and 
belong to the city Arlington.

Sample Output
Customer_name
MARY SMITH
*/

# tables: address, city, customer, rental
/*, c.city city, COUNT(r.rental_id) rentals*/
/*
SELECT CONCAT(first_name,' ',last_name) Customer_name FROM rental r
INNER JOIN customer cu USING(customer_id)
INNER JOIN address a USING(address_id)
INNER JOIN city c USING(city_id)
WHERE city = 'Arlington'
GROUP BY Customer_name, address, city
HAVING COUNT(r.rental_id) > 0
#ORDER BY rentals DESC
*/

/*
Country-wise Analysis of Movies
Description: Write a query to find the number of movies rented across each country. Display only those countries where at 
least one movie was rented. Arrange these countries in the alphabetical order.

Sample Output
*/
# tables: address, city, country, customer, rental
SELECT country Country, COUNT(r.rental_id) Rental_count FROM rental r
INNER JOIN customer cu USING(customer_id)
INNER JOIN address a USING(address_id)
INNER JOIN city ci USING(city_id)
INNER JOIN country co USING(country_id)
GROUP BY country
HAVING Rental_count > 0
ORDER BY country