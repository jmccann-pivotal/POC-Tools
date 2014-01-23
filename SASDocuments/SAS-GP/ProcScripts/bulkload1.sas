
ods graphics off;
ods html close;
ods listing;

libname t1 '/tmp/t2.dat'
libname mygpdb greenplm server=mdw port=5432 database=jimwork  user=gpadmin password=changeme schema=sandbox;

proc append base=mygpdb.t2
( BULKLOAD=YES
  BL_DATAFILE='/tmp/t2.dat'
  BL_PROTOCOL=gpfdist
  BL_USE_PIPE=YES
  BL_HOST='etl3'
  BL_PORT=8081
  BL_DELIMITER='|'
  BL_DELETE_DATAFILE=NO
)
data=t1
;

run;

libname mygpdb clear;

