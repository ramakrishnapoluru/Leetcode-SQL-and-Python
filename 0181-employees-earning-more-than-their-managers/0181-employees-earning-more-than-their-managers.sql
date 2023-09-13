/* Write your T-SQL query statement below */


SELECT E1.name as Employee
FROM Employee E1
CROSS JOIN Employee E2 
	-- AND E2.managerid IS NOT NULL
WHERE E1.managerid = E2.id
	AND E1.salary > E2.salary
    
