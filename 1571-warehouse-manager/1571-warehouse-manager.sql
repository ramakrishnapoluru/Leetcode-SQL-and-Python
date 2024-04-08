/* Write your T-SQL query statement below */


WITH CTE_Products AS
(
SELECT 
product_id,
 Width * Length * Height AS volume
    FROM Products
) 

SELECT 
name AS warehouse_name,
SUM(volume*units) AS volume
FROM CTE_Products CP 
JOIN Warehouse W 
ON CP.product_id=W.product_id
GROUP BY name