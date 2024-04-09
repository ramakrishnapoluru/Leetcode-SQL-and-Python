/* Write your T-SQL query statement below */


SELECT user_id
	,CONCAT (
		UPPER(SUBSTRING(name, 1, 1))
		,LOWER(SUBSTRING(name, 2, LEN(name)))
		) AS name
FROM Users
ORDER BY 1