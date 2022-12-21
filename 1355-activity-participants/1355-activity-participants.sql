/* Write your T-SQL query statement below */




-- SELECT activity FROM (
-- SELECT
-- =,MAX(COUNT(F.name)) OVER(PARTITION BY activity) AS MAX_NAME,
-- MIN(COUNT(F.name)) OVER(PARTITION BY activity) AS MIN_NAME
-- FROM Friends F JOIN Activities A 
-- ON F.activity=A.name 
-- GROUP BY activity
--     ) AS A
    
select
activity
from friends
group by activity
having count(id) not in
(
    select
        max(cnt) as cnt
        from
        (select
    activity,
    count(id) as cnt
    from friends
    group by activity) tmp1
    
    union
    
      select
        min(cnt) as cnt
        from
        (select
    activity,
    count(id) as cnt
    from friends
    group by activity) tmp2

)