if [ $# -ne 2 ]
then
echo "
Syntax:  $0 <database name> <table name>
"
exit -1
fi

psql $1 <<_SQL
select 
'$2' as "Table Name",
max(c) as "Max Seg Rows",
min(c) as "Min Seg Rows",
(max(c)-min(c))*100.0/max(c) as "Percentage Difference Between Max & Min" 
from 
(SELECT count(*) c, gp_segment_id from $2 group by 2) as a;

_SQL

exit 0



