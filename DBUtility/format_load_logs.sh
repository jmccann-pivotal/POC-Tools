:
#
#	Format output from gpfdist loads into CSV file
#
#	Output tends to follow the form:
#
#	insert into <table> select * from external.<table>
#	INSERT 0 <rows inserted>
#	Time: XXXX.XX ms  
#
#	Assumes you have a script that loads multiple tables like:
#
#	insert into table x select * from extern_x;
#	insert into table y select * from extern_y;
#
#	And have run it like:
#
#	psql -e -d mydb < load_file.sql > load_file.log 2>&1
#

# clear screen and get log file extension

clear
echo "
Enter log file extension (txt, log, sql.log, LOG, etc.)
Do not put in a leading period: "
read f_extension

# set the year for use in finding the start/end time
# assumes this is being done in the current year

DT="`date +"%Y"`-"

OUTFILE=""

for f in `ls *.$f_extension`
do
	echo "Working on $f"
	OUTFILE=`basename $f ".$f_extension"`.CSV
	echo "Output File: $OUTFILE"
#
# uncomment this line to test output to screen
#	cat $f | 
#

# use awk to parse the file
# variables:
# TM - time column
# TBL - table name
# RECS - record count
# CTRL - 0 if just starting a new group, 1 if in group
# STRT_TM - start time
# END_TM - end time
# HAVE_START - 0 if we have not read any time yet, 1 if we read the start time
# YR - passed in as year to look for in time search
#

awk -v YR=$DT ' 
BEGIN { FS=" "; TBL=""; TM=0; RECS=0;CTRL=0; STRT_TM=""; END_TM=""; HAVE_START=0;}
{
#  look for all lines starting with year - get start/end time on next line
#  note that year is set by date command - may need to be changed if year changes

if ($0 ~ YR)
{
        if (HAVE_START==0)
        {
                STRT_TM=$0;
                HAVE_START=1;
        }
        else
        {
                END_TM=$0;
                HAVE_START=0;
        }
}
# if we find the first insert and the CTRL variable is 0, new set of records
        if ($1 == "insert" && CTRL==0) 
        {
                TBL=$3;
                CTRL=1;
                next;
        }

# if we find an ERROR after the insert start looking for next record

	if (CTRL==1 && $1 == "ERROR:")
	{
		RECS=0;
                printf("%s,%d,0.0\n", TBL, RECS);
		CTRL=0;
		next;
	}
# if CTRL==1, and we find INSERT, we have second line
        if ($1 == "INSERT" && CTRL==1) 
        {
                RECS=$3;
                next;
        }
# if CTRL==1 and we find Time, we are on last record in set
# print out results and reset CTRL to 0
        if ($1 == "Time:" && CTRL==1) 
        {
                TM=$2;
                printf("%s,%d,%.3f\n", TBL, RECS, TM);
                CTRL=0;
                next;
        }
}
END { printf("Start,%s\nEnd,%s\n", STRT_TM, END_TM); }
' < $f > $OUTFILE


done

exit 0

