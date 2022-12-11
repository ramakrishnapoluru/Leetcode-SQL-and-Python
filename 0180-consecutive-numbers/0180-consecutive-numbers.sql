/* Write your T-SQL query statement below */


-- SELECT num FROM 
-- (SELECT num, DENSE_RANK() OVER(ORDER BY id) AS DENSERANK FROM 
-- Logs) AS A 
-- GROUP BY DENSERANK
-- HAVING COUNT(num)>=3


SELECT DISTINCT num AS ConsecutiveNums FROM (
SELECT id, num, 
				ROW_NUMBER() OVER (ORDER BY id) 
				- ROW_NUMBER() OVER (PARTITION BY num ORDER BY id) as 'ConsecutiveGroup'
		FROM Logs
) AS A 
GROUP BY num,ConsecutiveGroup
HAVING COUNT(1)>=3