
proc sql; 
connect to greenplm as mydb (dsn=jimwork user=gpadmin password=changeme);

select * from connection to mydb(
select *  from sandbox.dummy);

disconnect from mydb;
quit;
