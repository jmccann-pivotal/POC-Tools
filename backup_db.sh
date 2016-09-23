:
#
#	backup a database.  Simple database backup script.
#

if [ $# -ne 1 ]
then
	echo "Syntax:  $0 <database name>"
	exit -1
fi

DB=$1

# modify to your backup directory location
BACKUP_DIR=/xdrive/db_dumps/$DB

gpcrondump -x $DB -u $BACKUP_DIR -G -a

exit 0

