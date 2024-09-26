 --- Sequences

 CREATE SEQUENCE id_seq AS smallint
 INCREMENT 5 
 MINVALUE 10 MAXVALUE 100  START 10;


 SELECT nextval('id_seq')
--TYPE
CREATE TYPE address2 as (
	door_no VARCHAR(5),
	street VARCHAR(20),
	city VARCHAR(20),
	country VARCHAR(15)
);

CREATE TABLE  IF NOT EXISTS person2(
	name VARCHAR(20),
	address address2
);
INSERT INTO person2 (name,address) VALUES ('JAMEEL',ROW('10','GVK STREET','CHENNAI','INDIA'));
SELECT * FROM person2


DROP TYPE address2 CASCADE
SELECT (address).city FROM person2 WHERE name='JAMEEL';

--Creating alpha numeric SEQUENCES
CREATE SEQUENCE IF NOT EXISTS contact_seq START 100;

CREATE TABLE IF NOT EXISTS contacts(
	contact_id TEXT PRIMARY KEY DEFAULT('CT' || nextval('contact_seq')),
	contact_name VARCHAR(50),
	contact_no INT 
);

ALTER TABLE contacts ALTER contact_no TYPE BIGINT;

INSERT INTO contacts(contact_name,contact_no) VALUES ('Jameel',9876543210),('Kadhar',8978675645);

SELECT * FROM contacts;

ALTER TABLE contacts ADD CONSTRAINTS contacts_contact_no_unique UNIQUE (contact_no);


DROP CONSTRA













