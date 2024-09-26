select * from actors;


SELECT a1.first_name ||a1.last_name AS "Name" ,a1.gender,a1.date_of_birth
FROM actors a1
where EXTRACT(YEAR FROM date_of_birth)<
(
	SELECT AVG(EXTRACT (YEAR FROM date_of_birth)) FROM actors a2
	WHERE a1.gender=a2.gender

) order by a1.gender;    