/* Write your T-SQL query statement below */

WITH CTE_TRANS
AS (
	SELECT a.account_id
		,MONTH(day) + YEAR(day) AS Months
		,IIF(SUM(amount) > MAX(max_income), 1, 0) AS Flag
	FROM Transactions T
	JOIN Accounts A ON t.account_id = a.account_id
	WHERE type = 'Creditor'
	GROUP BY a.account_id
		,MONTH(day) + YEAR(day)
	)
SELECT DISTINCT CT1.account_id
FROM CTE_TRANS CT1
JOIN CTE_TRANS CT2 ON CT1.Months = CT2.Months + 1
WHERE CT1.account_id=CT2.account_id AND CT1.Flag = 1
	AND CT2.Flag = 1 
