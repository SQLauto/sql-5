SELECT * FROM msdb..sysjobs
WHERE name LIKE 'ETL%'
ORDER BY name

SELECT * FROM msdb..sysjobsteps
WHERE job_id = N'XXX'


SELECT 
	steps.step_id,
	steps.database_name,
	steps.step_name,
	steps.last_run_duration	
FROM 
	msdb..sysjobs jobs
	INNER JOIN 
	msdb..sysjobsteps steps
	ON
	jobs.job_id = steps.job_id
WHERE 
	jobs.name = N'XXX'
ORDER BY 
	step_id



SELECT 
	*
FROM 
	msdb..sysjobs jobs
	INNER JOIN 
	msdb..sysjobschedules jobsched
	ON
	jobs.job_id = jobsched.job_id
	INNER JOIN 
	msdb..sysschedules sched
	ON
	jobsched.schedule_id = sched.schedule_id
WHERE 
	jobs.name = N'XXX'



EXEC msdb.dbo.sp_help_job

