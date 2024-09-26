CREATE TABLE trades(

	region TEXT,
	country TEXT,
	year INT,
	imports NUMERIC(50,0),
	exports NUMERIC(50,0)
);
SELECT * FROM trades ORDER BY region;

SELECT region,AVG(imports)
FROM trades
GROUP BY region;

SELECT region,AVG(imports)
FROM trades
GROUP BY ROLLUP(region);


--GROUP BY CUBE

SELECT region,
	   country,
	   ROUND(AVG(imports/1000000000),2)
FROM trades
WHERE country IN ('USA','Germany','France','Brazil')
GROUP BY CUBE(region,country)
ORDER BY region,country


SELECT region,
	   country,
	   ROUND(AVG(imports/1000000000),2)
FROM trades
WHERE country IN ('USA','Germany','France','Brazil')
GROUP BY 
GROUPING SETS(
	(),
	region,
	country
)
ORDER BY region,country




---FILTER CLAUSE
--task : get average exports per each region for all period,before 1995 and after 1995


SELECT region,
	   AVG(exports) as "All time average",
	   AVG(exports) FILTER(WHERE year<1995) as "average before 1995",
	   AVG(exports) FILTER(WHERE year>=1995) as "average after 1995"
FROM trades
GROUP BY ROLLUP(region)
ORDER BY region;

---OVER(PARTITION BY group name)



SELECT *,
	   AVG(exports) OVER()

FROM trades --This code will put the average in each and every row

SELECT *,
	   AVG(exports) OVER(PARTITION BY country)
FROM trades
ORDER BY region; --It will also do the same but for each region it will calculate the avg


SELECT *,
	   AVG(exports) OVER(PARTITION BY year<=2000)
	  FROM trades
ORDER BY region;


SELECT *,
	   SUM(imports) OVER(PARTITION BY region),
	    ROUND((imports/(SUM(imports) OVER(PARTITION BY region)))*100,6)  AS "Percentage"

FROM trades
ORDER BY region;




SELECT region,
       country,
	   SUM(imports) AS "Total imports",
	   SUM(exports) AS "Total exports"
FROM trades
GROUP BY country,REGION
ORDER BY region;






SELECT * ,
		SUM("Total imports") OVER(PARTITION BY region) AS "Total imports in this region",
		SUM("Total exports") OVER(PARTITION BY region) AS "Total exports in this region"

FROM
(SELECT region,
       country,
	   SUM(imports) AS "Total imports",
	   SUM(exports) AS "Total exports"
FROM trades
GROUP BY country,REGION
ORDER BY region)

---Final query to view the percentage of both import and exports of a country with total imports and exports on the region

SELECT region,
	   country,
	   "Total imports",
	     ROUND(("Total imports" / "Total imports in this region" * 100),2) AS "imports % in this region",
	   "Total exports",
	   ROUND(("Total exports" / "Total exports in this region" * 100),2) AS "exports % in this region"
FROM(
SELECT * ,
		SUM("Total imports") OVER(PARTITION BY region) AS "Total imports in this region",
		SUM("Total exports") OVER(PARTITION BY region) AS "Total exports in this region"

FROM
(SELECT region,
       country,
	   SUM(imports) AS "Total imports",
	   SUM(exports) AS "Total exports"
FROM trades
GROUP BY country,REGION
ORDER BY region)
)
ORDER BY region,country,"imports % in this region","exports % in this region"







SELECT 
region,
SUM(imports) AS "Total imports",
SUM(exports) AS "Total exports"
FROM trades

GROUP BY region;




SELECT *,
	   AVG(exports) OVER(PARTITION BY country)
FROM trades
ORDER BY region; --It will also do the same but for each region it will calculate the avg


SELECT *,
		AVG(imports) OVER(PARTITION BY country)
		
	FROM trades
	



SELECT * FROM trades;












	   

