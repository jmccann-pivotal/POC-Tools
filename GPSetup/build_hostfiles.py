#!/usr/bin/env python

#
#	Program:	build_hostfiles.py
#	Author:		Jim McCann
#	Date:		01/28/2015
#	Modified:	02/04/2015 - added config file option
#	Description:	Used to build the hostfiles used by various
#			greenplum setup programs.
#	Parameters:
#	
#	-i, --ips	number of NIC cards per host
#			default 2
#	-n  --numsegs	number of segment hosts in the cluster
#			default 4
#	-s, --standby	standby master host
#			default smdw, use NONE if there is no standby
#	-d, --datahost	base hostname for segment hosts
#			default is sdw
#	-m, --master	master host name. 
#			default mdw
#	-e, --etl	etl base host name 
#			default none
#	-t, --etlcount	count of etl hosts in the system
#			default 0
#	-c, --config	default false.  If set true, then the file 
#			build_hostfiles.config will be used to set all these
#			parameters and no other command line options will
#			be used.
#

import sys, os, stat
import exceptions
from optparse import OptionParser

# check if a structure is empty

def is_empty(any_structure):
	if any_structure:
		return False
	else:
		return True

# print to stderr
def print_stderr(myString):
	sys.stderr.write(myString+'\n')

def readConfigFile(fname):

    dict={};

    try:
        file = open (fname, "r");
    except Exception,e:
        print "readConfigFile: Unable to open ", fname;
	print e
        return dict;

    for line in file:

        if line.startswith('#'):
                continue
        k,v = line.strip().split(':')
        dict[k.strip()] = v.strip()

# use for debug
#    print dict.items();
#    print dict.keys();
#    print dict.values();

    file.close();

    return dict





# set up the command line arguments

def setOptions():

# setup command line parser options
        usage="usage: %prog [options]"
        parser=OptionParser(usage=usage,version="%prog1.0")
# tell it what the options should be
        parser.add_option('-d','--datahost', action='store', dest='segHostBase',
		help='base host name of segment hosts, default sdw', default='sdw')
        parser.add_option('-n','--numsegs', action='store', dest='numSegments',
		help='number of segment hosts in the cluster, default 4', default='4')
        parser.add_option('-s','--standby', action='store', dest='standbyName',
                help='Standby Master host name.  default smdw', default='smdw')
        parser.add_option('-i','--ips', action='store', dest='numNICS',
                help='number of IP interconnects per segment host default 2',default='2')
        parser.add_option('-m','--master', action='store', dest='masterName',
                help='Name of the master host default is \'mdw\' ', default='mdw')
        parser.add_option('-e','--etl', action='store', dest='etlHostBase',
                help='Base name of the etl hosts default is none ', default='none')
        parser.add_option('-t','--etlcount', action='store', dest='etlCount',
                help='Number of etl hosts, default is 0', default='0')
	parser.add_option('-c','--config', action='store_true', dest='configFile',
                help='if set, uses build_hostfiles.config for these parameters',
                default=False)

	return (parser)

#
# build hostfile_gpinitsystem
# contains only segment hosts with interconnect number
#
# Parameters:  number of NICs per host, total number of segment hosts
#	       and the base host name of the segment hosts
#

def build_hostfile_gpinitsystem(nics,hostcount,basename):

	try:
		myFile = open ('hostfile_gpinitsystem', 'w')
	except Exception,e:
		print "Unable to open hostfile_gpinitsystem for writing"
		print e
		return False

	for i in range(1,int(hostcount)+1):
		for j in range(1,int(nics)+1):
			myFile.write(basename+str(i)+'-'+str(j)+'\n')

	myFile.close()
	return True

#
# build hostfile_exkeys
# contains only segment hosts with interconnect number
#
# Parameters:	number of nics per segment host, total number of segment
#		servers, base host name, and list of masters in the system
#

def build_hostfile_exkeys(nics,hostcount,basename,masterlist,etlbase,etlcount):

	try:
		myFile = open ('hostfile_exkeys', 'w')
	except Exception,e:
		print "Unable to open hostfile_exkeys for writing"
		print e
		return False

# do the master and standby first
	
	for l in masterlist:
		myFile.write(l +'\n')
		for i in range(1,int(nics)+1):
			myFile.write(l+'-'+str(i)+'\n')

# write all segment hosts
	for i in range(1,int(hostcount)+1):
			myFile.write(basename+str(i)+'\n')
			for j in range(1,int(nics)+1):
				myFile.write(basename+str(i)+'-'+str(j)+'\n')

# if we have etlhosts, include them in this file

	if etlcount > 0 and etlbase != 'none':
		for i in range(1,int(etlcount)+1):
			myFile.write(etlbase+str(i)+'\n')
			for j in range(1,int(nics)+1):
				myFile.write(etlbase+str(i)+'-'+str(j)+'\n')
	
	
	myFile.close()
	return True

#
#  build_all_hosts - builds a list of all hosts in the system for use
#		     with gpssh
#
#  Parameters:  list of master hosts, segment server host base name,
#		count of all segment hosts in the system
#

