#!/usr/bin/env python

#
#	Program:	build_gpinit.py
#	Author:		Jim McCann
#	Date:		01/28/2015
#	Description:	Used to build gpinitsystem file with different
#			numbers of worker nodes
#	Parameters:
#	
#	-d, --datadirs	number of /data directories on each segment host 
#			default 4
#	-n  --dirname   base name of data directory 
#			default /data
#	-s, --segments	number of primary segments to create on each server
#			default 4
#	-a, --arrayname	Cluster/Array name to use 
#			default is GreenplumCluster
#	-m, --master	master host name. 
#			default mdw
#	-c, --config    use config file true/false
#			if this flag is in the command line, all other
#			parameters are ignored and parameters are read
#			from build_gpinit.config
#
#	Syntax:
#
#	./build_gpinit.py  or ./build_gpinit.py -h  prints the help screen
#
#	./build_gpinit.py -d 2 -s 3 -a 'MyGPDB' produces a file called
#	gpinitsystem_config_6 which will have 3 primary and 3 mirror segments
#	across /data1 and /data2
#
#	./build_gpinit.py -d 4  -s 4  -m 'clustermaster' produces a file called
#	gpinitsystem_config_16 which will have 4 primary and 4 mirror segments
#	across /data1, /data2, /data3, and /data4.  The master host will
#	be referenced as clustermaster instead of mdw.
#
#	./build_gpinit.py -c
#	reads build_gpinit.config and uses those parameters
#

import sys, os, stat
import exceptions
from datetime import datetime
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
    except:
        print "Unable to open ", fname;
        return dict;

    for line in file:

	if line.startswith('#'):
		continue
	k,v = line.strip().split(':')
        dict[k.strip()] = v.strip()

#    print dict.items();
#    print dict.keys();
#    print dict.values();

    file.close();

    return dict

# set up the command line argument
def setOptions():

# setup command line parser options
        usage="usage: %prog [options]"
        parser=OptionParser(usage=usage,version="%prog1.0")
# tell it what the options should be
        parser.add_option('-d','--datadirs', action='store', dest='numDataDirs',
		help='number of /data directories on the system, default 4', default='4')
        parser.add_option('-n','--dirname', action='store', dest='dirName',
		help='base name of location where data is stored, default /data', default='/data')
        parser.add_option('-s','--segments', action='store', dest='numSegments',
                help='number of primary segments per server, mirrors will match.  default 4', default='4')
        parser.add_option('-a','--arrayname', action='store', dest='arrayName',
                help='Name of the cluster/array default is \'GreenplumCluster\'', default='GreenplumCluster')
        parser.add_option('-m','--master', action='store', dest='masterName',
                help='Name of the master host default is \'mdw\' ', default='mdw')
        parser.add_option('-c','--config', action='store_true', dest='configFile',
                help='if set, uses build_gpinit.config for these parameters', 
		default=False)

	return (parser)

# build the primary and mirror data lists

def dataList(dirs,segs,type):

	segment_count = int(segs)

#	print dirs
#	print "number of segs = " + segs

	if type == 'primary':
		typedir = 'DATA_DIRECTORY'
	else:
		typedir = 'MIRROR_DATA_DIRECTORY'

	declare = "declare -a "+ typedir + "=("

	for lst in dirs:
		for i in range(segment_count):
			declare = declare+lst+"/"+type+" "
	declare = declare + ")"

	return declare

# read the default GPDB gpinitsystem template and output the
# modified gpinitsystem file

def buildFile(gppath,directories,segments,arrayName, masterName):

	segment_count = int(segments)
	dir_count = len(directories)

	initfilepath = gppath+'/docs/cli_help/gpconfigs/gpinitsystem_config'

	outfile_name = "gpinitsystem_config_"+str(segment_count * dir_count)

	print_stderr("Output file name: " + outfile_name)

	try:
		infile = open(initfilepath,'r')
	except Exception, e:
		print "Unable to open " + initfilepath
		print e
		return

	try:
		outfile = open(outfile_name, 'w')
	except Exception,e:
		print "Unable to open file for writing: " + outfile_name
		print e
		infile.close()
		return

	for line in infile:

# put in our file name for future reference

		if line.startswith('# FILE NAME:'):
			outfile.write('# FILE NAME: '+ outfile_name + '\n')
			continue
	
# put in the array/cluster name
		if line.startswith('ARRAY_NAME'):
			outfile.write('ARRAY_NAME="'+arrayName+'"\n')
			continue
# put in the master host name
		if line.startswith('MASTER_HOSTNAME'):
			outfile.write('MASTER_HOSTNAME=' + masterName+'\n')
			continue
# build the segment list for the primary segments
		if line.startswith('declare -a DATA_DIRECTORY'):
			outfile.write(dataList(directories,segments,'primary')+'\n')
			continue
# build the segment list for the mirror segments
		if line.startswith('#declare -a MIRROR_DATA_DIRECTORY'):
			outfile.write(dataList(directories,segments,'mirror')+'\n')
			continue
# fix the mirror attributes
		if line.startswith('#MIRROR_'):
			outfile.write(line.replace('#','')+'\n')
			continue

		if line.startswith('#REPLICATION_PORT_BASE'):
			outfile.write(line.replace('#','')+'\n')
			continue

		outfile.write(line)

	infile.close()
	outfile.close()


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
		configFileName = 'build_gpinit.config'
		data = {}
		data = readConfigFile(configFileName)
		if is_empty(data):
			print_stderr("Unable to open configuration file.")
			sys.exit(-1)
		opts.numDataDirs = data['NUMBER_DATA_DIRECTORIES']
		opts.dirName = data['DATA_DIRECTORY_ROOT_NAME']
		opts.numSegments = data['NUMBER_PRIMARY_SEGMENTS']
		opts.arrayName = data['ARRAYNAME']
		opts.masterName = data['MASTER_HOST']
		

 	print_stderr( "Number of data directories = "+opts.numDataDirs)
	print_stderr( "Data directory root name = "+ opts.dirName)
	print_stderr( "Number of primary segments = "+opts.numSegments)
	print_stderr( "Array Name = "+ opts.arrayName)
	print_stderr( "Master Host = "+opts.masterName)
	print_stderr( "Config File = "+str(opts.configFile))


	dirlist = []

	for i in range(int(opts.numDataDirs)):
		dirlist.append(opts.dirName+str(i+1))

#	print dirlist

# check to make sure we can get to the $GPHOME directory

	gppath = os.getenv('GPHOME')

	if gppath == None:
		print_stderr("Unable to locate $GPHOME directory.  Are you logged in as gpadmin?")
		sys.exit(-1)

	buildFile(gppath, dirlist, opts.numSegments,opts.arrayName, opts.masterName)

	sys.exit(0)

if __name__ == "__main__":
        main(sys.argv[1:])

