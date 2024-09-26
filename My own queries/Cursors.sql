SELECT * FROM movies mo
LEFT JOIN directors di ON mo.director_id = di.director_id
WHERE movie_id =(9+1)
ORDER BY movie_id
;


--CURSORS

DECLARE cur_all_movies CURSOR
FOR 
	SELECT movie_name,
			movie_length
	FROM movies;

--CURSOR with parameter

DECLARE cur_all_movies_by_year CURSOR (custom_year integer)
FOR
	SELECT movie_name,
			movie_length
	FROM movies
	WHERE EXTRACT('YEAR' FROM release_date) = custom_year;



DO
$$
	DECLARE
	all_movies text DEFAULT '';
	cur_all_movies CURSOR
	FOR
		SELECT * FROM movies;
	each_row record;

	BEGIN
	OPEN cur_all_movies;
	LOOP
		FETCH cur_all_movies INTO each_row;
		EXIT WHEN NOT FOUND;
		all_movies = all_movies ||' | '|| each_row.movie_name;

	END LOOP;



	RAISE NOTICE 'Movies names are : %',all_movies;
	END;

	
$$

---
DO
$$
	DECLARE
		all_movies TEXT DEFAULT '';
		each_row RECORD;
		all_movies_cursor CURSOR
		FOR 
			SELECT * FROM movies WHERE movie_name ILIKE '%star%'; 
	BEGIN
		OPEN all_movies_cursor;
		LOOP
			FETCH all_movies_cursor INTO each_row;
			EXIT WHEN NOT FOUND;
			all_movies = all_movies || ' | ' || each_row.movie_name ||','|| EXTRACT('YEAR' FROM each_row.release_date);
		END LOOP;
		RAISE NOTICE 'All movies with year : %',all_movies;
	END;

$$

SELECT * FROM movies;




