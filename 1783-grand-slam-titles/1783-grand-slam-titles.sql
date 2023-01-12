/* Write your T-SQL query statement below */


with cte as (
select wimbledon as id from championships
union all
select fr_open as id from championships
union all
select us_open as id from championships
union all
select au_open as id from championships
)
select p.player_id,p.player_name, count(*) as grand_slams_count
from Players p inner join cte on
p.player_id=cte.id
group by p.player_id,p.player_name