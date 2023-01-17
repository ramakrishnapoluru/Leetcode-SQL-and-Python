/* Write your T-SQL query statement below */

SELECT 
candidate_id
FROM Candidates C JOIN Rounds R
ON C.interview_id=R.interview_id
WHERE years_of_exp>=2
GROUP BY candidate_id
HAVING SUM(score)>15 