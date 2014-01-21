select 
	pg_stat_activity.datname, pg_class.relname, pg_locks.transactionid, 
	pg_locks.mode, pg_locks.granted, pg_stat_activity.usename, 
	substr(pg_stat_activity.current_query,1,30), pg_stat_activity.query_start, age(now(),
	pg_stat_activity.query_start) as "age", pg_stat_activity.procpid 
	from pg_stat_activity, pg_locks 
		left outer join pg_class on (pg_locks.relation = pg_class.oid) 
	where pg_locks.pid = pg_stat_activity.procpid 
	order by query_start;
