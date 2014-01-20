/*
	Description:

	remove_breaks.c - removes all linefeeds/CTRL-M characters between
	the delimiter passed in and replaces them with spaces.  Useful for
	text formatted data files before loading.

	Typical usage would be to cat a data file, pipe it to this program,
	and redirect the output to a new data file.

	Example:  cat file1.txt | ./remove_breaks 12 '|' > file2.txt

	Arguments:

	number of delimiters to read per row
	delimiter character to look for

	Build:  cc remove_breaks.c -o remove_breaks

	Author: Jim McCann, GreenPlum

	Date: 11/14/2012
*/


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int delimitersFound = 0;
int numberOfDelimiters = 0;
char delim;


main(int argc, char *argv[])
{
        char c;
	if (argc !=  3)
	{
		
		printf("\n\nSyntax: %s <number of delimters> <column delimiter character>\n", 
			argv[0]);
		printf("\n%s removes all newline/ctrl-M characters between delimiters\nand replaces them with spaces.  It does not remove the end of record\nnewline.\n", argv[0]);
		printf("\nExample: %s 5 '|'\n\n",argv[0]);
		printf("To pass in a control character, put it in single quotes\n");
		printf("Use CTRL-V CTRL-<your character> to put the control character in.\n");
		printf("%s 10 '^A'\n", argv[0]);
		printf("Standard usage would be:\n cat <file> | ./remove_breaks 10 '|' > outputfile.txt\n\n");
		exit(-1);
	}

	sscanf(argv[1],"%d", &numberOfDelimiters);
	sscanf(argv[2],"%c", &delim); 

	while ((c=getchar()) != EOF)
 	{
		if (c == delim)
		{
			putchar(delim);
                        delimitersFound+=1;
                        continue;
		}
		
                switch(c)
                {
                case '\r':
                case '\n':
                if (delimitersFound == numberOfDelimiters)
                {

			putchar('\n');
                	delimitersFound=0;
                }
                else
                {
			putchar(' ');
                }
                break;
                default:
			putchar(c);
                        break;
                }
        }

}



