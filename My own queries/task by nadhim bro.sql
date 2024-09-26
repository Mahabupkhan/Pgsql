CREATE TABLE product_catalog (
    row_id SERIAL PRIMARY KEY,
    description JSONB NOT NULL
);

TRUNCATE table product_catalog;
INSERT INTO product_catalog (description)
VALUES
-- Mobile Phone 1
('{
    "product_name": "Galaxy S23",
    "brand": "Samsung",
    "price": 999.99,
    "warranty": "1 year",
    "camera": "50 MP Triple Camera",
    "battery": "4000 mAh",
    "processor": "Snapdragon 8 Gen 2"
}'),
-- Mobile Phone 2
('{
    "product_name": "iPhone 14",
    "brand": "Apple",
    "price": 799.99,
    "warranty": "1 year",
    "camera": "12 MP Dual Camera",
    "battery": "3279 mAh",
    "processor": "A15 Bionic"
}'),
-- Mobile Phone 3
('{
    "product_name": "Pixel 7",
    "brand": "Google",
    "price": 599.99,
    "warranty": "1 year",
    "camera": "50 MP Dual Camera",
    "battery": "4355 mAh",
    "processor": "Google Tensor G2"
}'),
-- Mobile Phone 4
('{
    "product_name": "OnePlus 11",
    "brand": "OnePlus",
    "price": 899.99,
    "warranty": "1 year",
    "camera": "50 MP Triple Camera",
    "battery": "5000 mAh",
    "processor": "Snapdragon 8 Gen 2"
}'),
-- Mobile Phone 5
('{
    "product_name": "Xiaomi 13",
    "brand": "Xiaomi",
    "price": 749.99,
    "warranty": "1 year",
    "camera": "50 MP Triple Camera",
    "battery": "4500 mAh",
    "processor": "Snapdragon 8 Gen 2"
}'),
-- Mobile Phone 6
('{
    "product_name": "Sony Xperia 1 IV",
    "brand": "Sony",
    "price": 1199.99,
    "warranty": "1 year",
    "camera": "12 MP Triple Camera",
    "battery": "5000 mAh",
    "processor": "Snapdragon 8 Gen 1"
}'),
-- Mobile Phone 7
('{
    "product_name": "Oppo Find X5 Pro",
    "brand": "Oppo",
    "price": 999.99,
    "warranty": "1 year",
    "camera": "50 MP Triple Camera",
    "battery": "5000 mAh",
    "processor": "Snapdragon 8 Gen 1"
}'),
-- Mobile Phone 8
('{
    "product_name": "Asus ROG Phone 6",
    "brand": "Asus",
    "price": 899.99,
    "warranty": "1 year",
    "camera": "50 MP Triple Camera",
    "battery": "6000 mAh",
    "processor": "Snapdragon 8+ Gen 1"
}'),
-- Mobile Phone 9
('{
    "product_name": "Realme GT 2 Pro",
    "brand": "Realme",
    "price": 699.99,
    "warranty": "1 year",
    "camera": "50 MP Triple Camera",
    "battery": "5000 mAh",
    "processor": "Snapdragon 8 Gen 1"
}'),
-- Mobile Phone 10
('{
    "product_name": "Vivo X80 Pro",
    "brand": "Vivo",
    "price": 949.99,
    "warranty": "1 year",
    "camera": "50 MP Quad Camera",
    "battery": "4700 mAh",
    "processor": "Dimensity 9000"
}');


SELECT  * FROM product_catalog;

CREATE OR REPLACE FUNCTION fn_update_in_json(p_id,integer,p_index integer,p_value varchar) RETURNS VOID
AS
$$
	BEGIN
		
	END;
$$LANGUAGE plpgsql;

UPDATE product_catalog
SET description = jsonb_set(description,'{brand}','"Lenovo"',false);

SELECT key FROM 

SELECT key FROM 
SELECT * FROM product_catalog ORDER BY row_id;


SELECT key
    INTO key_name
    FROM jsonb_each_text(description)
    WHERE row_number() = 1
    ORDER BY key
    LIMIT 1;


SELECT description FROM product_catalog;

SELECT jsonb_object_keys(description) FROM product_catalog where row_id=11 offset 0 limit 1; 



CREATE OR REPLACE FUNCTION fn_update_json_using_key(p_rowid integer,p_keyname varchar,p_value varchar) RETURNS VOID AS
$$
	DECLARE
	p_value_integer numeric;
	BEGIN
		p_value_integer = p_value :: numeric;
		UPDATE product_catalog
		SET description =jsonb_set(description,ARRAY[p_keyname],to_jsonb(p_value_integer))
		WHERE row_id = p_rowid;
		EXCEPTION WHEN INVALID_TEXT_REPRESENTATION THEN
		UPDATE product_catalog
		SET description = jsonb_set(description,ARRAY[p_keyname],to_jsonb(p_value::TEXT))
		WHERE row_id =p_rowid;

	END;
$$LANGUAGE plpgsql;

SELECT * FROM product_catalog;

SELECT fn_update_json_using_key(12,'price','800');

CREATE OR REPLACE FUNCTION fn_update_json_using_position_of_key(p_rowid integer,p_key_position integer,p_key_value TEXT)
RETURNS VOID AS
$$
	DECLARE
		key_name TEXT;
		all_keys TEXT[];
		key_count integer;
		p_value_integer numeric;
		
	BEGIN
		SELECT ARRAY(SELECT key FROM jsonb_object_keys(description::jsonb) AS key) INTO all_keys
		FROM product_catalog
		WHERE row_id = p_rowid;
		RAISE INFO 'Keys stored in the array %',all_keys;

		key_count=array_length(all_keys,1);
		--RAISE INFO 'No of keys is : %',key_count;

		key_name=all_keys[p_key_position];
		
		IF key_name IS NULL THEN
		RAISE EXCEPTION 'There is no key at position %',p_key_position;
		RETURN;
		ELSE RAISE INFO 'key name is : %',key_name;
		END IF;

		p_value_integer = p_key_value :: numeric;
		UPDATE product_catalog
		SET description = jsonb_set(description,ARRAY[key_name],to_jsonb(p_value_integer))
		WHERE row_id = p_rowid;

		EXCEPTION
		WHEN invalid_text_representation THEN
		UPDATE product_catalog
		SET description = jsonb_set(description,ARRAY[key_name],to_jsonb(p_key_value))
		WHERE row_id = p_rowid;
		
		
	END;

$$LANGUAGE plpgsql;


SELECT fn_update_json_using_position_of_key(17,2,'3000');
SELECT * FROM product_catalog;


SELECT row_id, description->'price' AS "product name" FROM product_catalog ORDER BY row_id;

UPDATE product_catalog
SET description = jsonb_set(description,ARRAY['charging speed','Hii'],to_jsonb('67'::text),true) WHERE row_id =20;

SELECT description FROM product_catalog WHERE row_id=20;
SELECT
    row_id,
    key,
    value
FROM
    product_catalog,
    jsonb_each(description) AS kv(key, value);


UPDATE product_catalog 
SET description = description - 'charging speed'
WHERE description ->> 'brand'='Vivo' returning *;


SELECT * FROM product_catalog;

SELECT description ->>'brand' AS "Brand",description ->>'product_name' AS "Product name",description ->>'price' AS "Price"
FROM product_catalog WHERE (description ->> 'price')::numeric >  500;



UPDATE product_catalog
SET description = jsonb_set(description,ARRAY['camera'],to_jsonb('100 MP primary camera'::text)) WHERE row_id=14 returning *;








