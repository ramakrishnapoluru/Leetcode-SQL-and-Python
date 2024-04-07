/* Write your T-SQL query statement below */


SELECT 
name,
SUM(ISNULL(distance,0)) AS travelled_distance
FROM Users U LEFT JOIN Rides R ON U.id=R.user_id
GROUP BY name,U.id
ORDER BY 2 DESC,1 ASC