/* Write your T-SQL query statement below */



WITH CTE_Flights
AS (
	SELECT airport_id
		,Rank() over(order by sum(flights_count) desc)  flights_rank from (
			SELECT departure_airport AS airport_id
				,SUM(flights_count) flights_count
			FROM Flights
			GROUP BY departure_airport
			UNION ALL
			
			SELECT arrival_airport
				,SUM(flights_count) flights_count
			FROM Flights
            GROUP BY arrival_airport
			) AS A
	GROUP BY airport_id
	)
SELECT airport_id
FROM CTE_Flights where flights_rank=1