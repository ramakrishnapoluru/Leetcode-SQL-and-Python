/* Write your T-SQL query statement below */



SELECT 
HOME.team_name AS home_team,
AWAY.team_name AS away_team
FROM Teams HOME 
CROSS JOIN Teams AWAY
WHERE HOME.team_name<>AWAY.team_name


