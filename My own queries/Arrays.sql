 CREATE TABLE person(
	id UUID DEFAULT uuid_generate_v1(),
	person_name VARCHAR(30),
	siblings VARCHAR(20)[]
 );

 SELECT * FROM person;

 INSERT INTO person (person_name,siblings)
 VALUES ('Mahmood',ARRAY['Razaq','Mehurunnisha']),('Razaq',ARRAY['Mahmood','Mehurunnisha']);

 SELECT person_name,siblings AS "ALL",siblings[1] FROM person;