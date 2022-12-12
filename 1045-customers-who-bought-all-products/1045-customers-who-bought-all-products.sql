/* Write your T-SQL query statement below */


SELECT  customer_id FROM Customer C JOIN Product P 
ON C.product_key=P.product_key 
GROUP BY customer_id 
HAVING COUNT(DISTINCT C.product_key)=(SELECT COUNT( DISTINCT product_key) FROM Product)
