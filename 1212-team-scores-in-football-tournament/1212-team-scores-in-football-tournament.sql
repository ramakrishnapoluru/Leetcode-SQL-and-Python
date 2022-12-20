/* Write your T-SQL query statement below */
SELECT team_id
	,team_name,
    SUM(HOST_POINTS) AS num_points FROM 
(
SELECT team_id
	,team_name
	-- ,host_team
	-- ,guest_team
	,SUM(CASE 
		WHEN host_goals > guest_goals
			THEN 3
		WHEN host_goals = guest_goals THEN 1 ELSE 0
		END) AS HOST_POINTS

	
FROM Teams T
LEFT JOIN Matches M ON T.team_id = M.host_team
GROUP BY team_id
	,team_name,host_team
UNION ALL
SELECT team_id
	,team_name
	-- ,host_team
	-- ,guest_team
	,
    SUM(
        CASE 
		WHEN host_goals < guest_goals
			THEN 3
		WHEN host_goals = guest_goals THEN 1 ELSE 0
		END
        )
        AS HOST_POINTS

	
FROM Teams T
LEFT JOIN Matches M ON T.team_id = M.guest_team
GROUP BY team_id
	,team_name,guest_team
) AS A
GROUP BY team_id
	,team_name
    ORDER BY 3 DESC,1 
