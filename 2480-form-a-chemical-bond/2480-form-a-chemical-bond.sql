/* Write your T-SQL query statement below */



WITH CTE_METALS
AS (
	SELECT E1.symbol AS metal
	FROM Elements E1
	WHERE E1.type = 'Metal'
	)
	,CTE_NON_METALS
AS (
	SELECT E2.symbol AS nonmetal
	FROM Elements E2
	WHERE E2.type = 'Nonmetal'
	)
SELECT metal
	,nonmetal
FROM CTE_METALS
	,CTE_NON_METALS