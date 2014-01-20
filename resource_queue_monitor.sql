 
--SHOW USER/RESOURCE QUEUE MAPPINGS
select * from gp_toolkit.gp_resq_role;
 
--SHOW RESOURCE QUEUE ACTIVITY
select * from gp_toolkit.gp_resq_activity order by 2;
 
--SHOW RESOURCE QUEUE ACTIVITY BY QUEUE - see how many queries are queued 
--on each queue

select * from gp_toolkit.gp_resq_activity_by_queue order by 2;
 
--SHOW CURRENT RUNNING QUERIES AND THEIR PRIORITIES
select rqpdatname, rqpusename , rqpsession , rqpcommand , rqppriority , rqpweight , substr(rqpquery,1,50) from gp_toolkit.gp_resq_priority_statement order by 2;

