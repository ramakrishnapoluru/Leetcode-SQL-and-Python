/* Write your T-SQL query statement below */


SELECT  E1.NAME FROM Employee E1 JOIN Employee E2 
ON  E1.id=E2.managerId
GROUP BY E1.NAME
HAVING COUNT(E2.ID)>=5
