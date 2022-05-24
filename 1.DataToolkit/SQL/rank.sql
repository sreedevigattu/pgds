-- Comment
# Another Comment

USE market_star_schema;

SELECT customer_name, ord_id, ROUND(sales) AS rounded_sales,
RANK() OVER (ORDER BY sales DESC) sales_rank
FROM market_fact_full m
INNER JOIN cust_dimen c ON m.cust_id = c.cust_id
WHERE customer_name = "RICK WILSON";

WITH rank_info AS
(
	SELECT customer_name, ord_id, ROUND(sales) AS rounded_sales,
	RANK() OVER (ORDER BY sales DESC) sales_rank
	FROM market_fact_full m
	INNER JOIN cust_dimen c ON m.cust_id = c.cust_id
	WHERE customer_name = "RICK WILSON"
) SELECT * FROM rank_info WHERE sales_rank <=10;

SELECT ord_id, discount, customer_name,
	RANK() OVER w disc_rank,
    DENSE_RANK() OVER w disc_dense_rank
FROM market_fact_full m 
INNER JOIN cust_dimen c ON m.cust_id = c.cust_id
-- WHERE customer_name = "RICK WILSON"
WINDOW w AS (PARTITION BY customer_name ORDER BY discount DESC);

-- Number of orders each customer has placed
SELECT customer_name, COUNT(DISTINCT ord_id) ord_cnt,
	RANK() OVER (ORDER BY COUNT(DISTINCT ord_id) DESC) ord_rank, 
    DENSE_RANK() OVER (ORDER BY COUNT(DISTINCT ord_id) DESC) ord_dense_rank, 
    ROW_NUMBER() OVER (ORDER BY COUNT(DISTINCT ord_id) DESC) ord_row_num
FROM market_fact_full m
INNER JOIN cust_dimen c ON m.cust_id = c.cust_id
GROUP BY customer_name;

WITH shipping_summary AS
(
	SELECT ship_mode, MONTH(ship_date) shipping_month, COUNT(*) shipments
	FROM shipping_dimen
	GROUP BY ship_mode, MONTH(ship_date)
) 
SELECT *, 
	RANK() OVER (PARTITION BY ship_mode ORDER BY shipments DESC) shipping_rank
FROM shipping_summary;

-- Runnint total and Moving Average
WITH daily_shipping_summary AS
(
SELECT ship_date, sUM(shipping_cost) daily_total
FROM market_fact_full m 
INNER JOIN shipping_dimen s ON m.ship_id = s.ship_id
GROUP BY ship_date
)
SELECT 	*, 
		SUM(daily_total) OVER w_rt running_total,
		AVG(daily_total) OVER w_ma moving_average
FROM daily_shipping_summary
WINDOW w_rt AS (ORDER BY ship_date ROWS UNBOUNDED PRECEDING),
		w_ma AS (ORDER BY ship_date ROWS 6 PRECEDING);
        
-- LEAD & LAG
WITH 
cust_orders AS
(
	SELECT c.customer_name, m.ord_id, o.order_date
	FROM market_fact_full m
	LEFT JOIN orders_dimen o ON m.ord_id = o.ord_id
	LEFT JOIN cust_dimen c ON m.cust_id = c.cust_id
	WHERE customer_name = "RICK WILSON"
	GROUP BY c.customer_name, m.ord_id, o.order_date
), 
next_date_summary AS
(
	SELECT *, LEAD(order_date,1) OVER (ORDER BY order_date, ord_id) next_order_date
	FROM cust_orders
	ORDER BY customer_name, order_date, ord_id
)
SELECT *, DATEDIFF(next_order_date, order_date) AS days_diff 
FROM next_date_summary;

-- CASE WHEN EXAMPLE
/* 
Profit: 
	<=500 : Huge loss
    500 to 0 : Bearable Loss
    0 to 500 : Decent profit
    >= 500 : Good profit
*/
SELECT market_fact_id, 
		profit, 
        CASE
			WHEN profit < 500 THEN "Huge Loss"
            WHEN profit BETWEEN -500 AND 0 THEN "Bearable Loss"
            WHEN profit BETWEEN -500 AND 0 THEN "Decent profit"
            ELSE "Good profit"
		END AS Profit_Type
FROM market_fact_full;

-- CASE EXAMPLE - Another
/* Classify customers on the criteria
Top 10% - GOLD
Next 40% - SILVER
Next 50% BRONZE
*/
WITH cust_summary AS
(
	SELECT m.cust_id, c.customer_name, ROUND(SUM(m.sales)) AS total_sales,
		PERCENT_RANK() OVER (ORDER BY ROUND(SUM(m.sales)) DESC) perc_rank
	FROM market_fact_full m
	LEFT JOIN cust_dimen c ON m.cust_id = c.cust_id
	GROUP BY cust_id
)
SELECT *,
		CASE
			WHEN perc_rank < 0.1 THEN 'Gold'
            WHEN perc_rank < 0.5 THEN 'Silver'
            ELSE 'Bronze'
		END as customer_category
FROM cust_summary;

	