/* Write your T-SQL query statement below */



SELECT dept_name,ISNULL(COUNT(student_id),0) AS student_number
FROM Department D LEFT JOIN Student S ON  S.dept_id=D.dept_id
GROUP BY dept_name ORDER BY 2 DESC,1 