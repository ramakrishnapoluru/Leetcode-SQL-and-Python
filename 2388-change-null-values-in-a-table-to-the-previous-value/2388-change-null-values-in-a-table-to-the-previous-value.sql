/* Write your T-SQL query statement below */



WITH CTE AS (
SELECT *, row_number() over(ORDER BY (SELECT 1)) as rn FROM CoffeeShop
),

CTE1 AS (
SELECT *, count(drink) over (order by rn) as cnt FROM CTE
)

SELECT id, first_value(drink) over (partition by cnt ORDER BY (SELECT 1)) as drink FROM CTE1

