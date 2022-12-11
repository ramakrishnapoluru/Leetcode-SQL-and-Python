/* Write your T-SQL query statement below */


SELECT E1.employee_id
	,E1.NAME
	,COUNT(DISTINCT E2.employee_id) reports_count
	,ROUND((SUM(E2.age) * 1.00 / COUNT(DISTINCT E2.employee_id) * 1.00), 0) AS average_age
FROM Employees E1
JOIN Employees E2 ON E1.employee_id = E2.reports_to
GROUP BY E1.employee_id
	,E1.NAME
ORDER BY E1.employee_id