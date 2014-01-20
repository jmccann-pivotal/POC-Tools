:
#
#	skew_query.sh - show data distributions for a table
#
#	Syntax:  list_segment_skew.sh  <database name> <tablename to check>
#
#
#  check number of command line arguments
#
if [ $# -ne  2 ] 
then
	echo "Syntax:  $0  <database name> <tablename to check>"
	exit 1
fi
psql $1 <<_SQL
select gp_segment_id, count(1) from $2
group by gp_segment_id;
_SQL

exit 0
