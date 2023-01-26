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

select request_at as day, 
cast(sum(case when status <> 'completed' then 1.0 else 0.0 end)/count(*) as decimal(10,2)) as 'cancellation rate' 
from trips t join users rider on t.client_id = rider.users_id 
join users driver on t.driver_id = driver.users_id
where t.request_at between '2013-10-01' and '2013-10-03'
and rider.banned = 'No'
and driver.banned = 'No'
group by request_at
