--Alias (By default it will change the alias name to lower case)
SELECT first_name as FIRSTNAME FROM actors;

--If we want case sensitive alias name we have to put that name in double quotation
SELECT first_name as "FIRSTNAME" FROM actors;

--As keyword is optional
SELECT movie_name,movie_lang "Language" from movies; 

--Concatinatin operator(||)
SELECT first_name || last_name "Full name" FROM actors;
SELECT first_name||' '|| last_name AS "Full Name" FROM actors;

--Alias name in ORDER BY clause
SELECT 
	first_name AS "First Name",
	last_name AS "Surname"
FROM actors
ORDER BY "Surname";














