:
#
#	list distribution policies for all tables in a database/schema
#

if [ $# -ne 2 ]
then
	echo "Syntax: $0 <database> <schema>"
	exit -0
fi

STMT="select trim(table_schema) ||'.'||trim(table_name) from information_schema.tables where table_catalog = '$1' and table_schema='$2' and table_name not like '%prt%' and table_type = 'BASE TABLE' order by table_name;" 

#echo $STMT | psql -d $1 -tA

for i in `echo $STMT | psql -d $1 -tA`
do
echo "Table: $i"
psql $1 <<_SQL
with x as
(select unnest(a.attrnums) as s, a.localoid
from gp_distribution_policy a where a.localoid = '$i'::regclass)
select  
--x.localoid::regclass as table,
x.s as column_number, b.attname as distribution_column 
from x
left outer join pg_attribute b
on
x.localoid = b.attrelid
and x.s = b.attnum
and x.localoid = '$i'::regclass
where 
s is not null 
order by 2;
_SQL
done

exit 0
