

SELECT 
	c.[name] AS colName, 
	t.[name] AS tblName,
	t.[name] + '->' + c.[name] AS [ref]
FROM 
	sys.tables t 
	INNER JOIN sys.columns c
	ON t.object_id = c.object_id
WHERE 
	t.[name] like 'morAppFma_%'
AND
	c.[name] LIKE '%months%'
ORDER BY 
	t.name, c.[name]


