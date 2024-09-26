SELECT * FROM trades;




Select region,country,year,MAX(imports+exports)
FROM trades t1
HAVING MAX(imports+exports) in
(SELECT MAX(imports + exports)
FROM trades t2 WHERE t1.country=t2.country
)
GROUP BY region,country


select distinct country FROM trades;


SELECT region,
		 country,
		 year,
		 imports+exports AS "Total imports and exports"
FROM trades t1
WHERE t1.imports + t1.exports = (
 SELECT MAX(t2.imports+t2.exports) FROM trades t2
 WHERE t1.country = t2.country
)

SELECT REGION,COUNTRY,YEAR,"TOTAL" FROM 
(SELECT region,
		country,
		year,
		imports+exports as "TOTAL",
		ROW_NUMBER() OVER(PARTITION BY country ORDER BY (imports+exports) DESC)
FROM trades
)
WHERE ROW_NUMBER =1;


--Task 1: Find the Customer with the Most Orders

SELECT * FROM customers;


SELECT * FROM orders
ORDER BY customer_id;


SELECT customer_id,
	   count(order_id)
FROM   









