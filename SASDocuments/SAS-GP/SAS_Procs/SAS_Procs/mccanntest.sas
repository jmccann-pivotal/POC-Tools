proc sql;
connect to greenplm as mydb (dsn=greenplum user=gpadmin password=changeme);
execute (select count(*) from t2) by mydb;
disconnect from mydb;
quit;
