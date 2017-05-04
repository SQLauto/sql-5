/**
Author:		RR
Created:	04/05/2017
Description:	Lists the columns and data types of a particular table

UPDATES
---------------------------------------------------------------------------------
DATE		EDITOR	DESCRIPTION
04/05/2017	RR		File created

**/

-- SET TABLE OF INTEREST HERE!
DECLARE @TABLE VARCHAR(100) = 'fct_ApplicationTask'

SELECT 
	c.[name], 
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
WHERE c.object_id = 
	(SELECT object_id FROM sys.tables WHERE name = @TABLE)
ORDER BY 
	c.column_id


