/* Write your T-SQL query statement below */

SELECT id
	,company
	,salary
FROM (
	SELECT id
		,company
		,salary
		,ROW_NUMBER() OVER (
			PARTITION BY company ORDER BY salary
				,ID
			) RANKING
		,COUNT(1) OVER (PARTITION BY company) RANKING_COUNT
	FROM Employee
	) AS A
WHERE RANKING BETWEEN CEILING(RANKING_COUNT * 1.00 / 2)
		AND FLOOR(RANKING_COUNT * 1.00 / 2) + 1