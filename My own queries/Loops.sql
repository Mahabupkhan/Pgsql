 --For loop

 DO
 $$
 	BEGIN
	  
		FOR i in 1..10
			LOOP
				RAISE NOTICE 'COUNTER : %',i;
			END LOOP;
	END;
 $$LANGUAGE PLPGSQL


 --For loop
--Printing records using for loop
DO
$$
	DECLARE
	rec record;
	BEGIN
		FOR rec IN SELECT order_id,customer_id FROM orders
		LOOP
			RAISE NOTICE 'Order id :% customer id :%',rec.order_id,rec.customer_id;
		END LOOP;
		
	END;
$$LANGUAGE plpgsql


--Using continue keyword

DO
$$
	DECLARE
	i_counter int =0;
	BEGIN
		LOOP
			i_counter  = i_counter+1;
			EXIT WHEN i_counter > 20;
			CONTINUE WHEN MOD(i_counter,2) = 0;
			RAISE NOTICE 'counter : %',i_counter;
		END LOOP;
	END;
$$LANGUAGE plpgsql;

--For each loop
DO
$$
	DECLARE
		arr int[] = array[1,2,3,4];
		var int;
	BEGIN
		FOREACH var IN ARRAY arr
		LOOP
			RAISE NOTICE '%',var;
		END LOOP;
	END;

$$LANGUAGE plpgsql;



DO
$$
	DECLARE
		arr1 int[] = array[1,2,3,4,5];
		arr2 int[] = array[6,7,8,9,10];
		var int;
	BEGIN
		FOREACH var IN ARRAY arr1 || arr2 -- Piping the two arrays
		LOOP
			RAISE NOTICE '%',var;
		END LOOP;
	END;

$$LANGUAGE plpgsql; 

--While loop

CREATE OR REPLACE FUNCTION fn_api_arithmetic_progression(x int) RETURNS int AS
$$
	DECLARE
		total_sum int =0;
		num int =1; 

	BEGIN
		WHILE num <= x
		LOOP
			total_sum = total_sum + num;
			num = num+1;

		END LOOP;
		RETURN total_sum;
	END;
$$LANGUAGE plpgsql;

SELECT fn_api_arithmetic_progression(5);

























 