:
#
#	script to install madlib in a local database
#
#	download madlib installer from madlib.net
#	as gpadmin, run this script - make sure GP path is set up
#

if [ $# -ne 1 ]
then
	echo "Syntax: $0 <database name>"
	exit -1
fi

/usr/local/madlib/bin/madpack -p greenplum -c gpadmin@localhost/$1 install


