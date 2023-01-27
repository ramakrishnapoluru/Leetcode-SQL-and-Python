
WITH CTE_Months
AS (
	SELECT 1 AS M
	
	UNION
	
	SELECT 2
	
	UNION
	
	SELECT 3
	
	UNION
	
	SELECT 4
	
	UNION
	
	SELECT 5
	
	UNION
	
	SELECT 6
	
	UNION
	
	SELECT 7
	
	UNION
	
	SELECT 8
	
	UNION
	
	SELECT 9
	
	UNION
	
	SELECT 10
	
	UNION
	
	SELECT 11
	
	UNION
	
	SELECT 12
	)
	,CTE_Employee
AS (
	SELECT ES.id
		,M.M
		,CASE 
			WHEN E.Salary IS NULL
				THEN 0
			ELSE E.Salary
			END AS SAL
		,SUM(CASE 
				WHEN E.Salary IS NULL
					THEN 0
				ELSE E.Salary
				END) OVER (
			PARTITION BY ES.id ORDER BY M.M ROWS BETWEEN 2 preceding
					AND 0 preceding
			) CSAL
		,MAX(E.month) OVER (PARTITION BY ES.ID) MAXMON
	FROM (
		SELECT DISTINCT id
		FROM Employee
		) ES
	CROSS JOIN CTE_Months M
	LEFT JOIN Employee E ON E.id = ES.ID
		AND M.M = E.month
	)
SELECT id
	,M AS month
	,CSAL Salary
FROM CTE_Employee
WHERE MAXMON <> M
	AND CSAL <> 0
	AND SAL <> 0
ORDER BY id
	,M DESC