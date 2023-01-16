/* Write your T-SQL query statement below */

SELECT S.user_id
	,ROUND(SUM(CASE 
				WHEN action = 'confirmed'
					THEN 1
				ELSE 0
				END) * 1.00 / COUNT(1), 2) AS confirmation_rate
FROM Signups S
LEFT JOIN Confirmations C ON S.user_id = C.user_id
GROUP BY S.user_id