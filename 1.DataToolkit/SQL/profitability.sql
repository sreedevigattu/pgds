/*
Problem statement: Identify the sustainable (profitable) product categories so that the growth team can capitalise on them to increase sales.
Metrics: Some of the metrics that can be used for performing the profitability analysis are as follows:
Profits per product category
Profits per product subcategory
Average profit per order
Average profit percentage per order
*/
SELECT p.Product_Category, 
		-- p.Product_Sub_Category, 
        SUM(m.Profit) Profit,
        COUNT(DISTINCT order_number) total_orders,
        ROUND(SUM(m.Profit)/COUNT(DISTINCT order_number),2) Avg_Profit_per_order,
        ROUND(SUM(m.Sales)/COUNT(DISTINCT order_number),2) Avg_Sales_per_order,
        ROUND(SUM(m.Profit)/SUM(m.Sales),4)*100 Profit_percentage
FROM market_fact_full m
INNER JOIN prod_dimen p ON m.prod_id = p.prod_id
INNER JOIN orders_dimen o ON m.ord_id = o.ord_id
GROUP BY p.Product_Category 
	-- , p.Product_Sub_Category
ORDER BY p.Product_Category, SUM(m.Profit);

-- Exploring order table
SELECT /*ord_id, order_number, */COUNT(ord_id) c, COUNT(DISTINCT ord_id) ord_id_count, 
	COUNT(DISTINCT order_number) ord_no_count
FROM orders_dimen
#GROUP BY ord_id, order_number
ORDER BY COUNT(ord_id) DESC ;

SELECT * FROM orders_dimen 
WHERE order_number IN 
(
	SELECT order_number
	FROM orders_dimen
	GROUP BY order_number
	HAVING COUNT(ord_id) > 1
)
ORDER BY order_number;

/* Extract the details of the top ten customers in the expected output format.
cust_id, rank, customer_name, profit, city, state, sales */
WITH cust_summary AS 
(
	SELECT c.cust_id, 
			RANK() OVER (ORDER BY ROUND(SUM(m.profit),2) DESC) customer_rank,
			c.customer_name, ROUND(SUM(m.profit),2) profit, 
			c.city customer_city, c.state customer_state, ROUND(SUM(m.sales),2) sales
	FROM cust_dimen c
	INNER JOIN market_fact_full m ON c.cust_id = m.cust_id
	GROUP BY c.cust_id -- , c.customer_name,customer_city, customer_state
) 
SELECT * FROM cust_summary
WHERE customer_rank <=10;

/* Extract the required details of the customers who have not placed an order yet.
Expected columns: 'cust_id', cust_name', city', state', customer_segment'
A flag to indicate that there is another customer with the exact same name and city but a different customer ID.
*/
SELECT c.cust_id, customer_name, city, state, customer_segment, 
		/*COUNT(m.cust_id) count, */SUM(m.Order_Quantity) orders
FROM cust_dimen c
LEFT JOIN market_fact_full m ON c.cust_id = m.cust_id
#WHERE m.Ord_id IS NULL
GROUP BY c.cust_id, customer_name, city, state, customer_segment
ORDER BY orders;

-- Checking if customers with 0 orders really exist
SELECT cd.cust_dimen_cust, mff.market_fact_cust
FROM 
(SELECT COUNT(cust_id) cust_dimen_cust FROM cust_dimen) cd, 
(SELECT COUNT(DISTINCT cust_id) market_fact_cust FROM market_fact_full) mff;

/* Extract the required details of the customers who have placed one order.
Expected columns: 'cust_id', cust_name', city', state', customer_segment'
A flag to indicate that there is another customer with the exact same name and city but a different customer ID.
*/
SELECT c.cust_id, customer_name, city, state, customer_segment, COUNT(DISTINCT m.ord_id) orders,
	COUNT(city) OVER (PARTITION BY customer_name, city ORDER BY city ROWS UNBOUNDED PRECEDING) multiplecust
FROM cust_dimen c
LEFT JOIN market_fact_full m ON c.cust_id = m.cust_id
GROUP BY c.cust_id, customer_name, city, state, customer_segment
HAVING orders <> 1
ORDER BY multiplecust DESC;

WITH cust_details AS
(
	SELECT c.*, COUNT(DISTINCT ord_id) order_count
	FROM cust_dimen c
	LEFT JOIN market_fact_full m ON c.cust_id = m.cust_id
	GROUP BY cust_id
	HAVING COUNT(DISTINCT ord_id)  <> 1
),
fraud_cust AS
(
	SELECT customer_name, city, COUNT(cust_id) cust_id_count
	FROM cust_dimen
	GROUP BY customer_name, city
	HAVING COUNT(cust_id) > 1
)
SELECT cd.*, 
		CASE WHEN fc.cust_id_count IS NOT NULL THEN "FRAUD" 
        ELSE "NORMAL"
        END fraud_flag
FROM cust_details cd
LEFT JOIN fraud_cust fc ON cd.customer_name = fc.customer_name AND cd.city = fc.city;
