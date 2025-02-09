-- case 2 task 2
-- Write an SQL query to calculate the user growth for the product.
with weekly_active_users as(
	select 
		Extract(year from created_at) as year_n,
        Extract(week from created_at) as week_n,
        count(distinct user_id) as no_of_users
	from users
    group by year_n, week_n
)
select year_n, week_n, no_of_users,
	sum(no_of_users)
    OVER (order by year_n, week_n) 
    AS cusers
from weekly_active_users
order by year_n, week_n;

