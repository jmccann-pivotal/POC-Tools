:
#
#	This script installs the oracle functions in the database
#	given on the command line.
#

if [ $# -ne 1 ]
then
	echo "Syntax: $0 <database to install oracle functions in>"
	exit -1
fi

DB=$1

echo "Installing Oracle functions in database $DB"

psql -e -d $DB < /usr/local/greenplum-db/share/postgresql/contrib/orafunc.sql > install_orafuncs.err 2>&1

echo "Oracle functions installed in $DB"

exit 0

