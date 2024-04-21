/* Write your T-SQL query statement below */

WITH CTE_Salaries_Engineering AS 
(
SELECT 
MAX(salary) AS Engineering_salary
FROM Salaries
    WHERE department='Engineering'
),CTE_Salaries_Marketing AS 
(
SELECT 
MAX(salary) AS Engineering_salary
FROM Salaries
    WHERE department='Marketing'
)
SELECT ABS(
(SELECT  Engineering_salary FROM CTE_Salaries_Engineering)
-
(SELECT  Engineering_salary FROM CTE_Salaries_Marketing)
) AS salary_difference