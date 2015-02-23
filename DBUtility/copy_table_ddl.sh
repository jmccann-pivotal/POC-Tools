:
#
#	copies table DDL from one database to another
#
if [ $# -ne 3 ]
then
	echo "Syntax: $0 <source db> <target_db> <source schema.table>"
	exit -1
fi

pg_dump -s -t $3 $1 | psql -d $2

exit 0

