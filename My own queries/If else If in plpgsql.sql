

 CREATE OR REPLACE FUNCTION fn_api_products_category(price real) RETURNS text AS
 $$
 	BEGIN
		IF price > 50 THEN
		RETURN 'HIGH';
		
		ELSIF price > 25 THEN
		RETURN 'MEDIUM';

		ELSE
		RETURN 'SWEET SPOT';
		END IF;
	END;
 $$LANGUAGE PLPGSQL

 SELECT fn_api_products_category(unit_price) FROM products;
SELECT unit_price FROM products;

 --Switch case in plpgsql
 CREATE OR REPLACE FUNCTION fn_api_switch_practice(x integer DEFAULT 0) RETURNS text AS
 $$
 	BEGIN
	 
	 CASE x
	 	WHEN 10 THEN RETURN 'VALUE = 10';
		WHEN 20 THEN RETURN 'VALUE =20';
		ELSE RETURN 'Value not found !!!!';
	 	
	 END CASE;
	 
	END;
 $$LANGUAGE PLPGSQL
SELECT fn_api_switch_practice(1);



CREATE OR REPLACE FUNCTION fn_api_order_ship_via(shipvia smallint) RETURNS text AS
$$
	BEGIN
		  CASE shipvia
		  WHEN 1 THEN RETURN 'SPEEDY SHIPPERS';
		  WHEN 2 THEN RETURN 'UNITED SHIPPERS';
		  WHEN 3 THEN RETURN 'FEDERAL SHIPPERS';
		  ELSE RETURN 'UNKNOWN VALUE !!!';
		  END CASE;
	END;

$$LANGUAGE PLPGSQL;

SELECT * FROM PRODUCTS;
SELECT fn_api_order_ship_via(ship_via) FROM orders;

SELECT fn_api_order_ship_via(DISTINCT(ship_via) FROM orders) FROM orders;

SELECT DISTINCT(ship_via) FROM orders;

DO
$$
	DECLARE
	total_sum double precision;
	order_type varchar;
	BEGIN
		SELECT SUM(unit_price * quantity - discount) INTO total_sum 
		FROM order_details WHERE order_id=10248;
		IF FOUND THEN 
			CASE 
				WHEN total_sum > 200 THEN
				order_type = 'Platinum';

				WHEN total_sum > 100 THEN
				order_type ='Gold';

				ELSE order_type ='Silver';
				END CASE;
		ELSE
		 RAISE NOTICE 'Total sum not found !!!';
		END IF;
	RAISE NOTICE '%',order_type;
	END;
$$
LANGUAGE PLPGSQL

CREATE OR REPLACE FUNCTION fn_api_find_price_with_discount(IN p_unit_price real,IN p_quantity smallint,IN discount real,OUT total_price_with_discount double precision,OUT total_price_without_discount double precision)
AS
$$
	
	BEGIN
		total_price_without_discount =p_unit_price * p_quantity;
		total_price_with_discount=total_price_without_discount - (p_unit_price * p_quantity *     discount);
	END;
$$LANGUAGE plpgsql
DROP FUNCTION fn_api_find_price_with_discount(REAL,SMALLINT,REAL);
SELECT * , (fn_api_find_price_with_discount(unit_price,quantity,discount)).* FROM order_details;

















