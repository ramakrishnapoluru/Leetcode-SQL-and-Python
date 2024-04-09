/* Write your T-SQL query statement below */


SELECT product_id
	,store1
	,store2
	,store3
FROM (
	SELECT product_id
		,store
		,price
	FROM Products
	) AS SOURCE
PIVOT(MAX(price) FOR store IN (
			store1
			,store2
			,store3
			)) AS A