/* Write your T-SQL query statement below */





SELECT user_id
	,SUM(quantity * price) AS spending
FROM Sales S
JOIN Product P ON S.product_id = P.product_id
GROUP BY user_id
ORDER BY 2 DESC
	,1
