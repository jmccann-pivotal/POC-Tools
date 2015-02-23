--

create external table ext.customer (like customer)
location('pxf://pivhdsne.localdomain:50070/tpch/customer/part*?Profile=HdfsTextSimple')
format 'TEXT' (delimiter as '|' null as '')
log errors into err.customer segment reject limit 100 rows;

analyze ext.customer;

