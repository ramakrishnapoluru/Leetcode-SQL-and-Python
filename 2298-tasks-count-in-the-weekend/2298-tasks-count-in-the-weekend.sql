/* Write your T-SQL query statement below */


SELECT (
		SELECT COUNT(task_id)
		FROM Tasks
		WHERE DATEPART(DW, submit_date) IN (
				1
				,7
				)
		) AS weekend_cnt
	,(
		SELECT COUNT(task_id)
		FROM Tasks
		WHERE DATEPART(DW, submit_date) NOT IN (
				1
				,7
				)
		) AS working_cnt