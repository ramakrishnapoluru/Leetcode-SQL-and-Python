/* Write your T-SQL query statement below */



SELECT user_id
	,MAX(RES) AS biggest_window
FROM (
	SELECT user_id
		,DATEDIFF(dd, visit_date, LAG(visit_date, 1, '2021-01-01') OVER (
				PARTITION BY user_id ORDER BY visit_date DESC
				)) RES
	FROM UserVisits
	) AS A
GROUP BY user_id 
ORDER BY 1