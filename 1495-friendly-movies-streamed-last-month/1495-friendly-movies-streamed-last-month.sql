/* Write your T-SQL query statement below */
 
WITH CTE_JUNE_DATA AS 
(
SELECT 
DISTINCT content_id
FROM TVProgram
WHERE YEAR(program_date)=2020 AND MONTH(program_date)=6
)
SELECT 
DISTINCT title
FROM Content C JOIN CTE_JUNE_DATA  CJ 
ON C.content_id=CJ.content_id
WHERE Kids_content='Y' AND content_type='Movies'