/* Write your T-SQL query statement below */


SELECT 
LOWER(TRIM(product_name)) AS product_name,
FORMAT(sale_date,'yyyy-MM') AS sale_date,
COUNT(sale_id) AS total
FROM Sales
GROUP BY 
LOWER(TRIM(product_name)),FORMAT(sale_date,'yyyy-MM')
ORDER BY 1,sale_date