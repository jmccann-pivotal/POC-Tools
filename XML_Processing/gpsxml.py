#!/usr/bin/env python

#
# Greenplum Simple XML parser
#
# Reads an XML file and generates pipe delimited output
#

import sys, os, stat
import exceptions
from datetime import datetime
from optparse import OptionParser
from datetime import datetime

try:
	import xml.etree.cElementTree as ET
#	print "Using cElementTree"
except:
	import xml.etree.ElementTree as ET
#	print "Using ElementTree"

def main(argv):

# setup command line parser options

        usage="usage: %prog [options]"
        parser=OptionParser(usage=usage,version="%prog1.0")
# tell it what the options should be
        parser.add_option('-f','--file', action='store', dest='theFile',
		help='XML file to read', default='')
        parser.add_option('-r','--record', action='store', dest='theRecord',
                help='Record tag within XML', default='')

        if (len(sys.argv) < 2):
                parser.print_help()
                sys.exit(-1)

	# parse the options
        (opts,args) = parser.parse_args()
	
	if (opts.theFile == ''):
		print 'No XML file specified.'
		sys.exit(-1)
	
	if (opts.theRecord == ''):
		print 'No XML record delimiter tag specified'
		sys.exit(-1)

	try:
		f = open(opts.theFile, 'r')
	except:
		print "Unable to open XML file "+opts.theFile
		sys.exit(-1)

	lst=[]	

	grp = False

# make sure no spaces print around the elements
	sys.stdout.softspace=0

	for (event,elem) in ET.iterparse(f,('start','end')):
		if event=='start' and elem.tag==opts.theRecord:
			grp = True
			continue
		if event=='end' and elem.tag==opts.theRecord:	
			x = range(len(lst))
			y = len(lst) - 1
			for i in x:
				sys.stdout.write(lst[i])
				if i < y:
					sys.stdout.write('|')
				else:
					print ""
			elem.clear()
			lst=[]
			grp = False
			continue
		if event=='end' and grp == True:
			lst.append(elem.text)
			

	f.close()
	
	sys.exit(0)

if __name__ == "__main__":
        main(sys.argv[1:])

