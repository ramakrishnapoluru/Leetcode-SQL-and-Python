/* Write your T-SQL query statement below */




SELECT TOP 1 ID,SUM(SENDFRNDS) AS num FROM (
SELECT requester_id AS ID ,COUNT(accepter_id) SENDFRNDS FROM RequestAccepted
GROUP BY requester_id
UNION ALL
SELECT accepter_id AS ID,COUNT(requester_id) SENDFRNDS FROM RequestAccepted
GROUP BY accepter_id
) AS A
GROUP BY ID
ORDER BY 2 DESC