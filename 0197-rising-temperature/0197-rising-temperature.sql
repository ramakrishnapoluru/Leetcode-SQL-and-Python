/* Write your T-SQL query statement below */


SELECT 
w2.id
FROM Weather W1 INNER JOIN Weather W2 
ON W1.recordDate=DATEADD(DD,-1,W2.recordDate)
AND W1.temperature<W2.temperature