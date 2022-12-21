/* Write your T-SQL query statement below */




-- SELECT activity FROM (
-- SELECT
-- =,MAX(COUNT(F.name)) OVER(PARTITION BY activity) AS MAX_NAME,
-- MIN(COUNT(F.name)) OVER(PARTITION BY activity) AS MIN_NAME
-- FROM Friends F JOIN Activities A 
-- ON F.activity=A.name 
-- GROUP BY activity
--     ) AS A
    
select activity 
from friends
group by activity
having count(*)> (select TOP 1 count(*) from friends group by activity order by 1)
and count(*)< (select TOP 1 count(*) from friends group by activity order by 1 desc)