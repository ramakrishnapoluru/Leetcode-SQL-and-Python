/* Write your T-SQL query statement below */



WITH CTE_Orders
AS (
	SELECT product_id
		,DATEPART(YEAR, purchase_date) AS YEAR
	FROM Orders
	GROUP BY product_id
		,DATEPART(YEAR, purchase_date)
	HAVING COUNT(DISTINCT order_id) >= 3
	)
SELECT DISTINCT CT1.product_id
FROM CTE_Orders CT1
JOIN CTE_Orders CT2 ON CT1.product_id = CT2.product_id
	AND CT1.YEAR = CT2.YEAR+1