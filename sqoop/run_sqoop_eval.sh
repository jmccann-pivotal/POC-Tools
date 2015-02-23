:
#
# imports a table from my local Mac Greenplum instance
#

sqoop --options-file ./sqoop_eval.txt --query "select * from region"


