/* Write your T-SQL query statement below */


WITH CTE_Store AS (
SELECT
customer_id
FROM Store
WHERE amount>500
GROUP BY customer_id
HAVING COUNT(1)>=1
) 

SELECT COUNT(1) AS rich_count FROM CTE_Store