#!/bin/bash
#
#	script to vacuum analyze catalog tables in a database
#

if [ $# -ne 1 ]
then
	echo "Syntax: $0 <database name>"
	exit -1
fi
DBNAME=$1
VCOMMAND="VACUUM ANALYZE"
psql -tc "select '$VCOMMAND' || ' pg_catalog.' || relname || ';' from pg_class a,pg_namespace b where a.relnamespace=b.oid and b.nspname= 'pg_catalog' and a.relkind='r'" $DBNAME | psql -a $DBNAME

exit 0

