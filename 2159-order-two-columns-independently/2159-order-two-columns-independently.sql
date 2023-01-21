/* Write your T-SQL query statement below */


WITH CTE_Data AS (
        SELECT 
        first_col,second_col,
        ROW_NUMBER() OVER(ORDER BY first_col) AS FC_R
        ,ROW_NUMBER() OVER(ORDER BY second_col DESC) AS SC_R
        FROM Data
)
SELECT
CT1.first_col,CT2.second_col
FROM CTE_Data CT1
INNER JOIN CTE_Data CT2 ON CT1.FC_R=CT2.SC_R