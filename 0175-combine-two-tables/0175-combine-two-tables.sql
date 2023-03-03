/* Write your T-SQL query statement below */


SELECT firstName
	,lastName
	,city
	,STATE
FROM Person P
LEFT JOIN Address A ON P.personId = A.personId
