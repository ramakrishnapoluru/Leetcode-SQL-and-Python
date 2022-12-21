
/* Write your T-SQL query statement below */



SELECT name AS results FROM
(
SELECT TOP 1 name
FROM MovieRating MR
JOIN Users U ON U.user_id = MR.user_id
GROUP BY U.name
ORDER BY COUNT(DISTINCT movie_id) DESC,name
) AS A

UNION

SELECT title AS results FROM
(
SELECT TOP 1 title
FROM Movies M
JOIN MovieRating MR ON M.movie_id = MR.movie_id
WHERE LEFT(created_at, 7) = '2020-02'
GROUP BY title
ORDER BY SUM(rating * 1.00) / COUNT(DISTINCT MR.user_id)*1.00 DESC,title
) AS B