def build_all_hosts(masterlist,basename,hostcount):

	try:
		myFile = open ('hostfile_gpssh_allhosts', 'w')
	except Exception,e:
		print "Unable to open hostfile_gpssh_allhosts for writing"
		print e
		return False

# do the master and standby first
	
	for l in masterlist:
		myFile.write(l +'\n')

# write all segment hosts
	for i in range(1,int(hostcount)+1):
			myFile.write(basename+str(i)+'\n')

	myFile.close()
	return True
#
# build_seg_hosts - build a list of all segment hosts in the system for
#		    use with gpssh
#
# Parameters:  segment host base name,count of all segment hosts in the cluster
#

def build_seg_hosts(basename,hostcount):

	try:
		myFile = open ('hostfile_gpssh_seghosts', 'w')
	except Exception,e:
		print "Unable to open hostfile_gpssh_seghosts for writing"
		print e
		return False

# write all segment hosts
	for i in range(1,int(hostcount)+1):
			myFile.write(basename+str(i)+'\n')

	myFile.close()
	return True

#
# build_etl_hosts - build a list of all etl hosts in the system for
#		    use with gpssh
#
# Parameters:  etl host base name,count of all etl hosts in the cluster
#

def build_etl_hosts(basename,hostcount):

	try:
		myFile = open ('hostfile_gpssh_etlhosts', 'w')
	except Exception,e:
		print "Unable to open hostfile_gpssh_etlhosts for writing"
		print e
		return False

# write all etl hosts
	for i in range(1,int(hostcount)+1):
			myFile.write(basename+str(i)+'\n')

	myFile.close()
	return True

#
#  MAIN entry point for the program
#

def main(argv):

	parser  = setOptions()

	# parse the options
        (opts,args) = parser.parse_args()

	if (len(argv) < 1):
                print "Number of arguments: " + str(len(argv))
                parser.print_help()
                sys.exit(0)

        if opts.configFile == True:
                print_stderr("Reading paramters from config file")
                configFileName = 'build_hostfiles.config'
                data = {}
                data = readConfigFile(configFileName)
                if is_empty(data) :
                        print_stderr("Unable to open configuration file "+configFileName)
                        sys.exit(-1)
                opts.numNICS= data['NUMBER_NIC_CARDS']
                opts.segHostBase = data['DATAHOST_BASE_NAME']
                opts.numSegments = data['NUMBER_SEGMENT_HOSTS']
                opts.masterName = data['MASTER_HOST_NAME']
		opts.standbyName = data['STANDBY_HOST_NAME']
		opts.etlHostBase = data['ETLHOST_BASE_NAME']
		opts.etlCount = data['NUMBER_ETL_HOSTS']

 	print_stderr( "Number of NICs per segment host= "+opts.numNICS)
	print_stderr( "Segment host base name = "+ opts.segHostBase)
	print_stderr( "Number of segment hosts in cluster  = "+opts.numSegments)
	print_stderr( "Master Host = "+opts.masterName)
	print_stderr( "Standby Master = "+ opts.standbyName)
	print_stderr( "ETL Host Base Name= "+ opts.etlHostBase)
	print_stderr( "ETL Host Count = "+ opts.etlCount)


# check to make sure we can get to the $GPHOME directory

	gpuser  = os.getenv('USER')

	if gpuser != 'gpadmin':
		print_stderr("Must be logged in as gpadmin?")
		sys.exit(-1)

	if opts.etlHostBase.lower() != 'none' and int(opts.etlCount) == 0:
		print_stderr("ETL Host base name is "+opts.etlHostBase+" but number of ETL hosts = 0.  Nothing will be written for any ETL hosts.")

	if opts.etlHostBase.lower() == 'none' and int(opts.etlCount) > 0:
		print_stderr("No ETL Host base name  but number of ETL hosts > 0.  Nothing will be written for any ETL hosts.")

# build hostfile_gpinitsystem - just segment hosts and interconnects

	if not build_hostfile_gpinitsystem(opts.numNICS, opts.numSegments, opts.segHostBase):
		print_stderr("Unable to build gpinitsystem hostfile")

	mlist = [opts.masterName]

# check to see if there is a standby master
	if opts.standbyName.lower() != 'none':
		mlist.append(opts.standbyName)

# build a host file for all servers and interconnects for gpssh_exkeys

	if not build_hostfile_exkeys(opts.numNICS, opts.numSegments, opts.segHostBase,mlist, opts.etlHostBase,opts.etlCount):
		print_stderr("Unable to build hostfile for gpssh_exkeys")

# build a list of all hosts for gpssh in the GPDB cluster - no ETL hosts

	if not build_all_hosts(mlist,opts.segHostBase,opts.numSegments):
		print_stderr("Unable to build a host file for all GPDB hosts")

# build a list of segment hosts only for gpssh 
	if not build_seg_hosts(opts.segHostBase,opts.numSegments):
		print_stderr("Unable to build a segment server only host file")

# if we have a list of ETL hosts, build a gpssh host file for them

	if opts.etlHostBase != 'none' and int(opts.etlCount) > 0:
		if not build_etl_hosts(opts.etlHostBase,opts.etlCount):
			print_stderr("Unable to build ETL Hosts only file")

	sys.exit(0)

if __name__ == "__main__":
        main(sys.argv[1:])

