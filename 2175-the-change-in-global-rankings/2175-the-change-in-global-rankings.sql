/* Write your T-SQL query statement below */


WITH CTE_POINT
AS (
	SELECT T.team_id
		,name
		,ROW_NUMBER() OVER (
			ORDER BY points DESC,name
			) AS RNK
	FROM TeamPoints T
	)
	,CTE_PC
AS (
	SELECT T.team_id
		,name
		,ROW_NUMBER() OVER (
			ORDER BY (points + points_change) DESC,t.name
			) PCRK
	FROM TeamPoints T
	INNER JOIN PointsChange P ON T.team_id = P.team_id
	)
SELECT PC1.team_id
	,PC1.name
	,RNK - PCRK AS rank_diff
FROM CTE_POINT PC1
INNER JOIN CTE_PC PC2 ON PC1.team_id = PC2.team_id

