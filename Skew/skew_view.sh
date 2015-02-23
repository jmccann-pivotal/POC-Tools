:
#
#	From Jon Roberts
#

if [ $# -ne 1 ]
then
	echo "Syntax:  $0 <database name>"
	exit -1
fi

# execute the function sql

psql $1 -f fn_view_skew.sql

psql $1 <<_SQL
SELECT fn_create_db_files();

SELECT * FROM vw_file_skew ORDER BY 3 DESC;
_SQL

exit 0
