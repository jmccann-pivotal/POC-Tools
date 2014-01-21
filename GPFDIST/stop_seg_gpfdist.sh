:
#
#	stop running gpfdists on ETL servers
#

# change as appropriate for your environment
SEG=/home/gpadmin/hostfile_segments


gpssh -f $SEG 'pkill gpfdist'

gpssh -f $SEG 'ps -ef | grep gpfdist'

exit 0

