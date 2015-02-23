:

#
#	shell script to build greenplum database directories on 
#	master, standby master, and segment hosts
#

getHostFile()
{

	echo "Enter segment host file name to use with full path"
	echo "Default is ~gpadmin/gpconfigs/hostfile_gpssh_seghosts"
	echo "Enter hostfile path and name:"

	read hostfile

	if [ -z "$hostfile" ]
	then
		hostfile="~gpadmin/gpconfigs/hostfile_gpssh_seghosts"
	fi

}

getDataDir()
{
	echo "Enter the base directory name of the data directory"
	echo "Default is /data"
	echo "Enter directory: "

	read datadir

	if [ -z "$datadir" ]
	then
		datadir="/data"
	fi
}

getNumberOfDataDirs()
{
	echo "Enter the number of data directories per host"
	echo "Default is 2"
	echo "Enter number of data directories: "

	read nbrdatadirs

	if [ -z "$nbrdatadirs" ]
	then
		nbrdatadirs="2"
	fi
}

#### MAIN  #####

# insure we are root user before running this

#if [ $EUID != 0 ]
#then
#	echo "Must be root superuser to run this program"
#	exit -1
#fi

hostfile=""
datadir=""
nbrdatadirs=""
envfile="/usr/local/greenplum-db/greenplum_path.sh"

getHostFile hostfile

getDataDir datadir

getNumberOfDataDirs nbrdatadirs

#echo ""
#echo "Hostfile: $hostfile"
#echo "Base Data Directory Name is: $datadir"
#echo "Number of data directories per segment host is: $nbrdatadirs"

# source the greenplum path environment so we can use gpssh

source $envfile

for i in $(seq 1 $nbrdatadirs);
do
	echo "gpssh -f $hostfile 'mkdir $datadir$i/primary'"
	echo "gpssh -f $hostfile 'chown gpadmin:gpadmin $datadir$i/primary'"
	echo "gpssh -f $hostfile 'mkdir $datadir$i/mirror'"
	echo "gpssh -f $hostfile 'chown gpadmin:gpadmin $datadir$i/mirror'"
done

exit 0

