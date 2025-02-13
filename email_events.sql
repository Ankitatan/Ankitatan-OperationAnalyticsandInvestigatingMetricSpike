-- case study 2 Investigating Metric Spike
-- Show databases;
use jd;
drop table email_events;
-- -----------------------------------------------

create table email_events(
 user_id int,
 occurred_at varchar(100),
 action varchar(50),
 user_type int);

select * from email_events;
SHOW VARIABLES LIKE 'SECURE_FILE_PRIV';
select @@secure_file_priv;
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/email_events.csv"
into table email_events
fields terminated by ','
enclosed by '"' 
lines terminated by '\n' 
ignore 1 rows;
select * from email_events;
ALTER TABLE email_events add column temp_occurred_at datetime;
set sql_safe_updates=0;
update events set temp_occurred_at = str_to_date(occurred_at,'%d-%M-%Y, %H:%i');

Alter table email_events drop column occurred_at;
alter table email_events change column temp_occurred_at occurred_at DATETIME;




