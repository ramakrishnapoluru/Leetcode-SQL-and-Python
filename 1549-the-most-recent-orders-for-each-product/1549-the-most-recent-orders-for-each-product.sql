/* Write your T-SQL query statement below */


SELECT product_name
	,product_id
	,order_id
	,order_date
FROM (
	
    SELECT product_name
		,P.product_id
		,order_id
		,order_date
		,RANK() OVER (
			PARTITION BY O.product_id ORDER BY order_date DESC
			) AS RNK
	FROM Customers C
	JOIN Orders O ON C.customer_id = O.customer_id
	JOIN Products P ON O.product_id = P.product_id 


) AS A
	WHERE RNK = 1
ORDER BY 1,2,3