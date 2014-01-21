-- To Run:  psql <your database> -f size_schema_tb.sql
--
--  prints out total size per schema in the database

select schemaname ,round(sum(pg_total_relation_size(schemaname||'.'||tablename))/1024/1024/1024) "Size_TB" 
from pg_tables  group by 1;

