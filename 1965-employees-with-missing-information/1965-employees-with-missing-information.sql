/* Write your T-SQL query statement below */




SELECT
COALESCE(E.employee_id,S.employee_id) AS employee_id
FROM Employees E FULL JOIN Salaries S
ON E.employee_id=S.employee_id
WHERE E.employee_id IS NULL OR S.employee_id IS NULL
ORDER BY 1