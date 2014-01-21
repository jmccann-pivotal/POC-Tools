:
#
#	sample file for staring gpfdist
#
source /usr/local/greenplum-db/greenplum_path.sh

$GPHOME/bin/gpfdist  -d /data1/poc/data1 -p 8085 -l /home/gpadmin/bin/gpfdist.8085.log &
$GPHOME/bin/gpfdist  -d /data1/poc/data2 -p 8086 -l /home/gpadmin/bin/gpfdist.8086.log &
$GPHOME/bin/gpfdist  -d /data2/poc/data1 -p 8087 -l /home/gpadmin/bin/gpfdist.8087.log &
$GPHOME/bin/gpfdist  -d /data2/poc/data2 -p 8088 -l /home/gpadmin/bin/gpfdist.8088.log &

exit 0

