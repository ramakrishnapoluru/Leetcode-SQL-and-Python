/* Write your T-SQL query statement below */



SELECT ROUND(COUNT(DISTINCT session_id) * 1.00 /
IIF(COUNT(DISTINCT user_id) = 0, 1, COUNT(DISTINCT user_id)), 2) AS average_sessions_per_user
FROM Activity
WHERE activity_date BETWEEN DATEADD(DAY, - 29, '2019-07-27')
		AND '2019-07-27'


-- SELECT ISNULL(ROUND(CAST(COUNT(DISTINCT session_id) AS DECIMAL(10,2))/NULLIF(COUNT(DISTINCT user_id),0),2),0) AS average_sessions_per_user FROM Activity
-- WHERE activity_date>DATEADD(day,-30,'2019-07-27') AND activity_date<='2019-07-27'