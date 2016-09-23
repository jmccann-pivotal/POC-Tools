:
#
#  Description:   restores a database 1 segment at a time from an existing gpcrondump.
#                 Used when the backup was made with a segment count not consistent
#                 With the system you are restoring to.   Follows the procdedure in 
#                 GPDB Administrator's Guide for "Restoring To A Different Configuration"
#
#  assumes that if you are using an NFS mount, the backups are compressed.
#
#  Parameters:
#
#  Database - target database to restore to 
#  Schema   - the schema we are restoring.  Used by dbanalyze at the end
#  TimeStamp - the timestamp of the backups we are restoring from.   May be multiple timestamps
#              in one db_dumps/<data> directory - allows you to get the correct one.
#
#


if [ $# -ne 3 ]
then
        echo "Syntax: $0 <database> <schema> <timestamp>"
        exit -1
fi

# assumes you have created the database before running this
#createdb backuptest

DB=$1
SCHEMA=$2
TS=$3


# modify this to point to the correct backup directory

BACKUPDIR="/dd/GPDB/rs-gpuat/20160922/"

# move to that directory - makes it easier to parse file names

cd $BACKUPDIR

echo "Start Manual Restore of $DB schema $SCHEMA: `date`"
echo ""


# build the schema

zcat gp_dump_1_1_${TS} | psql $DB -e

# get the segment file list and order them

for t in `ls gp_dump_0_*_${TS}.gz | awk ' {split($0,a,"_"); print a[4]; }'| sort -g`
do
        zcat gp_dump_0_${t}_${TS} | psql -d $DB -e
done

# load any post data objects

zcat gp_dump_1_1_${TS}_post_data | psql -d $DB -e

# load any sequences and set search path

zcat gp_dump_1_1_${TS} | egrep "SET search_path|SELECT pg_catalog.setval" > path_and_seq.sql

psql $DB -f ./path_and_seq.sql

echo "End Manual Restore of $DB schema $SCHEMA: `date`"

echo ""

echo "Start analyzedb on newly restored schema $SCHEMA"

echo ""
# analyze database

analyzedb -d $DB -s $SCHEMA -a

exit 0

