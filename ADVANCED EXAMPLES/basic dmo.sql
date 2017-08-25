
use AdventureWorksR2

--select * from sys.dm_db_partition_stats


SELECT 
	* 
FROM 
	sys.dm_exec_requests 
CROSS APPLY 
	sys.dm_exec_query_plan(plan_handle)


SELECT 
    *
FROM
   sys.dm_exec_requests
CROSS APPLY
   sys.dm_exec_query_plan( plan_handle )



SELECT
	*
FROM
	sys.dm_exec_cached_plans
CROSS APPLY
	sys.dm_exec_query_plan(plan_handle)



SELECT
	*
FROM
	sys.dm_exec_query_stats
CROSS APPLY
	sys.dm_exec_query_plan(plan_handle)




SELECT
	*
FROM
	sys.dm_exec_query_stats
CROSS APPLY
	sys.dm_exec_text_query_plan(plan_handle,DEFAULT,DEFAULT)





SELECT 
	* 
FROM 
	sys.dm_exec_query_plan(0x060016005B7A3A21F0BE72610200000001000000000000000000000000000000000000000000000000000000)




select * from 
sys.dm_os_sys_info


select * from sys.dm_os_sys_memory




select  sqlserver_start_time
from sys.dm_os_sys_info


select * from sys.dm_os_waiting_tasks

select * from sys.dm_exec_sessions


select 
	s.login_name,
	s.host_name,
	s.program_name,
	t.wait_duration_ms,
	t.wait_type
from 
	sys.dm_os_waiting_tasks t
	inner join sys.dm_exec_sessions s
	on t.session_id = s.session_id
where
	s.is_user_process = 1

select  * from 
	sys.dm_exec_query_stats

select * from sys.dm_exec_requests


select * from sys.dm_exec_sessions

where is_user_process = 1


SELECT * 
FROM 
	sys.dm_exec_requests
CROSS APPLY 
	sys.dm_exec_sql_text(sql_handle)
WHERE sql_handle IS NOT NULL




