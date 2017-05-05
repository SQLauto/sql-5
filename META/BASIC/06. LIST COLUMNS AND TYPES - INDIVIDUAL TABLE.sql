/**
Author:		RR
Created:	04/05/2017
Description:	Lists the columns and data types of a particular table

UPDATES
---------------------------------------------------------------------------------
DATE		EDITOR	DESCRIPTION
04/05/2017	RR		File created

**/

-- SET TABLE OF INTEREST HERE OR USE WILDCARDS TO MATCH
DECLARE @TABLE VARCHAR(100) = 'morAppFma%'

SELECT 
	t.[name] AS [tableName],
	c.[name] AS [columnName], 
	c.column_id,
	[type] = (
		SELECT [name] 
		FROM sys.types t
		WHERE t.system_type_id = c.system_type_id 
		AND t.user_type_id = c.user_type_id),
	[length] = [c].[max_length],
	[collation_name],
	[is_nullable]
FROM 
	sys.columns c 
	INNER JOIN sys.tables t
	ON c.object_id = t.object_id
WHERE	
	t.name LIKE @TABLE
ORDER BY 
	t.name,
	c.column_id


