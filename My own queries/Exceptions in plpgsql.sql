DO
$$
	DECLARE
	rec record;
	orderid smallint = 1;
	BEGIN
		SELECT * FROM orders INTO STRICT rec
		WHERE order_id = orderid;
		EXCEPTION
		WHEN NO_DATA_FOUND THEN RAISE EXCEPTION 'No data found with order id %',orderid;
	END;
$$LANGUAGE plpgsql;


SELECT * FROM orders; 

--To many rows exception
 
DO
$$
	DECLARE
	rec record;
	BEGIN
		SELECT * FROM customers INTO STRICT rec
		WHERE company_name LIKE 'A%';
		RAISE NOTICE 'Company name : %',rec.company_name;

		EXCEPTION
		WHEN TOO_MANY_ROWS THEN RAISE EXCEPTION 'Your query returned multiple rows';
	END;
$$LANGUAGE plpgsql

















