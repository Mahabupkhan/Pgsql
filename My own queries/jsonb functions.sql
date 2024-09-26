--jsonb_array_length

SELECT * FROM directors_docs;

SELECT *,
	   jsonb_array_length(doc->'movies')
	   FROM directors_docs;

--json_obejct_keys

SELECT jsonb_object_keys(doc) FROM directors_docs WHERE doc_id =1;


--jsonb_each function
SELECT 
key,value
FROM directors_docs,jsonb_each(doc);


--jsonb to table

SELECT
J.*
FROM directors_docs,
	  jsonb_to_record(doc) J(
	director_id INT,
	"Director Name" VARCHAR,
	date_of_birth DATE
) 


BEGIN
DELETE * FROM directors_docs dd1
WHERE doc->'director_id' = (
	SELECT doc-
)

DELETE FROM directors_docs dd1
WHERE 1 NOT IN
	(SELECT COUNT(doc -> 'director_id') FROM directors_docs
	 GROUP BY doc ->'director_id'
	)

SELECT * FROM directors_docs;

INSERT INTO directors_docs(doc)(
(SELECT jsonb_agg(x) FROM directors,
(SELECT * FROM directors) x))

DELETE FROM directors_docs WHERE doc_id=113;


SELECT row_to_json(x) FROM
	(
		SELECT director_id,
			   first_name,
			   last_name,
			   nationality FROM directors
	) AS x
;





INSERT INTO directors_docs(doc)
(SELECT row_to_json(x) FROM
	(
		SELECT director_id,
			   first_name,
			   last_name,
			   nationality FROM directors
	) AS x)
;

SELECT * FROM directors_docs;
SELECT JSON_AGG(x) FROM directors,
(
	SELECT * from directors
) x


UPDATE directors_docs
SET doc = jsonb_set(doc,ARRAY['nationality'],to_jsonb('American'::text),false)
WHERE (doc -> 'director_id')::int=1
returning *;





 SELECT *, 
 		(SELECT json_agg(x) FROM(
			SELECT movie_name FROM movies
			WHERE director_id=directors.director_id
		) AS x) AS "movies"
 FROM directors




 SELECT director_id,
 	    first_name,
		last_name,
		(SELECT json_agg(x)::jsonb AS "All Movies"
		 FROM (
			SELECT movie_name FROM movies "m" WHERE "m".director_id = d.director_id
		 ) AS x
		) 

FROM directors d;

SELECT director_id,count(movie_name) FROM movies
GROUP BY director_id order by director_id




SELECT STRING_TO_ARRAY('Basheer and jameel and ashath and niyaz and riyas',' and ');










