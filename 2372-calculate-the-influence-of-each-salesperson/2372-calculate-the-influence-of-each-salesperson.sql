/* Write your T-SQL query statement below */



SELECT 
S.salesperson_id,
S.name,
ISNULL(SUM(price),0) total
FROM Salesperson S LEFT JOIN Customer C
ON S.salesperson_id=C.salesperson_id
LEFT JOIN Sales SL ON SL.customer_id=C.customer_id
GROUP BY S.salesperson_id,
S.name