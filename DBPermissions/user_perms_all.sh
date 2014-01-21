:
#
#	Script to grant all permissions on a database schema objects to 
#	a user/
#

if [ $# -ne 3 ]
then
	echo "Syntax: $0 <database> <schema> <user>"
	exit -1
fi

LOGFILE="./perms_$1_$2_$3.log"

psql -t -q -d $1 -c "select 'grant all on schema ' || ('$2') || ' to ' || ('$3') || ';'" | psql -e -t -q -d $1 > $LOGFILE 2>&1

psql -t -q -d $1 -c "select 'grant all on ' || table_schema || '.' ||table_name || ' to ' || ('$3') || ';' from information_schema.tables where table_catalog = ('$1') and table_schema = ('$2');" | psql -t -q -e -d $1 >> $LOGFILE 2>&1

exit 0

