/* Write your T-SQL query statement below */

-- SELECT ISNULL(
--     (SELECT salary 
-- FROM Employee
-- ORDER BY salary DESC OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY)
--     ,NULL) AS SecondHighestSalary

SELECT MAX(salary) AS SecondHighestSalary
FROM Employee WHERE salary<(SELECT MAX(salary) AS SecondHighestSalary
FROM Employee )