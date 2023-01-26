/* Write your T-SQL query statement below */


-- SELECT users_id FROM Users WHERE banned='No'

-- SELECT
-- *
-- request_at Day
-- -- ,SUM(CASE 
-- -- 			WHEN STATUS IN ( 'cancelled_by_driver','cancelled_by_client')
-- -- 				THEN 1
-- -- 			ELSE 0
-- -- 			END), count(distinct users_id)
-- 	,ROUND( SUM(CASE 
-- 			WHEN STATUS IN ( 'cancelled_by_driver','cancelled_by_client')
-- 				THEN 1
-- 			ELSE 0
-- 			END)*1.00 / count(users_id)*1.00, 2)  AS [Cancellation Rate]
-- FROM Trips T
-- LEFT JOIN Users U ON T.client_id = U.users_id
-- 	OR T.driver_id = U.users_id
-- WHERE banned = 'No'
-- GROUP BY request_at

SELECT request_at AS day
	,cast(sum(CASE 
				WHEN STATUS <> 'completed'
					THEN 1.0
				ELSE 0.0
				END) / count(1) AS DECIMAL(10, 2)) AS 'cancellation rate'
FROM trips t
JOIN users rider ON t.client_id = rider.users_id
JOIN users driver ON t.driver_id = driver.users_id
WHERE t.request_at BETWEEN '2013-10-01'
		AND '2013-10-03'
	AND rider.banned = 'No'
	AND driver.banned = 'No'
GROUP BY request_at
