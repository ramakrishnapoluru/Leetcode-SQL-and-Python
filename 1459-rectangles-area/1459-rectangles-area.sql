/* Write your T-SQL query statement below */


SELECT P2.ID AS P1
	,P1.ID AS P2
	,ABS(P2.x_value - P1.x_value) * ABS(P2.y_value - P1.y_value) AS area
FROM Points P1
JOIN Points P2 ON P1.ID > P2.ID
WHERE ABS(P2.x_value - P1.x_value) * ABS(P2.y_value - P1.y_value) > 0
ORDER BY 3 DESC,1,2