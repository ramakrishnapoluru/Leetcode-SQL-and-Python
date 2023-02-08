/* Write your T-SQL query statement below */


WITH CTE_Student_Exam
AS (
	SELECT S.student_id
		,S.student_name
		,exam_id
		,score
		,COUNT(exam_id) OVER (PARTITION BY S.student_id) EXAMSTOOK
		,CASE 
			WHEN MAX(score) OVER (PARTITION BY exam_id) = score
				OR MIN(score) OVER (PARTITION BY exam_id) = SCORE
				THEN 'OUT'
			ELSE 'IN'
			END AS FL
	FROM Student S
	JOIN Exam E ON S.student_id = E.student_id
	)
SELECT  S.student_id,S.student_name 
FROM  Student S
JOIN Exam E ON S.student_id = E.student_id
EXCEPT
SELECT DISTINCT S.student_id
	,S.student_name
FROM CTE_Student_Exam S
WHERE FL='OUT' AND EXAMSTOOK>1
ORDER BY student_id