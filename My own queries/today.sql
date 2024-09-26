DO $$
DECLARE
    arr integer[] := ARRAY[1, 2, 3, 4, 5];
    index_to_remove int := 3; -- The index to remove
	arr2 integer[];
BEGIN
    -- Combine the array before and after the index to remove
	 arr2 := arr[1:3];
    arr := arr[1:index_to_remove-1] || arr[index_to_remove+1:array_length(arr, 1)];
   
    RAISE NOTICE 'Updated array: %', arr;
	RAISE NOTICE 'Arr2 : %',arr2;
END $$;




CREATE OR REPLACE FUNCTION fn_delete_element_from_array(p_arr integer[],p_index integer) RETURNS integer[]
AS
$$
	DECLARE
	result integer[];
	BEGIN
		result=p_arr[1:p_index-1] || p_arr[p_index+1:array_length(p_arr,1)];
		RETURN result;
	END;
$$
LANGUAGE plpgsql;

SELECT fn_delete_element_from_array(ARRAY[1,2,3,4,56,6],2);









