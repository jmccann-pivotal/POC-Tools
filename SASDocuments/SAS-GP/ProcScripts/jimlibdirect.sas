ods graphics off;
ods html close;
ods listing;

libname mygpdb greenplm server='10.5.20.140' port=5432 db=jimwork schema=sandbox user=gpadmin password=changeme;

proc sql;
select uid, uname,cdata  from mygpdb.dummy;

quit;

libname mygpdb CLEAR;


