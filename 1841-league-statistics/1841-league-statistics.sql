WITH cte_matches
AS (
	SELECT *
		,CASE 
			WHEN home_team_goals > away_team_goals
				THEN 3
			WHEN home_team_goals = away_team_goals
				THEN 1
			ELSE 0
			END AS HomePoints
		,CASE 
			WHEN home_team_goals < away_team_goals
				THEN 3
			WHEN home_team_goals = away_team_goals
				THEN 1
			ELSE 0
			END AS AwayPoints
	FROM Matches
	)
SELECT team_name
	,COUNT(team_id) AS matches_played
	,SUM(CASE 
			WHEN team_id = home_team_id
				THEN HomePoints
			WHEN team_id = away_team_id
				THEN AwayPoints
			END) AS points
	,SUM(CASE 
			WHEN team_id = home_team_id
				THEN home_team_goals
			WHEN team_id = away_team_id
				THEN away_team_goals
			END) AS goal_for
	,SUM(CASE 
			WHEN team_id = home_team_id
				AND away_team_id <> team_id
				THEN away_team_goals
			WHEN team_id = away_team_id
				AND home_team_id <> team_id
				THEN home_team_goals
			END) AS goal_against
	,SUM(CASE 
			WHEN team_id = home_team_id
				THEN home_team_goals
			WHEN team_id = away_team_id
				THEN away_team_goals
			END) - SUM(CASE 
			WHEN team_id = home_team_id
				AND away_team_id <> team_id
				THEN away_team_goals
			WHEN team_id = away_team_id
				AND home_team_id <> team_id
				THEN home_team_goals
			END) AS goal_diff
FROM Teams T
JOIN cte_matches M ON T.team_id = M.home_team_id
	OR away_team_id = team_id
GROUP BY team_name
ORDER BY 3 DESC,6 DESC,1 