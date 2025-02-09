-- case 2 task 4
-- Write an SQL query to calculate the weekly engagement per device.
select * from email_events;

select action from email_events group by action;
select distinct action from email_events;

select count(action) as count, action from email_events group by action;





SELECT 
    EXTRACT(WEEK FROM occurred_at) AS week,
    EXTRACT(YEAR FROM occurred_at) AS year,
    device,
    COUNT(DISTINCT user_id) AS count
FROM     eventstbl
WHERE     event_type = 'engagement'
GROUP BY     week, year, device
ORDER BY     week, year, device;
