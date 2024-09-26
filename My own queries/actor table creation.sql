CREATE TABLE IF NOT EXISTS actors(
	actor_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name VARCHAR(150) NOT NULL,
	gender CHAR(1),
	date_of_birth DATE,
	add_date DATE,
	update_date DATE
);
-- Table creation for directors
CREATE TABLE IF NOT EXISTS directors(
	director_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name VARCHAR(150),
	date_of_birth  DATE,
	nationality VARCHAR(20),
	add_date DATE,
	update_date DATE
);

--Table creation of movies with foreign key 
CREATE TABLE IF NOT EXISTS movies(
	movie_id SERIAL PRIMARY KEY,
	movie_name VARCHAR(100) NOT NULL,
	movie_length INT,
	movie_lang VARCHAR(20),
	age_certificate VARCHAR(10),
	release_date DATE,
	director_id INT REFERENCES directors (director_id)
);
--INSERT INTO movies(movie_id,movie_name,movie_length,movie_lang,age_certificate,release_date,director_id)
--VALUES (1,'A Clockwork Orange','112','English','18','1972-02-02','13');
--Movie revenue table creation with foreign key
--('REFERENCES' keyword is used to denote that the column is connected with another table for foreign key constraints )
CREATE TABLE IF NOT EXISTS movie_revenues(
 	revenue_id SERIAL PRIMARY KEY,
	movie_id INT REFERENCES movies (movie_id),
	revenues_domestic NUMERIC(10,2),
	revenues_international NUMERIC (10,2)
);

--Movie actors table with two references and two primary keys
CREATE TABLE IF NOT EXISTS movies_actors(
	movie_id INT REFERENCES movies(movie_id),
	actor_id INT REFERENCES actors(actor_id),
	PRIMARY KEY(movie_id,actor_id)
);


