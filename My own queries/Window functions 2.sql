 --Row number()

 SELECT * FROM trades;




SELECT *,
 		ROW_NUMBER() OVER(PARTITION BY country ORDER BY imports) AS rn
FROM trades
WHERE region = 'ASIA'


--using row number get the 4th imports by year for each country


SELECT * FROM
(SELECT 
	country,
	year,
	imports,
	ROW_NUMBER() OVER(PARTITION BY country ORDER BY year) AS rn
FROM trades)
WHERE rn=4;



--comparing every employee with lowest salary employee
SELECT 
	first_name,
	salary,
	LAST_VALUE(salary) OVER(ORDER BY salary DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Least employee salary",
	(salary - LAST_VALUE(salary) OVER(ORDER BY salary DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)) AS "Difference" 
FROM employees

WITH yahoo AS(
	DELETE FROM t1
	WHERE id IN (1,2)
	RETURNING item
)
INSERT INTO t2 (item)
SELECT * FROM yahoo














