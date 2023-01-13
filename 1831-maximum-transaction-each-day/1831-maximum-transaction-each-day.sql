/* Write your T-SQL query statement below */


SELECT DISTINCT transaction_id
FROM (
	SELECT transaction_id
		,DENSE_RANK() OVER (
			PARTITION BY CONVERT(DATE, day) ORDER BY amount DESC
			) AS RANKING
	FROM Transactions
	) AS A
WHERE RANKING = 1
ORDER BY transaction_id