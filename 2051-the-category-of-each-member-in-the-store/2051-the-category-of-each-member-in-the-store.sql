SELECT M.member_id
	,M.name
	,CASE 
		WHEN COUNT(v.visit_id) <> 0
			AND (
				SUM(CASE 
						WHEN P.visit_id IS NOT NULL
							THEN 1
						ELSE 0
						END) * 100.00 / COUNT(1)
				) >= 80
			THEN 'Diamond'
		WHEN COUNT(v.visit_id) <> 0
			AND (
				SUM(CASE 
						WHEN P.visit_id IS NOT NULL
							THEN 1
						ELSE 0
						END) * 100.00 / COUNT(1)
				) >= 50
			AND (
				SUM(CASE 
						WHEN P.visit_id IS NOT NULL
							THEN 1
						ELSE 0
						END) * 100.00 / COUNT(1)
				) < 80
			THEN 'Gold'
		WHEN COUNT(v.visit_id) <> 0
			AND (
				SUM(CASE 
						WHEN P.visit_id IS NOT NULL
							THEN 1
						ELSE 0
						END) * 100.00 / COUNT(1)
				) < 50
			THEN 'Silver'
		WHEN COUNT(v.visit_id) = 0
			THEN 'Bronze'
		END AS category
FROM Members M
LEFT JOIN Visits V ON M.member_id = V.member_id
LEFT JOIN Purchases P ON P.visit_id = V.visit_id
GROUP BY M.member_id
	,M.name