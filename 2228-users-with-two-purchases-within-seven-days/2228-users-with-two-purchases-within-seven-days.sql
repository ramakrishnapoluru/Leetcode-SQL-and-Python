/* Write your T-SQL query statement below */


SELECT user_id
FROM (
	SELECT user_id
		,DATEDIFF(DAY, LAG(purchase_date, 1, purchase_date) OVER (
				PARTITION BY user_id ORDER BY purchase_date
				), purchase_date) AS daysdiff
	FROM Purchases
	) AS A
WHERE daysdiff <= 7
GROUP BY user_id
HAVING count(1) >= 2