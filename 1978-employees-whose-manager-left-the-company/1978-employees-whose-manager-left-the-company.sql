/* Write your T-SQL query statement below */




SELECT employee_id
FROM Employees
WHERE manager_id NOT IN (
		SELECT employee_id
		FROM Employees
		)
	AND salary < 30000
ORDER BY 1