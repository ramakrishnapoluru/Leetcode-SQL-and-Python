/* Write your T-SQL query statement below */



SELECT problem_id
FROM Problems
WHERE (likes * 1.00 / (likes + dislikes)) < 0.60
ORDER BY 1