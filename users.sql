-- case study 2 Investigating Metric Spike
Show databases;
use jd;
drop table users;
-- -----------------------------------------------

create table users(
 user_id int,
 created_at varchar(100),
 state varchar(100),
 activated_at varchar(100),
 company_id int,
 language varchar(100));

select * from users;

SHOW VARIABLES LIKE 'SECURE_FILE_PRIV';
select @@secure_file_priv;
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/users.csv"
into table users
fields terminated by ','
enclosed by '"' 
lines terminated by '\n' 
ignore 1 rows;
select * from users limit 5;
desc users;
ALTER TABLE users add column temp_created_at datetime;
set sql_safe_updates=0;
select created_at from users where str_to_date(created_at,'%D-%M-%Y %H:%I') is null;
delete from users where str_to_date(created_at,'%D-%M-%Y %H:%I') is null;
set sql_safe_updates=1;
Alter table users drop column created_at;
alter table users change column temp_created_at created_at DATETIME;
-- update users set temp_created_at = str_to_date(created_at,'%D-%M-%Y %H:%I');



