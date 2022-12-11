/* Write your T-SQL query statement below */


SELECT TOP 1 ROUND(SQRT(((P2.X - P1.X) * (P2.X - P1.X) + (P2.Y - P1.Y) * (P2.Y - P1.Y))), 2) AS shortest
FROM Point2D P1
	,Point2D P2
WHERE ROUND(SQRT(((P2.X - P1.X) * (P2.X - P1.X) + (P2.Y - P1.Y) * (P2.Y - P1.Y))), 2)<>0
ORDER BY 1

