/* Write your T-SQL query statement below */


(SELECT
C.customer_id,C.customer_name
FROM Customers C JOIN Orders O
ON C.customer_id=O.customer_id
WHERE O.product_name IN ('A')
INTERSECT
SELECT
C.customer_id,C.customer_name
FROM Customers C JOIN Orders O
ON C.customer_id=O.customer_id
WHERE O.product_name IN ('B'))
EXCEPT
SELECT
C.customer_id,C.customer_name
FROM Customers C JOIN Orders O
ON C.customer_id=O.customer_id
WHERE O.product_name IN ('C')