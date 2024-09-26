
SELECT * FROM directors;


SELECT * FROM MOVIES;
SELECT row_to_json(A)::JSONB FROM
(SELECT director_id,
	   first_name ||' '||last_name  AS "Director Name",
		(SELECT json_agg(x) FROM
		(
		SELECT movie_name  FROM movies
		where director_id=directors.director_id
		)x)::JSONB AS movies,
		date_of_birth
FROM directors) AS a;

CREATE TABLE directors_docs(

	doc_id SERIAL PRIMARY KEY,
	doc JSONB
);

INSERT INTO directors_docs(doc)
(
	SELECT row_to_json(a) FROM
 (SELECT director_id,
	   first_name ||' '||last_name  AS "Director Name",
		(SELECT json_agg(x) FROM
		(
		SELECT movie_name  FROM movies
		where director_id=directors.director_id
		)x)::JSONB AS movies,
		date_of_birth
FROM directors) AS a
);

SELECT * FROM directors_docs;


INSERT INTO directors_docs(doc)
(
	SELECT row_to_json(a) FROM
 (SELECT director_id,
	   first_name ||' '||last_name  AS "Director Name",
		(SELECT CASE COUNT(x) WHEN 0 THEN '[]' ELSE json_agg(x) END "All Movies"
		 FROM
		(
		SELECT movie_name  FROM movies
		where director_id=directors.director_id
		)x)::JSONB AS movies,
		date_of_birth
FROM directors) AS a
);
ROLLBACK;



---Orders with total value greater than 1000

--List most expensive product in each category

SELECT * FROM products;

SELECT p1.category_id,
	   categories.category_name,
	   p1.product_name AS "Costliest Product",
	   p1.unit_price,
	   (
			SELECT AVG(unit_price) FROM products p3
			WHERE p3.category_id = p1.category_id
			GROUP BY p1.category_id
	   ) AS "Average price of this category"
FROM products p1
JOIN categories ON categories.category_id =p1.category_id

WHERE unit_price=(
	SELECT MAX(unit_price) FROM products p2
	WHERE category_id=p1.category_id
)
ORDER BY category_id;


SELECT * FROM orders;
SELECT order_id FROM orders
GROUP BY employee_id;


SELECT e.employee_id,
	   e.first_name||' '||e.last_name AS "Name",
	   SUM(od.unit_price * od.quantity) AS "Total Sale"
		
FROM employees e
JOIN orders o ON e.employee_id = o.employee_id
JOIN order_details od ON od.order_id = o.order_id
GROUP BY e.employee_id
order by "Total Sale" DESC  
;



SELECT customer_id,
	   COUNT(order_id) AS "Total orders",
	   (SELECT contact_name
	   FROM customers
	   WHERE o.customer_id = customers.customer_id
	   )
	    
FROM orders o
GROUP BY customer_id
ORDER BY "Total orders" DESC
LIMIT 5;

SELECT * FROM customers WHERE customer_id='VINET';

SELECT * FROM orders;




SELECT category_name
FROM categories;



SELECT c.customer_id,AVG(unit_price * quantity) FROM
customers "c"
JOIN orders o ON c.customer_id=o.customer_id
JOIN order_details od ON od.order_id=o.order_id 
GROUP BY c.customer_id;


SELECT * FROM customers;   


