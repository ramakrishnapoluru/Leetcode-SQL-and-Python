/* Write your T-SQL query statement below */


SELECT business_id
FROM Events E
JOIN (
	SELECT event_type
		,AVG(occurences * 1.00) average_activity
	FROM Events
	GROUP BY event_type
	) AS AVGS ON AVGS.event_type = E.event_type
	AND occurences > average_activity
GROUP BY business_id
HAVING COUNT(1) > 1