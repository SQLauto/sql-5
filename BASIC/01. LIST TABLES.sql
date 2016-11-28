/**
Author:		RR
Created:	28/11/2016
Description:	Uses information schema views to get a list of tables and the 
		schema they are in.

UPDATES
---------------------------------------------------------------------------------
DATE		EDITOR	DESCRIPTION
28/11/2016	RR	File created

**/
SELECT 
	TABLE_SCHEMA,
	TABLE_NAME
FROM
	INFORMATION_SCHEMA.tables tabs
WHERE
	tabs.TABLE_TYPE = 'BASE TABLE'
ORDER BY 
	table_name

