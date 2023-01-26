/* Write your T-SQL query statement below */




SELECT
student_id,department_id,

ROUND(
    
( 
    RANK() OVER(PARTITION BY department_id ORDER BY mark DESC) - 1 
)*100.00/
    
IIF(
(
COUNT(1) OVER(PARTITION BY department_id) -1
) *1.00=0,1,(
COUNT(1) OVER(PARTITION BY department_id) -1
) *1.00
)

    
,2) AS percentage

FROM 
Students



