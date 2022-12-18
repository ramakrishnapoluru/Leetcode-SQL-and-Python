/* Write your T-SQL query statement below */

SELECT P1.product_id
	,P1.new_price price
FROM Products P1
INNER JOIN (
	SELECT product_id
		,max(change_date) change_date
	FROM Products
	WHERE change_date <= '2019-08-16'
	GROUP BY product_id
	) AS P2 ON P1.product_id = P2.product_id
	AND P1.change_date = P2.change_date

UNION

SELECT product_id
	,10 AS price
FROM Products
WHERE change_date > '2019-08-16'
	AND product_id NOT IN (
		SELECT DISTINCT product_id
		FROM Products
		WHERE change_date <= '2019-08-16'
		)