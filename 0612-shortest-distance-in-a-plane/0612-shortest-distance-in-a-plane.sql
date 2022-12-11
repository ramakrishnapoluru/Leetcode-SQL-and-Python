/* Write your T-SQL query statement below */


-- SELECT TOP 1 ROUND(SQRT(((P2.X - P1.X) * (P2.X - P1.X) + (P2.Y - P1.Y) * (P2.Y - P1.Y))), 2) AS shortest
-- FROM Point2D P1
-- 	,Point2D P2
-- WHERE ROUND(SQRT(((P2.X - P1.X) * (P2.X - P1.X) + (P2.Y - P1.Y) * (P2.Y - P1.Y))), 2)<>0
-- ORDER BY 1

select ROUND(SQRT(min((p1.x-p2.x)*(p1.x-p2.x)+(p1.y-p2.y)*(p1.y-p2.y))),2) as shortest
from Point2D p1,Point2D p2
where p1.x <> p2.x or p1.y <> p2.y;