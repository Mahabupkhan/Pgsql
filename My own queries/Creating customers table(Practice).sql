CREATE TABLE customers(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	email VARCHAR(50),
	age INT
);

INSERT INTO customers (first_name,last_name,email,age) 
VALUES ('mahabupkhan','z','mahabupkhan333@gmail.com',22);
SELECT * FROM customers;

--Adding data with single quotes in a table
INSERT INTO customers (first_name) VALUES ('Jameel''s'); -- Add extra one quote to avoid error

--RETURNING keyword
INSERT INTO customers(first_name) VALUES('suthish') returning *;
UPDATE customers SET last_name='Afsar' where customer_id=5 RETURNING *;

--ON CONFLICT : it is used when we have to check the new data is already existed or not. If existed we can add
-- the action 
CREATE TABLE t_tag(
	id SERIAL PRIMARY KEY,
	tag TEXT UNIQUE,
	update_date TIMESTAMP DEFAULT NOW()
);

INSERT INTO t_tag(tag)
VALUES('Pen'),('Pencil') RETURNING *;

--INSERTING DATA WITH ON CONFLICT DO NOTHING
INSERT INTO t_tag (tag)
VALUES ('Pen')
ON CONFLICT (tag)
DO
	NOTHING;


--INSERTING DATA WITH CONFLICT SET NEW VALUES
INSERT INTO t_tag (tag)
VALUES('Pen')
ON CONFLICT (tag)
DO 
	UPDATE SET
		tag=EXCLUDED.tag,  
		update_date = NOW();


SELECT * FROM t_tag;

 















