/* Write your T-SQL query statement below */



WITH CTE_drivers
AS (
	SELECT DISTINCT driver_id
	FROM Rides
	)
SELECT CD.driver_id
	,ISNULL(COUNT(passenger_id),0)  cnt
FROM CTE_drivers CD
LEFT JOIN Rides R ON CD.driver_id = R.passenger_id
AND passenger_id IS NOT NULL
GROUP BY CD.driver_id


