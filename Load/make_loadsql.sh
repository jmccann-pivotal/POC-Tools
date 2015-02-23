:
#
#	script to generate the insert select load script
#

if [ $# -ne 3 ];
then
	echo "Syntax:  $0 <database name> <internal schema name> <external schema_name>"
	exit -1
fi

DB=$1
SCHEMA=$2
EXTSCHEMA=$3

FILES_DIR="/data/trp/ExternalData"

echo "\timing on"
echo ""
echo "select 'Start Date: ' || now();"
for t in `psql $DB -t -A -c "select table_name from information_schema.tables where table_catalog = '$DB' and table_schema = '$SCHEMA' and table_type = 'BASE TABLE';"`
do
	echo "\qecho Load table $SCHEMA.$t from $EXTSCHEMA.$t"
	echo ""
	echo "truncate table $SCHEMA.$t;"
	echo "truncate table err.$t;"
	echo "insert into $SCHEMA.$t select * from $EXTSCHEMA.$t;"
	echo ""
done

echo "\timing off"
echo "select 'End Date: ' || now();"

exit 0


