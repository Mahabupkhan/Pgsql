
--UUID installation
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

--UUID example
CREATE TABLE table_uuid(
	product_id UUID DEFAULT uuid_generate_v1(),
	product_name VARCHAR(100)
);

INSERT INTO table_uuid(product_name) VALUES('Gold'),('Silver'),('Platinum');

SELECT * FROM table_uuid;

delete from table_uuid where product_id ='7fafe728-68f8-11ef-95a5-fb37e4f214d1';