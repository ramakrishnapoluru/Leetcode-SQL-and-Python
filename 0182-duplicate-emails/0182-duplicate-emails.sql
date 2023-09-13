/* Write your T-SQL query statement below */


SELECT email
FROM PERSON P
GROUP BY email 
HAVING COUNT(1)>1