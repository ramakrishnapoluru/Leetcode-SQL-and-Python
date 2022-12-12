/* Write your T-SQL query statement below */



SELECT ROUND((
			SUM(DAYSBETWEEN) * 1.00 / (
				SELECT COUNT(DISTINCT player_id)
				FROM Activity
				)
			), 2) AS fraction
FROM (
	SELECT CASE 
			WHEN DATEDIFF(DAY, LAG(event_date) OVER (
						PARTITION BY player_id ORDER BY player_id
							,event_date
						), event_date) = 1
				THEN 1
			ELSE 0
			END AS DAYSBETWEEN
		,ROW_NUMBER() OVER (
			PARTITION BY player_id ORDER BY player_id
			) AS RNK
	FROM Activity
	) AS A
WHERE RNK = 2