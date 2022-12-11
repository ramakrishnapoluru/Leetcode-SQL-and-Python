/* Write your T-SQL query statement below */


SELECT 
id,
CASE WHEN ID%2=1 THEN
ISNULL(LEAD(student) OVER(ORDER BY ID),student)
WHEN ID%2=0 THEN
ISNULL(LAG(student) OVER(ORDER BY ID),student)
END 
AS student
FROM Seat