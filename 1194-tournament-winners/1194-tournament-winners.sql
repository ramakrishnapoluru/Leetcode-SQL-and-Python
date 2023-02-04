/* Write your T-SQL query statement below */

WITH CTE_Players_Matches
AS (
	SELECT group_id
		,player_id
		,RANK() OVER (
			PARTITION BY group_id ORDER BY SUM(CASE 
						WHEN first_player = player_id
							THEN first_score
						WHEN second_player = player_id
							THEN second_score
						END) DESC
				,player_id
			) AS SCORES_RANK
	FROM Players P
	JOIN Matches M ON player_id = first_player
		OR second_player = player_id
	GROUP BY group_id
		,player_id
	)
SELECT group_id
	,player_id
FROM CTE_Players_Matches
WHERE SCORES_RANK = 1



