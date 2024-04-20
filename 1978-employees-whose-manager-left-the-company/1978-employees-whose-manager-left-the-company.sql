/* Write your T-SQL query statement below */




SELECT 
E.employee_id
FROM Employees E 
LEFT JOIN Employees MAN ON E.manager_id=MAN.employee_id
WHERE E.manager_id IS NOT NULL AND MAN.employee_id IS NULL 
AND E.salary<30000
ORDER BY 1