/* Write your T-SQL query statement below */

with cte1 as (select count(1) accept_count 
              from (
                  select distinct requester_id, accepter_id
                  from RequestAccepted
                  ) tb1
              ),

cte2 as (select count(1) request_count
         from (
             select distinct sender_id, send_to_id
             from FriendRequest
             ) tb2
         )

select round(coalesce(cte1.accept_count * 1.0 / (case when cte2.request_count = 0 then 1 else cte2.request_count end) * 1.0, 0), 2) accept_rate
from cte1, cte2