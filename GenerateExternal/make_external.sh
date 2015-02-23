:
#
#	script to generate the external table definitions
#

if [ $# -ne 2 ];
then
	echo "Syntax:  $0 <database name> <schema name>"
fi

DB=$1
SCHEMA=$2

# change these as needed 

# external table schema name
EXTSCHEMA="ext"

# error table schema name
ERRSCHEMA="err"

#raw data file extension
EXTENSION="txt"

echo "
drop schema if exists $EXTSCHEMA cascade;
drop schema if exists $ERRSCHEMA cascade;
create schema $EXTSCHEMA;
create schema $ERRSCHEMA;
grant all on schema $EXTSCHEMA to public;
grant all on schema $ERRSCHEMA to public;
"

for t in `psql $DB -t -A -c "select table_name from information_schema.tables where table_catalog = '$DB' and table_schema = '$SCHEMA' and table_type='BASE TABLE';"`
do
	echo "-- external table for $SCHEMA.$t"
	echo ""
	echo "create external table $EXTSCHEMA.$t (like $SCHEMA.$t)"
# change if pxf 
	echo "location ('gpfdist://mdw:8082/$SCHEMA.$t.$EXTENSION')"
# change format information as needed
	echo "format 'text' (delimiter as '|' null as '' newline as 'CRLF')"
	echo "log errors into err.$t segment reject limit 100 rows;"
	echo ""
done

exit 0


