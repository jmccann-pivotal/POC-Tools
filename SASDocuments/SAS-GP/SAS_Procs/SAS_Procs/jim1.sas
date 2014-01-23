
proc sql; 
connect to greenplm as mydb (dsn=jimwork user=gpadmin password=changeme);
%PUT &sqlxmsg;

select uid, uname  from connection to mydb(
select uid, uname  from sandbox.dummy);

%PUT &sqlxmsg;

disconnect from mydb;
quit;
