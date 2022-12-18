/* Write your T-SQL query statement below */

SELECT person_name
FROM (
	SELECT TOP 1 person_name
		,CASE 
			WHEN SUM(weight) OVER (
					ORDER BY turn ASC
					) <= 1000
				THEN SUM(1) OVER (
						ORDER BY turn ASC
						)
			ELSE 0
			END A
	FROM QUEUE
	ORDER BY 2 DESC
	) AS Q