:
#
#	dbschema.sh - prints out the DDL for a schema and/or table
#

usage()
{
cat << EOF
usage: $0 options

This script will dump the DDL for a schema or individual table. 
Output should be redirected. Example:  $0 options > myDDLFile.sql

OPTIONS:
   -?                   Show this message
   -d			Database source.  Required
   -s			Schema Name. Required.
   -t			Table Name.  Optional. 
			If not used, will dump all tables in the Schema

EOF
}

debug()
{

if [[ -z ${TABLE} ]]
then
	echo "-- Producing DDL for schema $SCHEMA in database $SOURCEDB"
else
	echo "-- Producing DDL for $SCHEMA.$TABLE in database $SOURCEDB"
fi

}

# start main script

SOURCEDB=""
SCHEMA=""
TABLE=""

while getopts ":?d:?s:?t:" OPTION
do
	case $OPTION in
	d)  SOURCEDB=${OPTARG};;
	s)  SCHEMA=${OPTARG};;
	t)  TABLE=${OPTARG};;
	?)  usage
	    exit;;
	esac
done

if [[ -z ${SOURCEDB} ]] || [[ -z ${SCHEMA} ]]
then
	usage
	exit -1
fi

debug

if [[ -z ${TABLE} ]]
then

	pg_dump -s -n $SCHEMA $SOURCEDB
else
	pg_dump -s -t $SCHEMA.$TABLE $SOURCEDB
fi

exit 0

