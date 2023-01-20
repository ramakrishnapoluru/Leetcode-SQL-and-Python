/* Write your T-SQL query statement below */


SELECT * FROM Orders  
EXCEPT
SELECT *
FROM Orders
WHERE customer_id IN (
		SELECT customer_id
		FROM Orders
		WHERE order_type = 0
		)
AND order_type = 1