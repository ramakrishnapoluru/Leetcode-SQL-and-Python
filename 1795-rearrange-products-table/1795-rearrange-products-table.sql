/* Write your T-SQL query statement below */



SELECT product_id
	,store
	,price
FROM Products
UNPIVOT(PRICE FOR store IN (
			store1
			,store2
			,store3
			)) AS A
ORDER BY Store