--Types in psql

CREATE TYPE address1 as(
	city VARCHAR(20),
	country VARCHAR(30)
);

CREATE TABLE companies(
	comp_id SERIAL PRIMARY KEY,
	address address1
);

SELECT * FROM companies

--Adding datas to composite data type
INSERT INTO companies(address) VALUES (ROW('CHENNAI','INDIA'));

--To view only country in the composite data type
SELECT (address).country FROM companies;


CREATE TYPE inventory_item AS(
	product_name VARCHAR(30),
	supplier_id INT,
	price INT
);

CREATE TABLE inventory (
	product_id SERIAL PRIMARY KEY,
	item inventory_item
);

INSERT INTO inventory (item) VALUES (ROW('pen',10,15));

SELECT * FROM inventory;
INSERT INTO inventory (item) VALUES
    (ROW('Laptop', 1, 1200)),
    (ROW('Smartphone', 2, 800)),
    (ROW('Headphones', 3, 150)),
    (ROW('Keyboard', 1, 75)),
    (ROW('Mouse', 2, 50)),
    (ROW('Monitor', 3, 300)),
    (ROW('Printer', 4, 250)),
    (ROW('Desk', 5, 200)),
    (ROW('Chair', 6, 150)),
    (ROW('Webcam', 7, 100));

--Getting product with price greater than 200
SELECT (item).product_name,(item).price FROM inventory WHERE (item).price>=200;


--Adding extra attribute to TYPE
ALTER TYPE inventorY_item ADD ATTRIBUTE supplier_name VARCHAR(30);

UPDATE  inventory SET (item).supplier_name='Jameel' where product_id=1;



