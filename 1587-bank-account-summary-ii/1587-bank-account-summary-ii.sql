/* Write your T-SQL query statement below */


SELECT name
	,SUM(amount) AS balance
FROM Transactions T
JOIN Users U ON T.account = U.account
GROUP BY name
HAVING SUM(amount)>10000