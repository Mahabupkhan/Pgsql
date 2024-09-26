SELECT * FROM ORDERS
WHERE ship_country IN('USA','France');

SELECT  ship_country,count(order_id) FROM orders
WHERE ship_country IN ('USA','France')
GROUP BY ship_country;


--Orders shipped to latin america
SELECT * FROM orders
WHERE ship_country IN ('Brazil','Venezuela','Argentina');

---Total order amount for each order
SELECT 
o.order_id,
SUM((unit_price * quantity) - (unit_price * quantity / 100 * discount))
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY o.order_id
ORDER BY o.order_id;


--last order and first order by order date
SELECT 
	*
FROM orders
WHERE order_date IN (
	(SELECT min(order_date) FROM orders),
	(SELECT MAX(order_date) FROM orders)
)
;


--Total products in each category



SELECT 
ca.category_id,
ca.category_name,
COUNT(pr.product_id) AS "No of products"

FROM products pr
JOIN categories ca ON pr.category_id = ca.category_id

GROUP BY ca.category_name,ca.category_id
ORDER BY ca.category_id;


--Customers with no order

SELECT * FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
WHERE order_id IS NULL;

--Top customers with total order amount;

SELECT 
cu.customer_id,
cu.contact_name,
ROUND((SUM(od.unit_price * od.quantity)::NUMERIC),2) AS "Total order amount"

FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN customers cu ON cu.customer_id = o.customer_id
GROUP BY cu.customer_id,cu.contact_name
ORDER BY 3 DESC
; 

--Orders with many lines of items
SELECT 
orders.order_id,
count(product_id)
FROM orders
JOIN order_details ON orders.order_id = order_details.order_id
GROUP BY orders.order_id
HAVING count(product_id) > 1;


--First order from each country
SELECT * FROM orders;

SELECT ship_country,
		order_id
FROM orders o1
WHERE order_date = (
	SELECT MIN(order_date) FROM orders o2
	WHERE o2.ship_country=o1.ship_country
)







