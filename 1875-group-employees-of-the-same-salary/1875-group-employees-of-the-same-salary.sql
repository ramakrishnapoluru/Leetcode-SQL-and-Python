/* Write your T-SQL query statement below */

WITH CTE_Employees
AS (
	SELECT employee_id
		,name
		,salary
		,DENSE_RANK() OVER (
			ORDER BY SALARY
			) AS TEAM_ID
	FROM Employees
	WHERE salary IN (
			SELECT salary
			FROM Employees
			GROUP BY salary
			HAVING COUNT(salary) > 1
			)
	)
	,CTE_Employees_MEMBERS
AS (
	SELECT employee_id
		,name
		,salary
		,team_id
		,COUNT(1) OVER (
			PARTITION BY salary
			,team_id
			) AS COUNTOFTEAMMEBERS
	FROM CTE_Employees
	)
SELECT employee_id
	,name
	,salary
	,team_id
FROM CTE_Employees_MEMBERS
ORDER BY 4
	,1