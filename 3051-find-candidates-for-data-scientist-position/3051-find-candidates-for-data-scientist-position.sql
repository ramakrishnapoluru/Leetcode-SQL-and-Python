/* Write your T-SQL query statement below */



WITH CTE_Candidates
AS (
	SELECT candidate_id
		,SUM(CASE 
				WHEN skill = 'Python'
					THEN 1
				WHEN skill = 'Tableau'
					THEN 1
				WHEN skill = 'PostgreSQL'
					THEN 1
				ELSE 0
				END) AS Skills_total 
	FROM Candidates
	GROUP BY candidate_id
	)
SELECT candidate_id
FROM CTE_Candidates
WHERE Skills_total = 3