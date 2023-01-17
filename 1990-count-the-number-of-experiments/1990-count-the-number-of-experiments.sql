WITH CTE
AS (
	SELECT 'Android' AS platform
		,'Reading' AS experiment_name
	
	UNION
	
	SELECT 'Android' AS platform
		,'Sports' AS experiment_name
	
	UNION
	
	SELECT 'Android' AS platform
		,'Programming' AS experiment_name
	
	UNION
	
	SELECT 'IOS' AS platform
		,'Reading' AS experiment_name
	
	UNION
	
	SELECT 'IOS' AS platform
		,'Sports' AS experiment_name
	
	UNION
	
	SELECT 'IOS' AS platform
		,'Programming' AS experiment_name
	
	UNION
	
	SELECT 'Web' AS platform
		,'Reading' AS experiment_name
	
	UNION
	
	SELECT 'Web' AS platform
		,'Sports' AS experiment_name
	
	UNION
	
	SELECT 'Web' AS platform
		,'Programming' AS experiment_name
	)
SELECT C.platform
	,C.experiment_name
	,COUNT(experiment_id) num_experiments
FROM CTE C
LEFT JOIN Experiments E ON C.experiment_name = E.experiment_name
	AND C.platform = E.platform
GROUP BY C.platform
	,C.experiment_name
ORDER BY 1,2