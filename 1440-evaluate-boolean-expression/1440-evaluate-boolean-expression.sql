/* Write your T-SQL query statement below */



SELECT e.left_operand
	,e.operator
	,e.right_operand
	,CASE 
		WHEN e.operator = '='
			AND v.value = v2.value
			THEN 'true'
		WHEN e.operator = '>'
			AND v.value > v2.value
			THEN 'true'
		WHEN e.operator = '<'
			AND v.value < v2.value
			THEN 'true'
		ELSE 'false'
		END AS value
FROM expressions e
JOIN variables v ON e.left_operand = v.name
JOIN variables v2 ON e.right_operand = v2.name