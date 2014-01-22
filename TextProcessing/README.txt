There are two programs in here for processing text files with embedded
newlines in columns that will cause problems when loaded via gpfdist.

remove_breaks.c - finds newlines in columns and converts them to spaces
txt2csv.c - puts quotes around every column so newlines can stay embedded

To build:

cc remove_breaks.c -o remove_breaks
cc txt2csv.c -o txt2csv

To use:

Each program takes two arguments:

1)  The number of delimiters per row of data. Example:  if the file has 25
    columns, there will be 24 delimiters.

2)  The delimiter character.  Should be quoted.  Example '|'

Example use:

cat <your_file.txt> | ./remove_breaks 14 '|' > <your_converted_file.txt>

cat <your_file.txt> | ./txt2csv 10 '|' > <your_file.csv>

Notes:

These work very quickly even on fairly large files.   If you start getting into
the TB range, you should probably consider loading into a single TEXT column
table and processing the data from there.


