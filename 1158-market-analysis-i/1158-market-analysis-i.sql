/* Write your T-SQL query statement below */


-- SELECT user_id buyer_id
-- 	,join_date
-- 	,orders_in_2019
-- FROM (
-- 	SELECT U.user_id
-- 		,join_date
-- 		,COUNT(order_id) OVER (PARTITION BY buyer_id) AS orders_in_2019
--         ,ROW_NUMBER() OVER(PARTITION BY buyer_id,join_date ORDER BY  buyer_id,join_date) AS RNK
-- 	FROM USERS U
-- 	LEFT JOIN Orders O ON O.buyer_id = U.user_id
-- 		AND YEAR(order_date) = 2019
-- 	) AS A
-- WHERE RNK = 1



SELECT  user_id buyer_id,join_date,ISNULL(ORDERS,0) orders_in_2019 FROM Users U LEFT JOIN (
SELECT buyer_id, COUNT(order_id) AS ORDERS 
FROM Orders WHERE YEAR(order_date)=2019
GROUP BY buyer_id
) AS CNT ON U.user_id=CNT.buyer_id
