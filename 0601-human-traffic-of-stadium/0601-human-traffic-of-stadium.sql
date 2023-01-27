WITH CTE_Stadium
AS (
	SELECT *
		,LAG(people, 2) OVER (
			ORDER BY id
			) people_lag2
		,LAG(people, 1) OVER (
			ORDER BY id
			) people_lag1
		,LEAD(people, 2) OVER (
			ORDER BY id
			) people_lead2
		,LEAD(people, 1) OVER (
			ORDER BY id
			) people_lead1
	FROM Stadium
	)
SELECT 
id
	,visit_date
	,people
    
FROM CTE_Stadium
WHERE (
		people >= 100
		AND people_lag1 >= 100
		AND people_lag2 >= 100
		)
	OR (
		people >= 100
		AND people_lead2 >= 100
		AND people_lead1 >= 100
		)
    OR (
    people >= 100
	    AND people_lag1 >= 100
		AND people_lead1 >= 100
    )
ORDER BY visit_date