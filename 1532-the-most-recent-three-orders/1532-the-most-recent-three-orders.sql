/* Write your T-SQL query statement below */


SELECT customer_name
	,customer_id
	,order_id
	,order_date
FROM (
	SELECT name customer_name
		,C.customer_id
		,order_id
		,order_date
		,ROW_NUMBER() OVER (
			PARTITION BY O.customer_id ORDER BY order_date DESC
			) AS ORDERS
	FROM Customers C
	JOIN Orders O ON C.customer_id = O.customer_id
	) AS A
WHERE ORDERS <= 3
ORDER BY 1
	,2
	,4 DESC