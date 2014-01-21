:
#
#	print database size
#

if [ $# -ne 1 ]
then
	echo "$0 <database>"
	exit -1
fi

psql $1 <<_SQL
select pg_size_pretty(pg_database_size('$1'));
_SQL

exit 0
