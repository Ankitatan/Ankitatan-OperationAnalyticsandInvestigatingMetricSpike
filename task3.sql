-- case 2 task 3
-- Write an SQL query to calculate the weekly retention of users based on their sign-up cohort.
SELECT 
    EXTRACT(WEEK FROM occurred_at) AS week,
    EXTRACT(YEAR FROM occurred_at) AS year,
    device,
    COUNT(DISTINCT user_id) AS count
FROM     eventstbl
WHERE     event_type = 'engagement'
GROUP BY     week, year, device
ORDER BY     week, year, device;

