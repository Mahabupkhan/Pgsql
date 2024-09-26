

 -- in plpqsql we have to use return instead of select

 --Function to return max price of all the products

 CREATE OR REPLACE FUNCTION fn_api_products_max_price() RETURNS bigint AS
 $$
 	BEGIN
        RETURN MAX(unit_price) FROM products;

			 
	END;
 $$ LANGUAGE plpgsql

 SELECT fn_api_products_max_price();


 --Simple function example for variable declaration
CREATE OR REPLACE FUNCTION fn_my_sum(integer,integer) RETURNS integer AS
$$
	DECLARE 
		ret integer;
	BEGIN
		ret = $1 + $2;
		RETURN ret;
	END;

$$LANGUAGE plpgsql
SELECT fn_my_sum(34,45);


--Declaring variables using alias
CREATE OR REPLACE FUNCTION fn_my_sum(integer,integer) RETURNS integer AS
$$
	DECLARE 
		ret integer;
		x ALIAS FOR $1;
		y ALIAS FOR $2;
	BEGIN
		ret = x + y;
		RETURN ret;
	END;

$$LANGUAGE plpgsql;
SELECT fn_my_sum(34,45);


--Data type can be refered from a table column
DO
$$
	DECLARE
			empl_first_name employees.first_name%TYPE
			prod_name products.product_name%TYPE
	BEGIN

	END
$$LANGUAGE plpgsql

DO
$$
	DECLARE
		product_title products.product_name%TYPE;

	BEGIN
		SELECT product_name FROM products INTO product_title
		WHERE product_id =1 LIMIT 1;
		RAISE NOTICE 'the product name is %',product_title;
	END
$$


--Record datatype is used to store entire row in a variable
DO
$$
	DECLARE 
		result_set record;
	BEGIN
		SELECT * FROM products INTO result_set
		WHERE product_id =5 LIMIT 1;
		RAISE NOTICE 'Product name is %',result_set.product_name;
	END
$$LANGUAGE plpgsql







 