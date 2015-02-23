:
#
# imports a table from my local Mac Greenplum instance
#

sqoop --options-file ./sqoop_options.txt --table part --split-by p_partkey


# -m 1 required because no primary key on the table

