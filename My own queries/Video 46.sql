--AND operator
 SELECT * FROM movies
WHERE movie_lang = 'English' AND age_certificate='18';

--OR Operator
SELECT * FROM movies
WHERE age_certificate='18' AND movie_lang ='English' OR movie_lang ='Chinese' AND age_certificate='18';

--With parenthesis
SELECT * FROM movies
WHERE (movie_lang='English' OR movie_lang='Chinese') AND age_certificate='12';

--Top 5 longest movies
SELECT * FROM movies ORDER BY movie_length DESC LIMIT 5;

--Top 5 oldest directors
SELECT first_name ||' '|| last_name  AS "Full Name" ,date_of_birth from directors
ORDER BY date_of_birth LIMIT 5;


--Top 10 youngest actress
SELECT * FROM actors
WHERE gender='F' ORDER BY date_of_birth DESC
LIMIT 10
;

--Top 10 domestic profitable movie
SELECT * FROM movies_revenues ORDER BY revenues_domestic DESC LIMIT 10; -- This returns rows with null values first
SELECT * FROM movies_revenues ORDER BY revenues_domestic DESC NULLS LAST LIMIT 10 ;

--List all top 5 movies after the top 5 movies_revenues highest domestic profit
SELECT * FROM movies_revenues ORDER BY revenues_domestic DESC NULLS LAST LIMIT 5 OFFSET 5;


--FETCH
SELECT * FROM movies ORDER BY  movie_length DESC FETCH FIRST 5 ROW ONLY;

--Getting first 5 movies from 5th record onwards by long movie_length using FETCH
SELECT * FROM movies
ORDER BY movie_length DESC
FETCH FIRST 5 ROWS ONLY
OFFSET 5;

--List of actors with date of birth null
SELECT * FROM actors
where date_of_birth is null;

--CONCATITNATION
SELECT first_name || last_name AS "Actor name" FROM actors ;

SELECT first_name || ' ' || last_name AS "Actor name " FROM actors;

SELECT CONCAT(first_name,last_name) AS "Actor_name" FROM actors;

SELECT CONCAT(first_name,' ',last_name) AS "Actor name" FROM actors;

--Concatination with separator
SELECT CONCAT_WS(',',first_name,last_name,date_of_birth) FROM actors;



SELECT 'Mahabupkhan' :: VARCHAR AS "Name"






