/* Write your T-SQL query statement below */


SELECT followee AS follower
	,COUNT(follower) AS Num
FROM Follow
WHERE followee IN (
		SELECT follower
		FROM Follow
		)
GROUP BY followee
HAVING COUNT(follower) >= 1
ORDER BY 1 