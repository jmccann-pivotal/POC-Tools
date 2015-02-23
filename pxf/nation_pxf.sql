--

create external table ext.nation (like nation)
location('pxf://pivhdsne.localdomain:50070/tpch/nation/part*?Profile=HdfsTextSimple')
format 'TEXT' (delimiter as ',' null as '')
log errors into err.nation segment reject limit 10 rows;

analyze ext.nation;

