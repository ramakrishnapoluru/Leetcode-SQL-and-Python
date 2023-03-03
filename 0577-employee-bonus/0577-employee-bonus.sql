/* Write your T-SQL query statement below */


SELECT E1.name
	,B1.bonus
FROM Employee E1
LEFT JOIN Bonus B1 ON E1.empId = B1.empId
WHERE ISNULL(B1.bonus, 0) < 1000