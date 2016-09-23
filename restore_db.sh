:
#
#	restore a database.  Simple restore script
#

if [ $# -ne 1 ]
then
	echo "Syntax: $0 <databse to restore>"
	exit -1
fi

DB=$1

# set to location where backups are stored
BACKUP_DIR=/xdrive/db_dumps/$DB

gpdbrestore -s $DB -u $BACKUP_DIR -G -a

exit 0
