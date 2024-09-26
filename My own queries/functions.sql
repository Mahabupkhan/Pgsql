--Creating new function
CREATE OR REPLACE FUNCTION fn_add(int,int) RETURNS INT AS
'
SELECT $1 + $2;
'LANGUAGE SQL;

SELECT fn_add(80,20) as "Sum"

--We can also enclose our function with $$,$body$
CREATE OR REPLACE FUNCTION fn_add(int,int) RETURNS INT AS
$$
SELECT $1 + $2;
$$ LANGUAGE SQL;

SELECT * FROM CUSTOMERS;

--Below function will change the all the region null to N/A in employees table
CREATE OR REPLACE FUNCTION region_not_null() RETURNS VOID AS
$$
	UPDATE  employees SET region='N/A' WHERE region IS NULL;
$$ LANGUAGE SQL;

SELECT region_not_null();

CREATE OR REPLACE FUNCTION customer_region_not_null() RETURNS VOID AS
$$
	UPDATE customers SET region ='N/A' WHERE region IS NULL;
$$
LANGUAGE SQL;

SELECT * FROM customers;

SELECT customer_region_not_null();



CREATE OR REPLACE FUNCTION return_table(VARCHAR) RETURNS TABLE AS
$$
	select * from $1;
$$LANGUAGE SQL
SELECT * FROM customers;
CREATE OR REPLACE FUNCTION return_records_with_address_starts_with_number() RETURNS TEXT AS
$$  
	SELECT company_name ||' '||contact_name||' '||address FROM customers WHERE address LIKE '^[0-9]%';
$$LANGUAGE SQL

SELECT return_records_with_address_starts_with_number();



-- function to get the largest order by the given customer

CREATE OR REPLACE FUNCTION fn_api_customer_largest_order(p_customer_id bpchar) RETURNS double precision AS
$$
	SELECT MAX(order_amount) FROM
	(SELECT orders.order_id,SUM(unit_price * quantity - discount) as order_amount
	FROM order_details NATURAL JOIN orders WHERE orders.customer_id =p_customer_id  GROUP BY orders.order_id)
	AS total_amount
$$ LANGUAGE SQL 

SELECT fn_api_customer_largest_order('HANAR');

SELECT * FROM order_details NATURAL JOIN orders;



















