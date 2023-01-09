/* Write your T-SQL query statement below */



SELECT DISTINCT session_id FROM Playback
EXCEPT
SELECT DISTINCT session_id FROM Playback P,Ads A 
WHERE P.customer_id=A.customer_id
AND A.timestamp>=start_time AND A.timestamp<=end_time