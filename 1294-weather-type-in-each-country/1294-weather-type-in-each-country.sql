/* Write your T-SQL query statement below */


WITH CTE_AVG_CAL AS (

SELECT 
    country_id,AVG(weather_state*1.00) as avg_weather_state
    FROM Weather
    WHERE day>='2019-11-01'  AND day<='2019-11-30'
    GROUP BY country_id
)
SELECT 
C.country_name,
CASE WHEN avg_weather_state<=15 THEN 'Cold'
    WHEN avg_weather_state>=25 THEN 'Hot'
    ELSE 'Warm' END as weather_type
FROM CTE_AVG_CAL CC JOIN Countries C 
ON CC.country_id=C.country_id