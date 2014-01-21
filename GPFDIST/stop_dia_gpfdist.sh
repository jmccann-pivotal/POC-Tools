:
#
#	stop running gpfdists on ETL servers
#

# change as appropriate for your environment
DIA=/home/gpadmin/hostfile_dia

gpssh -f $DIA 'pkill gpfdist'

gpssh -f $DIA 'ps -ef | grep gpfdist'

exit 0

