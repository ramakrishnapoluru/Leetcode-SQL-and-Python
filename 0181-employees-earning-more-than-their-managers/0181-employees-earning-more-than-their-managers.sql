/* Write your T-SQL query statement below */

SELECT 
E1.name AS Employee
FROM Employee E1 INNER JOIN Employee E2 ON E1.managerId=E2.ID
WHERE E1.salary>E2.salary