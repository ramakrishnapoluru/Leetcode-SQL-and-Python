/* Write your T-SQL query statement below */



WITH Employee_CTE
AS (
	SELECT D.name Department
		,E.name Employee
		,Salary
		,DENSE_RANK() OVER (
			PARTITION BY E.departmentId ORDER BY Salary DESC
			) RANKING
	FROM Employee E
	JOIN Department D ON E.departmentId = D.id
	)
SELECT Department
	,Employee
	,Salary
FROM Employee_CTE
WHERE RANKING <= 3