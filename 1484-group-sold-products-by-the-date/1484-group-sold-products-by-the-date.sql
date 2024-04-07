/* Write your T-SQL query statement below */


SELECT 
  sell_date,
  COUNT(product) AS num_sold,
  STRING_AGG(product, ',') WITHIN GROUP (ORDER BY product ASC) AS products
FROM (SELECT DISTINCT * FROM Activities) T
GROUP BY sell_date