/* Write your T-SQL query statement below */



SELECT company_id
	,employee_id
	,employee_name
	,ROUND(CASE 
			WHEN MAX(salary) OVER (PARTITION BY company_id) < 1000
				THEN salary * 1
			WHEN MAX(salary) OVER (PARTITION BY company_id) >= 1000
				AND MAX(salary) OVER (PARTITION BY company_id) <= 10000
				THEN salary * 0.76
			WHEN MAX(salary) OVER (PARTITION BY company_id) > 10000
				THEN salary * 0.51
			END, 0) AS salary
FROM Salaries