#!/bin/bash
# psql script to count all tables in passed database and schema

if [ $# -ne 2 ]
then
        echo "Syntax:  $0 <name of database > <name of schema>"
        exit -1
fi

dbname=$1
schema=$2
#ot=`date`
echo "DB=$dbname"
echo "Schema=$schema"

psql -d $dbname -qtc "select 'select count(*) from  ' || table_schema || '.' || table_name || ';' from information_schema.tables where table_type  = 'BASE TABLE' and table_schema in ('$schema') and table_name not like '%err' and table_name not like '%_prt_%'  order by table_name;" | psql -e -q -t -d $dbname 

