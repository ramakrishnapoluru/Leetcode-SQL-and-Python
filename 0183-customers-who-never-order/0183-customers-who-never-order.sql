/* Write your T-SQL query statement below */


SELECT name AS Customers
FROM Customers C
LEFT JOIN Orders O ON C.id = O.customerId
WHERE O.id IS NULL