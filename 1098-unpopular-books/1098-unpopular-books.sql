/* Write your T-SQL query statement below */


SELECT B.book_id,name
FROM Books B
LEFT JOIN (
	SELECT book_id
	FROM Orders
	WHERE dispatch_date BETWEEN DATEADD(YEAR, - 1, '2019-06-23')
			AND '2019-06-23'
	GROUP BY book_id
	HAVING sum(quantity) > = 10
	) AS O ON B.book_id = O.book_id
WHERE available_from < '2019-05-23'
AND O.book_id IS NULL