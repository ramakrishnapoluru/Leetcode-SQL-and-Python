/* Write your T-SQL query statement below */



SELECT CONCAT (
		DATENAME(weekday, day)
		,', '
		,DATENAME(month, day)
		,' '
		,DATEPART(day, day)
		,', '
		,DATEPART(year, day)
		) as day
FROM Days