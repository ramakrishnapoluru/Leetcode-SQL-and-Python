/* Write your T-SQL query statement below */



WITH CTE_OrdersDetails as ( 
SELECT
DISTINCT
order_id,
AVG(quantity*1.00) OVER(PARTITION BY order_id) AS AVGQUANTITY,
MAX(quantity) OVER(PARTITION BY order_id) AS MAXQUANTITY
FROM OrdersDetails
)
SELECT  
CT1.order_id
FROM CTE_OrdersDetails  CT1
CROSS JOIN  CTE_OrdersDetails  CT2
WHERE CT1.MAXQUANTITY>CT2.AVGQUANTITY
GROUP BY CT1.order_id
HAVING COUNT(1)=(SELECT COUNT(DISTINCT order_id) FROM OrdersDetails)
