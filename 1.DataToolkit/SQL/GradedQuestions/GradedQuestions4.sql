/*Analysis of Movie Categories
Description: Write a query to find out how many times a particular movie category is rented. 
Arrange these categories in the decreasing order of the number of times they are rented.

Sample Output: Name, Rental_count
*/
# category, film, film_category, inventory, rental

USE sakila;

/*i.inventory_id,*/
/*
SELECT cat_ren.name as Name, SUM(cat_ren.count) AS Rental_count FROM (
SELECT f.film_id, f.title, fc.category_id, c.name as name, COUNT(r.rental_id) as count FROM inventory i
RIGHT JOIN film f USING (film_id)
LEFT JOIN film_category fc USING(film_id)
LEFT JOIN category c USING(category_id)
LEFT JOIN rental r USING (inventory_id)
GROUP BY f.film_id, f.title,fc.category_id, c.name
ORDER BY f.film_id
) AS cat_ren 
GROUP BY Name
HAVING Rental_count != 0
ORDER BY Rental_count DESC
*/


/* Science Fiction Enthusiasts
Description: Write a query to find the full names of customers who have rented sci-fi movies more than 2 times. 
Arrange these names in the alphabetical order.

Sample Output
Customer_name
MARY SMITH
*/
# tables: category, customer, film, film_category, inventory, rental

#select customer_id, CONCAT(first_name,'',last_name) as Full_name from customer cu

/*film_id, title,cu.customer_id customer_id,c.name category,  */
SELECT CONCAT(first_name,' ',last_name) as Customer_name, COUNT(r.rental_id) rentals FROM film f
INNER JOIN inventory i USING(film_id)
LEFT JOIN film_category fc USING(film_id)
LEFT JOIN category c USING(category_id)
INNER JOIN rental r USING(inventory_id)
INNER JOIN customer cu USING(customer_id)
WHERE c.name = 'Sci-Fi'
GROUP BY customer_id, Customer_name#, category
HAVING rentals > 2
ORDER BY rentals DESC

/*
inner join address using (city_id)
inner join customer using (address_id)
inner join payment using (customer_id)
group by city order by sum(amount) 
desc limit 1;*/

