 SELECT * FROM jobs
 ORDER BY min_salary DESC,max_salary DESC
 ;

 SELECT 
 	department_id,
	ROUND(AVG(salary),2)
 FROM employees
 GROUP BY department_id
 HAVING COUNT(salary) > 10
 ;
 SELECT * FROM employees;




--List employees getting above average salary in each department
 SELECT 
 	first_name ,
	department_id,
	salary,
	AVG(salary) OVER(PARTITION BY department_id) AS avg_salary,
	(CASE 
	WHEN salary <= AVG(salary) OVER(PARTITION BY department_id)
		THEN 'Low earning employee' 
	ELSE 'High earning employee' 
	END ) AS "Status"
	
 FROM employees
 















 