--

create external table ext.region (like region)
location('pxf://pivhdsne.localdomain:50070/tpch/region/part*?Profile=HdfsTextSimple')
format 'TEXT' (delimiter as ',' null as '')
log errors into err.region segment reject limit 5 rows;
