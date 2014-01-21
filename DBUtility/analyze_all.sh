# psql script to analyze all tables in schema

if [ $# -ne 2 ]
then
        echo "Syntax:  $0 <name of database > <name of schema>"
        exit -1
fi
ot=`date +%h%d-%H%M`
dbname=$1
schema=$2


psql -c "select 'analyze ' || table_schema || '.' || table_name || ';' from information_schema.tables where table_type  = 'BASE TABLE' and table_schema in ('$schema') and table_name not like '%err' and table_name not like '%_prt_%' and table_name not like 'ext_%' order by 1" -d $dbname   -t | psql -e -d $dbname >  ./analyze_$1_$2_$ot.out 2>&1
