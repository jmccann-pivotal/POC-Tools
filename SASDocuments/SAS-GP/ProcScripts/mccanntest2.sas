proc sql;
connect to greenplm as mydb (dsn=greenplum user=gpadmin password=changeme);
execute (select * from t2 limit 3) by mydb;
disconnect from mydb;
quit;
