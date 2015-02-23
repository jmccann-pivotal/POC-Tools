#!/usr/bin/env python

#
#	gpxmloutput.py - generate xml output for all records in a table
#

import sys, os, stat
import exceptions

from optparse import OptionParser
from datetime import datetime

import subprocess as SB

def main(argv):

# setup command line parser options

        usage="usage: %prog [options]"
        parser=OptionParser(usage=usage,version="%prog1.0")
# tell it what the options should be
        parser.add_option('-d','--database', action='store', dest='theDB',
		help='database to connect to', default='')
        parser.add_option('-t','--table', action='store', dest='theTable',
                help='table to export in XML in form of schema.tablename',
		default='')

        if (len(sys.argv) < 3):
                parser.print_help()
                sys.exit(0)

	# parse the options
        (opts,args) = parser.parse_args()
	
	if (opts.theDB == ''):
		print 'No source database specified.'
		sys.exit(-1)

	if (opts.theTable == ''):
		print 'No source table specified.'
		sys.exit(-1)

	outFileName="./"+opts.theTable+".xml"

	print "Generating XML for table " + opts.theTable + " from database " + opts.theDB + " to file " + outFileName


	try:
		outFile	= open(outFileName,'w')
	except Exception as x:
		print "Unable to open "+outFileName
		print "Exiting...."
		sys.exit(-1)

	outFile.write("<?xml version=\"1.0\" ?>\n")
	outFile.write("<"+ opts.theTable+">\n")
	
	row_count = 1

	first_time = True

	cmd='select * from '+ opts.theTable

	try:
		f = SB.Popen(['psql','-d', opts.theDB,'-x', '-c', cmd],stdout=SB.PIPE)

		for l in f.stdout:
			if l[0] == '-':
				if first_time == True:
					outFile.write("    <Record>\n")
					first_time = False
					continue
				outFile.write("    </Record>\n")
				outFile.write("    <Record>\n")
				row_count += 1
				continue
			row = l.split('|')
			outFile.write("        <" + row[0].strip() + ">" + row[1].strip() + "</" + row[0].strip() + ">\n")

	
	except Exception as e:
#		f.close()
#		print e
		outFile.write("    </Record>\n")

	outFile.write("</" + opts.theTable + ">\n")
	outFile.close()

	print row_count," rows processed from table ", opts.theTable 

	sys.exit(0)

if __name__ == "__main__":
        main(sys.argv[1:])

