 --return query keyword


 CREATE OR REPLACE FUNCTION fn_api_products_sold_more_than_val(p_total_sale real)
 RETURNS SETOF products AS
 $$
 	BEGIN

	RETURN QUERY

	SELECT * FROM products
	WHERE product_id IN (
    SELECT product_id FROM(
	(SELECT product_id,SUM((unit_price * quantity)-(unit_price * quantity * discount)) AS total_sum
	FROM order_details GROUP BY product_id
	HAVING SUM((unit_price * quantity)-(unit_price * quantity * discount)) >p_total_sale)));

	IF NOT FOUND THEN
	RAISE EXCEPTION 'Products not found below the price %',p_total_sale;
	END IF; 
	END;
 $$LANGUAGE plpgsql;

 SELECT (fn_api_products_sold_more_than_val(1000)).*;

CREATE OR REPLACE FUNCTION fn_api_products_by_names(pattern varchar)
RETURNS TABLE(
	productname varchar,
	unitprice real
)
AS
$$
	BEGIN
	RETURN QUERY
	SELECT product_name,unit_price FROM products
	WHERE product_name LIKE pattern;
 
	END;

$$LANGUAGE PLPGSQL;
SELECT fn_api_products_by_names('B%');




--Return next is used to execute queries or statements
--even after we returned the values to the caller

CREATE OR REPLACE FUNCTION fn_api_products_new_dec_products()
RETURNS  SETOF products AS
$$
	DECLARE
	rec record;
	BEGIN
		FOR rec IN SELECT * FROM products
		LOOP
			CASE
			 	WHEN rec.category_id IN (1,2,3) THEN rec.unit_price = rec.unit_price * 0.9;
				WHEN rec.category_id IN (4,5,6) THEN rec.unit_price = rec.unit_price * 0.8;
				ELSE rec.unit_price = rec.unit_price * 0.5;
				RETURN NEXT rec;
			END CASE;
		END LOOP;
		RETURN; 
	END;
$$LANGUAGE PLPGSQL;
DROP FUNCTION fn_api_products_new_dec_products();
SELECT (fn_api_products_new_dec_products()).*;









 