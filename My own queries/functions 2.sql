SELECT * FROM orders;

--Function to get latest order in the orders table
--Here we are returning a table
CREATE OR REPLACE FUNCTION fn_api_order_latest() RETURNS orders AS
$$
	SELECT * FROM orders
	ORDER BY order_date DESC,order_id DESC
	
$$
LANGUAGE SQL
DROP FUNCTION fn_api_order_latest();
--This will return the whole table in single column
SELECT fn_api_order_latest();

--To get all the datas as in table format
SELECT (fn_api_order_latest()).*;

--To get the only needed column
SELECT (fn_api_order_latest()).order_id;

SELECT order_id FROM fn_api_order_latest();



--Function to get most recent order between given dates
CREATE OR REPLACE FUNCTION fn_api_order_latest_by_date_range(p_start date,p_end date) RETURNS orders AS
$$
	SELECT * FROM orders
	WHERE order_date BETWEEN p_start AND p_end
	ORDER BY order_date DESC,order_id DESC ;
$$LANGUAGE SQL

SELECT * FROM fn_api_order_latest_by_date_range('1997-01-01','1997-10-10');


--Function to return all the employees hired in a particular year
CREATE OR REPLACE FUNCTION fn_api_employees_hire_date_by_year(p_year integer) RETURNS SETOF employees AS
$$
	SELECT * FROM employees
	WHERE EXTRACT('year' FROM hire_date) = p_year;
$$LANGUAGE SQL

SELECT * FROM employees;

SELECT (fn_api_employees_hire_date_by_year(1993)).*;

---Function to list all products where total amount is greater than the input amount
CREATE OR REPLACE FUNCTION fn_api_producst_total_amount_by(p_amount INTEGER) RETURNS SETOF products AS
$$
		 
	SELECT * FROM products
	WHERE product_id IN
		(SELECT product_id FROM
			 (SELECT product_id,SUM(quantity * unit_price - discount) AS total_amount
			 FROM order_details
			 GROUP BY product_id
			 HAVING SUM(quantity * unit_price - discount)>=p_amount
			 )
	 	) ORDER BY product_name;
$$LANGUAGE SQL

DROP FUNCTION fn_api_producst_total_amount_by(integer)
SELECT * FROM order_details;

SELECT (fn_api_producst_total_amount_by(20000)).product_name;
SELECT (fn_api_producst_total_amount_by(20000)).*;
SELECT product_id,product_name FROM fn_api_producst_total_amount_by(20000);


--FUNCTION RETURNING A TABLE 
--Function to return top orders by the customer
CREATE OR REPLACE FUNCTION fn_api_customer_top_order(p_customer_id bpchar,p_limit integer)
RETURNS TABLE
(
	order_id smallint,
	customer_id character,
	product_name character varying,
	unit_price real,
	quantity smallint,
	total_amount double precision
)
AS
$$

	SELECT 
	orders.order_id,
	orders.customer_id,
	products.product_name,
	order_details.unit_price, 
	order_details.quantity,
	(order_details.unit_price * order_details.quantity - discount ) AS TOTAL_AMOUNT
	FROM order_details NATURAL JOIN orders NATURAL JOIN products
	WHERE customer_id =p_customer_id
	ORDER BY ((unit_price * quantity)-discount) DESC
	LIMIT p_limit					
$$LANGUAGE SQL



SELECT * FROM fn_api_customer_top_order(10);


   











