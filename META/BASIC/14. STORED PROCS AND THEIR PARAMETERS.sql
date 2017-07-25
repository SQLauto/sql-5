USE reports
go

SELECT 
	 params.name
	 , t.name
	 , params.has_default_value
	 , params.default_value
	 , t.max_length
	 , t.precision
	 ,t.scale
	,*
FROM 
	sys.procedures procs
	INNER JOIN sys.parameters params
	ON procs.object_id = params.object_id
	INNER JOIN sys.types t
	ON params.user_type_id = t.user_type_id
WHERE 
	procs.name LIKE '%pipelinesummarycurrentstatus'
ORDER BY
	t.name,
	params.parameter_id 



EXEC REPORTS.lending.PIPELINESUMMARYCURRENTSTATUS '','',''


