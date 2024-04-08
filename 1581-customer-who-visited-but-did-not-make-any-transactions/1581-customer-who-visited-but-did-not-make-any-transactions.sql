/* Write your T-SQL query statement below */



SELECT customer_id
	,SUM(CASE 
			WHEN T.transaction_id IS NULL
				THEN 1
			ELSE 0
			END) AS count_no_trans
FROM Visits V
LEFT JOIN Transactions T ON V.visit_id = T.visit_id
GROUP BY customer_id
HAVING SUM(CASE 
			WHEN T.transaction_id IS NULL
				THEN 1
			ELSE 0
			END)>0