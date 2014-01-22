
yamlgen.sh - generates a very simple YAML skeleton for GPLOAD

The script will ask you for the following:

Database Name where the target table is located

Host Name where gpload will be run

Host Name where data file(s) are located

Directory and File Name for the file to load.  Should be the full path name 
and name of the data file itself:  /data/Files/myfile.txt

Delimiter to use.  This should be single quoted. Example: '|'

File Format - text or csv.  Note that if you put in csv, you will have to
manually add any CSV options (like HEADER) yourself.

Port number for GPLOAD to use

Schema.tablename of the table to be loaded.  Example:  public.foo

This is a very simple shell script and does not do error checking.

The output file generated will be named: <schema>.<tablename>.yaml

You can execute it with: gpload -f <schema>.<tablename>.yaml

This adds a PRELOAD section and sets TRUNCATE to TRUE so it will 
truncate the target table before loading.   You can remove these two
lines or set TRUNCATE to FALSE before you run it.

A default error table is built in the same schema named:
<schema>.<table_name>_err with a default limit of 100 bad rows before
aborting.

Here is an example YAML file generated:

---
VERSION:  1.0.0.1

DATABASE:  tpch
USER:  gpadmin
HOST:  localhost
PORT:  5432
GPLOAD:
   INPUT:
   - SOURCE:
       LOCAL_HOSTNAME:
        - localhost
       PORT: 8086
       FILE:
         - /Users/jimmccann/POC_Tools/jdummy.txt
   - FORMAT: text
   - DELIMITER:  '|'
   - ERROR_LIMIT: 100
   - ERROR_TABLE: public.jdummy_err
   OUTPUT:
   - TABLE: public.jdummy
   - MODE:  INSERT
   PRELOAD:
   - TRUNCATE:  true


