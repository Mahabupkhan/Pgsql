CREATE SCHEMA IF NOT EXISTS MahabupKhan;


CREATE TABLE mahabupkhan.categories AS
SELECT * FROM public.categories;

SELECT * FROM mahabupkhan.categories;


CREATE OR REPLACE FUNCTION mahabupkhan.copy_table(p_table_name VARCHAR) 
RETURNS VARCHAR
AS
$$
DECLARE
    m_schema VARCHAR := 'mahabupkhan.' || p_table_name;
    p_schema VARCHAR := 'public.' || p_table_name;
BEGIN
 
    EXECUTE 'CREATE TABLE ' || m_schema || ' AS SELECT * FROM ' || p_schema;
    RETURN 'DONE';
    
EXCEPTION
    WHEN OTHERS THEN
        RETURN format('NOT DONE...Because : %s',SQLERRM);
END;
$$ LANGUAGE plpgsql;

SELECT mahabupkhan.copy_table('employees');
SELECT * FROM mahabupkhan.customers;



DO
$$

DECLARE
table_names TEXT[];
i text;
BEGIN

	SELECT array_agg(tablename) INTO table_names
	FROM pg_catalog.pg_tables
	WHERE schemaname = 'public';

	FOREACH i IN ARRAY table_names

	LOOP
		PERFORM mahabupkhan.copy_table(i);

	END LOOP;


END;
$$

