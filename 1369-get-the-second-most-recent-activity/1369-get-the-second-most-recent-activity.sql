/* Write your T-SQL query statement below */


WITH CTE_UserActivity
AS (
	SELECT username
		,activity
		,startDate
		,endDate
		,RANK() OVER (
			PARTITION BY username ORDER BY startDate DESC
				,endDate DESC
			) AS R
	FROM UserActivity
	)
SELECT username
	,activity
	,startDate
	,endDate
FROM CTE_UserActivity
WHERE R = 2

UNION

SELECT username
	,activity
	,startDate
	,endDate
FROM CTE_UserActivity
WHERE username IN (
		SELECT username
		FROM UserActivity
		GROUP BY username
		HAVING COUNT(1) = 1
		)