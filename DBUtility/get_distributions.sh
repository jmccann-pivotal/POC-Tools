:
#
#	list distribution policies for a table
#

if [ $# -ne 2 ]
then
	echo "Syntax: $0 <database> <schema.tablename>"
	exit -0
fi

psql $1 <<_SQL
with x as
(select unnest(a.attrnums) as s, a.localoid
from gp_distribution_policy a where a.localoid = '$2'::regclass)
select  x.localoid::regclass as table,
x.s as column_order, b.attname as distribution_column 
from x,
pg_attribute b
where s is not null 
and x.localoid = b.attrelid
and x.s = b.attnum
and x.localoid = '$2'::regclass
order by 2;

_SQL

exit 0

