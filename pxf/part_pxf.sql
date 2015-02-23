--

drop external table if exists ext.part;

create external table ext.part (like part)
location('pxf://pivhdsne.localdomain:50070/tpch/part/part*?Profile=HdfsTextSimple')
format 'TEXT' (delimiter as ',' null as '')
log errors into err.part segment reject limit 100 rows;

analyze ext.part;

