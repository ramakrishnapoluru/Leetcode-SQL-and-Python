/* Write your T-SQL query statement below */

SELECT ROUND((SUM(ORDERCALLED) * 1.00 / COUNT(1)) * 100.00, 2) AS immediate_percentage
FROM (
	SELECT CASE 
			WHEN order_date = customer_pref_delivery_date
				AND delivery_id = FIRST_VALUE(delivery_id) OVER (
					PARTITION BY customer_id ORDER BY order_date ASC
					)
				THEN 1
			WHEN order_date <> customer_pref_delivery_date
				AND delivery_id = FIRST_VALUE(delivery_id) OVER (
					PARTITION BY customer_id ORDER BY order_date ASC
					)
				THEN 0
			END AS ORDERCALLED
	FROM Delivery
	) AS A
WHERE ORDERCALLED IS NOT NULL