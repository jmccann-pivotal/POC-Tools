:
#
#       This script restores a schema to a database
#
#       Syntax:  restore_schema.sh <database name> <schema_name> 
#
#       Assumes the backups are being directed to NFS mount /backup
#
 
 
 
if [ $# -ne 2 ]
then
        echo "Syntax: $0 <database name> <schema name>"
        exit -1
fi
 
DB=$1
SCHEMA=$2
 
# modify as needed to set your full path
BACKUP_DIR="/backup/$SCHEMA"
 
echo "Backup dates in $BACKUP_DIR"
echo ""
 
for d in `ls $BACKUP_DIR/db_dumps`
do
        echo $d
done
 
echo "Enter the date you want to restore in format YYYYMMDD:"
 
read d
 
psql -d $1 -e -c "drop schema if exists $2 cascade;"
 
echo "Continue? y/n"
read x
 
case $x in
        y|Y)    ;;
        *)      exit -1;;
esac
 
gpdbrestore -u $BACKUP_DIR -b $d -a --noanalyze -G
 
exit 0
~
