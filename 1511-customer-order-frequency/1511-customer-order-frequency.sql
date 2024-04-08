/* Write your T-SQL query statement below */

WITH CTE_ORDER
AS (
	SELECT customer_id
		,SUM(quantity * price) as res
	FROM Orders O
	JOIN Product C ON C.product_id = O.product_id
	WHERE order_date >= '2020-06-01'
		AND order_date <= '2020-07-31'
	GROUP BY customer_id
		,YEAR(order_date)
		,MONTH(order_date)
	HAVING SUM(quantity * price) >= 100
	)
SELECT 
C.customer_id,C.name
FROM  CTE_ORDER CO JOIN Customers C
ON CO.customer_id=C.customer_id
GROUP BY C.customer_id,C.name
HAVING COUNT(1)>1
