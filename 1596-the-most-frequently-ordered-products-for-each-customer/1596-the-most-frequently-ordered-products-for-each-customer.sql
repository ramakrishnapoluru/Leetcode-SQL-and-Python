

SELECT customer_id,product_id,product_name FROM 
(
SELECT 
O.customer_id,O.product_id,product_name,
DENSE_RANK() OVER(PARTITION BY O.customer_id ORDER BY COUNT(1) DESC)  RNK
FROM Orders O LEFT JOIN Products P
ON O.product_id=P.product_id
GROUP BY O.customer_id,O.product_id,product_name
) AS A
WHERE RNK=1