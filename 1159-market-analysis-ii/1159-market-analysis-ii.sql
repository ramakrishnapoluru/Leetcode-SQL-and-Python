/* Write your T-SQL query statement below */


WITH CTE_Orders
AS (
	SELECT seller_id
		,I.item_id
		,item_brand
		,COUNT(1) OVER (PARTITION BY seller_id) AS CNT
		,ROW_NUMBER() OVER (
			PARTITION BY seller_id ORDER BY order_date
			) AS RN
	FROM Orders O
	JOIN Items I ON O.item_id = I.item_id
	)
SELECT U.user_id seller_id
	,CASE 
		WHEN U.favorite_brand = C.item_brand
			THEN 'yes'
		ELSE 'no'
		END [2nd_item_fav_brand]
FROM Users U
LEFT JOIN CTE_Orders C ON C.seller_id = U.user_id
	AND RN = 2

