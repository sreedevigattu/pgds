	USE market_star_schema;

	DELIMITER $$
	CREATE PROCEDURE get_sales_customers(sales_input INT)
	BEGIN
		SELECT DISTINCT cust_id, ROUND(sales) sales_amount
		FROM market_fact_full
		WHERE ROUND(sales) > sales_input
		ORDER BY ROUND(sales);
	END $$ 
	DELIMITER ;

	CALL get_sales_customers(300);