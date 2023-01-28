/* Write your T-SQL query statement below */


SELECT DISTINCT FORMAT(pay_date, 'yyyy-MM') pay_month
	,department_id
	,CASE 
		WHEN AVG(amount) OVER (
				PARTITION BY FORMAT(pay_date, 'yyyy-MM')
				,department_id
				) > AVG(amount) OVER (PARTITION BY FORMAT(pay_date, 'yyyy-MM'))
			THEN 'higher'
		WHEN AVG(amount) OVER (
				PARTITION BY FORMAT(pay_date, 'yyyy-MM')
				,department_id
				) < AVG(amount) OVER (PARTITION BY FORMAT(pay_date, 'yyyy-MM'))
			THEN 'lower'
		ELSE 'same'
		END comparison
FROM Salary S
JOIN Employee E ON S.employee_id = E.employee_id