ods graphics off;
ods html close;
ods listing;

libname mygpdb greenplm dsn=jimwork user=gpadmin password=changeme schema=sandbox;

*proc print data=mygpdb.dummy;

proc sql;

	select count(*) from mygpdb.dummy;

quit;

libname mygpdb CLEAR;



