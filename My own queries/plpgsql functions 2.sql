 --using IN ,OUT in functions to replace returns in the function signature

 CREATE OR REPLACE FUNCTION fn_my_sum_2_part1(IN var1 integer,IN var2 integer,OUT var3 integer)
 AS
 $$
 	BEGIN
 	var3 = var1 + var2;
	END;
 $$LANGUAGE PLPGSQL

SELECT fn_my_sum_2_part1(5,10);

--Function with multiple OUTS
 CREATE OR REPLACE FUNCTION fn_my_sum_2_part2(IN x integer,IN y integer,OUT z integer,OUT w integer)
 AS
 $$
 	BEGIN
 	z = x +y ;
	w = x * y;
	END;
 $$LANGUAGE PLPGSQL
 SELECT fn_my_sum_2_part2(5,6);

 --Usage of RETURN QUERY
 CREATE OR REPLACE FUNCTION fn_api_orders_latest_top_10_orders() RETURNS SETOF orders AS
 $$
 	BEGIN
	 RETURN QUERY
	 SELECT * FROM orders ORDER BY order_date DESC LIMIT 10;
	END;
 $$LANGUAGE PLPGSQL
 SELECT (fn_api_orders_latest_top_10_orders()).*;