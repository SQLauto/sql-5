

SELECT 
	t.[name] AS [TableName],
	sum(CAST(i.is_primary_key AS INTEGER)) [NumPrimaryKeyColumns]
FROM 
	sys.tables t
	
	INNER JOIN sys.indexes i 
	ON t.object_id = i.object_id

	INNER JOIN sys.index_columns ic 
	ON t.object_id = ic.object_id
	AND ic.index_id = i.index_id

	INNER JOIN sys.columns c
	ON t.object_id = c.object_id
	AND ic.column_id = c.column_id	
GROUP 
	BY t.[name]
ORDER BY 
	sum(CAST(i.is_primary_key AS INTEGER)) DESC
