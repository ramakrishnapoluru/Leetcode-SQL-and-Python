/* Write your T-SQL query statement below */


SELECT SUBSTRING(email, CHARINDEX('@', email) + 1, LEN(email)) AS email_domain
	,COUNT(id) AS count
FROM Emails
WHERE RIGHT(email, 4) = '.com'
GROUP BY SUBSTRING(email, CHARINDEX('@', email) + 1, LEN(email)) 
ORDER BY 1 