/* Write your T-SQL query statement below */

SELECT COUNT(DISTINCT SB.account_id) AS accounts_count
FROM Subscriptions SB
LEFT JOIN Streams ST ON SB.account_id = ST.account_id
WHERE (
		YEAR(start_date) = 2021
		OR YEAR(end_date) = 2021
		)
	AND YEAR(stream_date) <> 2021
	
