:
#
#	Backup a specific database schema
#

if [ $# -ne 2 ]
then
        echo "Syntax: $0 <database name> <schema name>"
        exit -1
fi
 
DB=$1
SCHEMA=$2

# customize here to your environment - this was originally for NFS backups
BACKUP_DIR="/backup/$2"

#customize LOG directory to your appropriate location
LOG_DIR=/home/gpadmin/BackupLogs
EMAIL_FILE="/home/gpadmin/BackupScripts/mail.yaml"
 
# check to make sure we have a backup directory for this schema
 
if [ ! -d $BACKUP_DIR ]
then
        echo "Directory does not exist in $BACKUP_DIR  - creating it"
        mkdir $BACKUP_DIR
        chown gpadmin:gpadmin $BACKUP_DIR
fi
 
echo "Backing up database $DB schema $SCHEMA to $BACKUP_DIR"

# options:
# -x :  database name
# -s :  schema to be backed up
# -u :  backup directory location
# -l :  log file directory 
# --email-file  :  yaml file containing layout for backup completion email
# -G :  backup global objects (users, roles, etc.)
# -r :  rollback dump files on error - not for DDBoost
# -a :  answer yes to all prompts

gpcrondump  -x $DB -s $SCHEMA -u $BACKUP_DIR -l $LOG_DIR --email-file $EMAIL_FILE -G -r -a
 
exit 0

