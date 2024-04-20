/* Write your T-SQL query statement below */

WITH CTE_Confirmations
AS (
	SELECT user_id
		,time_stamp
		,lead(time_stamp) OVER (
			PARTITION BY user_id ORDER BY time_stamp ASC
			) AS PREVIOUS_TS
	FROM Confirmations
	)
SELECT distinct user_id
FROM CTE_Confirmations
WHERE DATEDIFF(second, time_stamp, PREVIOUS_TS) <=86400