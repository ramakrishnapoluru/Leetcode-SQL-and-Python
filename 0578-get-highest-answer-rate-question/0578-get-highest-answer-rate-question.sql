/* Write your T-SQL query statement below */

SELECT question_id survey_log
FROM (
	SELECT TOP 1 question_id
		,ROUND((
				SUM(CASE 
						WHEN action = 'answer'
							THEN 1
						ELSE 0
						END) * 1.00 / IIF(SUM(CASE 
							WHEN action = 'show'
								THEN 1
							ELSE 0
							END) = 0, 1, SUM(CASE 
							WHEN action = 'show'
								THEN 1
							ELSE 0
							END)) * 1.00
				), 2) AS answer_Cnt
	FROM SurveyLog
	GROUP BY question_id
	ORDER BY answer_Cnt DESC
		,question_id ASC
	) AS A
