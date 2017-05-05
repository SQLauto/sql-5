/**
Author:			Richard Rulach
Created:		05/05/2017
Description:	Goes through matching tables and creates a table of all tables 
				that are linked to it.

UPDATES
---------------------------------------------------------------------------------
DATE		    EDITOR	  DESCRIPTION
05/05/2017		RR		  Created

**/

DECLARE @tbl VARCHAR(100) = 'document%'


SELECT 
	pkSchema.name as primaryKeyTableSchema,
	pktable.name as primaryKeyTableName,
	pkTableCols.name as primaryKeyColumnName,
	fkSchema.name as foreignKeyTableSchema,
	fkTable.name as foreignKeyTableName,
	fkTableCols.name as foreignKeyColumnName
FROM 
	sys.foreign_key_columns fkc

	-- TABLES
	INNER JOIN sys.tables pkTable
	ON fkc.referenced_object_id = pkTable.object_id
	INNER JOIN sys.tables fkTable
	ON fkc.parent_object_id = fkTable.object_id

	-- SCHEMAS
	INNER JOIN sys.schemas pkSchema
	ON pkTable.schema_id = pkSchema.schema_id
	INNER JOIN sys.schemas fkSchema
	ON fkTable.schema_id = fkSchema.schema_id

	-- COLUMNS
	INNER JOIN sys.columns pkTableCols
	ON pkTable.object_id = pkTableCols.object_id
	AND fkc.referenced_column_id = pkTableCols.column_id

	INNER JOIN sys.columns fkTableCols
	ON fkTable.object_id = fkTableCols.object_id
	AND fkc.parent_column_id = fkTableCols.column_id

WHERE
	pktable.name LIKE @tbl
OR
	fktable.name LIKE @tbl






