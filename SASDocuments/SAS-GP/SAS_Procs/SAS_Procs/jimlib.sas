ods graphics off;
ods html close;
ods listing;


proc sql;
select * from jimlib.dummy;

quit;


