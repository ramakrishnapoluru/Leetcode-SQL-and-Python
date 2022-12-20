/* Write your T-SQL query statement below */

SELECT min(log_id) AS start_id
	,max(log_id) AS end_id
FROM (
	SELECT log_id
		,ROW_NUMBER() OVER (
			ORDER BY log_id
			) AS num
	FROM Logs
	) a
GROUP BY log_id - num