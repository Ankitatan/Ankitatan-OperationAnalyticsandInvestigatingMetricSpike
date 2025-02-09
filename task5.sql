-- case 2 task 5
-- Write an SQL query to calculate the email engagement metrics.

select * from email_events; 
select count(distinct user_id), 
count(distinct (action)) as act 
from email_events;

