/* Write your T-SQL query statement below */


WITH CTE_Cinema
AS (
	SELECT seat_id
		,CASE 
			WHEN free = 1
				AND (
					LAG(free, 1, 0) OVER (
						ORDER BY seat_id ASC
						) = 1
					OR LEAD(free, 1, 0) OVER (
						ORDER BY seat_id ASC
						)=1
					)
				THEN 1
			ELSE 0
			END AS RES
	FROM Cinema
	)
SELECT seat_id
FROM CTE_Cinema
WHERE RES = 1
ORDER BY 1