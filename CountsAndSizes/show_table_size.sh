:
#
#	print database size
#

if [ $# -ne 2 ]
then
	echo "Syntax: $0 <database> <table to check>"
	exit -1
fi

cmd="select ('$2')|| ': ' || pg_size_pretty(pg_total_relation_size(('$2')));"

psql -t -d $1<<_SQL
${cmd}
_SQL


exit 0
