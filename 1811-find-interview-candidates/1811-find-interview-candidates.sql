WITH CTE_RANK
AS (
	SELECT contest_id
		,gold_medal AS MEDALS_WINNERS
		,name
		,mail
	FROM Contests C1
	JOIN Users U1 ON U1.user_id = C1.gold_medal
	
	UNION
	
	SELECT contest_id
		,silver_medal AS MEDALS_WINNERS
		,name
		,mail
	FROM Contests C1
	JOIN Users U1 ON U1.user_id = C1.silver_medal
	
	UNION
	
	SELECT contest_id
		,bronze_medal AS MEDALS_WINNERS
		,name
		,mail
	FROM Contests C1
	JOIN Users U1 ON U1.user_id = C1.bronze_medal
	)
SELECT DISTINCT c1.name
	,c1.mail
FROM CTE_RANK C1
JOIN CTE_RANK C2 ON C1.contest_id <> C2.contest_id
JOIN CTE_RANK C3 ON C1.contest_id <> C3.contest_id
	AND C2.contest_id <> C3.contest_id
	AND C1.contest_id + 1 = C2.contest_id
	AND C1.contest_id + 2 = C3.contest_id
	AND C1.MEDALS_WINNERS = C2.MEDALS_WINNERS
	AND C2.MEDALS_WINNERS = C3.MEDALS_WINNERS

UNION

SELECT name
	,mail
FROM Contests C1
JOIN Users U1 ON U1.user_id = C1.gold_medal
GROUP BY gold_medal
	,name
	,mail
HAVING COUNT(DISTINCT contest_id) >= 3