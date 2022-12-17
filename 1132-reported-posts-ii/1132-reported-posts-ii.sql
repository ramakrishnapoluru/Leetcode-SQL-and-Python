/* Write your T-SQL query statement below */

-- SELECT ROUND(AVG(average_daily_percent)*1.00,4)*100 AS average_daily_percent FROM (
-- SELECT   SUM(REMOVEDPOSTS)*1.00/SUM(TOTALPOSTS)*1.00 AS average_daily_percent
-- FROM (
-- SELECT action_date,
-- COUNT(R.post_id) OVER(PARTITION BY action_date)*1.00 REMOVEDPOSTS,
-- COUNT(A.post_id) OVER(PARTITION BY action_date) AS TOTALPOSTS
-- FROM Actions A LEFT JOIN Removals R
-- ON A.post_id=R.post_id
-- WHERE action='report' AND extra='spam'
-- ) AS A GROUP BY action_date

-- ) AS B

SELECT ROUND(AVG(average_p), 2) AS average_daily_percent
FROM (
    SELECT action_date, (COUNT(DISTINCT Removals.post_id) *1.00/ COUNT(DISTINCT Actions.post_id) * 100) AS average_p
    FROM Actions
    LEFT JOIN Removals ON Actions.post_id = Removals.post_id
    WHERE action='report' AND extra='spam'
    GROUP BY action_date
) daily_percentage