/*
	txt2csv - converts gpfdist TEXT file to CSV format
	All columns quoted, including embedded newline columns
	
	Reads stdin and prints to stdout.  Input should be piped in
	and output redirected.
	
	Takes two arguments - number of delimiters to look for and
	the delimiter character to look for.
	If a table has 25 columns, there will be 24 delimiters in the 
	text file.   Example:

	cat loadfile1.txt | ./txt2csv 24 '|' > loadfile1.csv 

	Author:	Jim McCann, GreenPlum

	Build:  cc txt2csv.c -o txt2csv

	Date: 11/14/2012

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int numberOfDelimiters=0;

int delimitersFound=0;

int firstDelimiter=0;

char delim;

main(int argc, char *argv[])
{

	char c;
	if (argc < 3)
	{
		printf("Syntax: %s <number of delimiters> <column delimiter character>\n", argv[0]);
		exit(1);
	}
	
	sscanf(argv[1],"%d", &numberOfDelimiters);
	sscanf(argv[2],"%c", &delim);

	while((c=getchar())!=EOF)
	{
		if ( delimitersFound == 0 && firstDelimiter == 0)
		{
			putchar('"');
			firstDelimiter = 1;
		}
		if ( c == delim )
		{
			printf("\"%c\"", delim);
			delimitersFound+=1;
			continue;
		}
		switch(c)
		{

/* if we find a double quote embedded, change to single quote */

		case '"':
			putchar('\'');
			break;
		case '\r':
		case '\n':
		if (delimitersFound == numberOfDelimiters) 
		{

			printf("%c\n",'"');
			delimitersFound=0;
			firstDelimiter=0;
		}
		else
		{
			putchar('\n');
		}
		break;	
		default:
			putchar(c);
			break;
		}
	}
		
}

