/* Write your T-SQL query statement below */


-- SELECT B.book_id,B.name FROM Books B 
-- LEFT JOIN Orders O ON B.book_id=O.book_id
-- WHERE 
-- ISNULL(dispatch_date,'2019-04-23') BETWEEN DATEADD(YEAR,-1,'2019-06-23') AND '2019-06-23'
-- -- AND
-- -- ISNULL(available_from,'1900-01-01')<'2019-05-23'
-- GROUP BY B.book_id,B.name
-- HAVING ISNULL(SUM(quantity),0)<10 


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