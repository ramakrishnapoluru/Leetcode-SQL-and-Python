/* Write your T-SQL query statement below */


SELECT SUM(B.apple_count + ISNULL(C.apple_count, 0)) AS apple_count
	,SUM(B.orange_count + ISNULL(C.orange_count, 0)) AS orange_count
FROM Boxes B
LEFT JOIN Chests C ON B.chest_id = C.chest_id