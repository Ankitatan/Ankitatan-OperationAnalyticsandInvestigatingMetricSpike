-- case study 2 Investigating Metric Spike
-- Show databases;
use jd;
drop table eventstbl;
-- -----------------------------------------------

create table eventstbl(
 user_id int,
 occurred_at varchar(100),
 event_type varchar(50),
 event_name varchar(100),
 location varchar(50),
 device varchar(50),
 user_type int
 );

select * from eventstbl;

SHOW VARIABLES LIKE 'SECURE_FILE_PRIV';
select @@secure_file_priv;
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/events.csv"
into table eventstbl
fields terminated by ','
enclosed by '"' 
lines terminated by '\n' 
ignore 1 rows;

select * from eventstbl;
desc eventstbl;
ALTER TABLE eventstbl drop column temp_occurred_at ;
set sql_safe_updates=0;
show variables like 'sql_safe_updates';
update eventstbl set temp_occurred_at = STR_TO_DATE(occurred_at,'%d-%M-%Y %H:%i');
set sql_safe_updates=1;
Alter table eventstbl drop column occurred_at;
alter table eventstbl change column temp_occurred_at occurred_at DATETIME;




