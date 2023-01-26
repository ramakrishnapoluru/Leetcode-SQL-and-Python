/* Write your T-SQL query statement below */

WITH CTE_Weather
AS (
	SELECT city_id
		,day
		,degree
		,ROW_NUMBER() OVER (
			PARTITION BY city_id ORDER BY degree DESC
				,day
			) AS RANKING
	FROM Weather
	)
SELECT city_id
	,day
	,degree
FROM CTE_Weather
WHERE RANKING = 1

