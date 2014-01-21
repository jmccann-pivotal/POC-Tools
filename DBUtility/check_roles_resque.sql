--
--	Checks to see what roles are assigned to what resource queue
--

select rolname, rsqname 
from pg_roles, gp_toolkit.gp_resqueue_status
where
pg_roles.rolresqueue=gp_toolkit.gp_resqueue_status.queueid;

-- now check resource queue status

select * from gp_toolkit.gp_resqueue_status;


