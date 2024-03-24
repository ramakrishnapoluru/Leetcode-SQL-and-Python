/* Write your T-SQL query statement below */
WITH CTE_Activity AS (
SELECT 
user_id,
activity_date
FROM Activity 
WHERE activity_date>= 
DATEADD(day,-29,'2019-07-27') AND activity_date<='2019-07-27'
GROUP BY user_id,
activity_date
HAVING COUNT(activity_type)>=1
) 
SELECT activity_date AS day,
COUNT(DISTINCT user_id) active_users
FROM CTE_Activity
GROUP BY activity_date