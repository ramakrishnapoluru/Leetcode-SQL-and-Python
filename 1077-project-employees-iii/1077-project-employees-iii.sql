/* Write your T-SQL query statement below */


SELECT project_id,employee_id FROM 
(
SELECT P.project_id,E.employee_id,
DENSE_RANK() OVER(PARTITION BY P.project_id ORDER BY experience_years DESC) AS MOSTEX,
experience_years
FROM Project P JOIN Employee E ON P.employee_id=E.employee_id
) AS A 
WHERE MOSTEX=1


-- {"headers": ["project_id", "employee_id"], "values": [[1, 1], [1, 2], [1, 3], [2, 1], [2, 4]]}