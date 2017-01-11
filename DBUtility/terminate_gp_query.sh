#!/bin/bash
#-------------------------------------------------------------------------
# terminate_gp_query.sh
# 
# This script is provided as a field written utility and as an option only 
when pg_cancel_backend or pg_terminate_backend is not working as desired and you need immediate termination of the query 
without waiting for rollback. Cancelling the query due to pg_cancel_backend may take some time depending on the cleanup/rollback of the long running transactions.

conSESS_ID is the session id for the connection that you want to terminate you can find it from 'select * from pg_stat_activity;'
hostfile is the list of all hosts in the greenplum cluster. 
 

# 
#-------------------------------------------------------------------------


gpssh -f hostfile "ps -flyCpostgres | grep conSESS_ID | awk '{print \$3}' | xargs -n1 kill -11"