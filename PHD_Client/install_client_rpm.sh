:
#
# run yum install nc from the command line before executing this
#
# syntax: install_client_rpm.sh <version_number>
#
# where version number is something like:  3_1_0_0-175
#

if [ $# -ne 1 ]
then
	echo "Syntax: $0 <version_number>"
	echo "Version Number something like: 3_1_0_0-175"
	exit -1
fi

rpm -ivh \
utility/rpm/bigtop-jsvc-1.0.15_gphd_$1.x86_64.rpm \
utility/rpm/bigtop-utils-0.4.0_gphd_$1.noarch.rpm \
zookeeper/rpm/zookeeper-3.4.5_gphd_$1.noarch.rpm \
hadoop/rpm/hadoop-2.2.0_gphd_$1.x86_64.rpm \
hadoop/rpm/hadoop-yarn-2.2.0_gphd_$1.x86_64.rpm \
hadoop/rpm/hadoop-mapreduce-2.2.0_gphd_$1.x86_64.rpm \
hadoop/rpm/hadoop-hdfs-2.2.0_gphd_3_1_0_0-175.x86_64.rpm

exit 0

