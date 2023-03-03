/* Write your T-SQL query statement below */


WITH CTE_Orders
AS (
	SELECT TOP 1 customer_number
		,COUNT(order_number) AS CNT
	FROM Orders
	GROUP BY customer_number
	ORDER BY 2 DESC
	)
SELECT TOP 1 customer_number
FROM CTE_Orders


