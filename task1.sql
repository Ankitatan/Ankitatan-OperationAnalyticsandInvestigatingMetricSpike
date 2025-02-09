-- case 2 task 1 
-- Write an SQL query to calculate the weekly user engagement.
use jd;
SELECT
-- Extract(
occurred_at as week_num,
count(distinct user_id) as active_user
from eventstbl where
event_type = 'engagement'
group by week_num order by week_num;

