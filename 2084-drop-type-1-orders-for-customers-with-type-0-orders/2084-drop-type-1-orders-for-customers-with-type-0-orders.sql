/* Write your T-SQL query statement below */

SELECT order_id,customer_id,order_type 
FROM Orders

EXCEPT

SELECT order_id,customer_id,order_type 
FROM Orders
WHERE customer_id IN (
		SELECT customer_id
		FROM Orders
		WHERE order_type = 0
		)
	AND order_type = 1