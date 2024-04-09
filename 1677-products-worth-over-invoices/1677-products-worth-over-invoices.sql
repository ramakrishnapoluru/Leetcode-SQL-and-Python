/* Write your T-SQL query statement below */

WITH CTE_Invoice AS (
SELECT 
product_id,
    SUM(rest) AS rest,
    SUM(paid) AS paid,
    SUM(canceled) AS canceled,
    SUM(refunded) AS refunded
FROM Invoice
GROUP BY product_id
)
SELECT 
P.name,
ISNULL(rest,0) rest,
ISNULL(paid,0) paid,
ISNULL(canceled,0) canceled,
ISNULL(refunded,0) refunded
FROM CTE_Invoice CI RIGHT JOIN Product P
ON CI.product_id=P.product_id
ORDER BY 1 