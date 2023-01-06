/* Write your T-SQL query statement below */



SELECT DISTINCT L1.account_id
FROM LogInfo L1
JOIN LogInfo L2 ON L1.account_id = L2.account_id
WHERE L1.ip_address <> L2.ip_address
	AND (
		L2.LOGIN BETWEEN L1.LOGIN
			AND L1.logout
		)