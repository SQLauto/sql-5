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

DECLARE @tbl VARCHAR(100) = '%'


SELECT 
	pkSchema.name as primaryKeyTableSchema,
	pktable.name as primaryKeyTableName,
	pkTableCols.name as primaryKeyColumnName,
	fkSchema.name as foreignKeyTableSchema,
	fkTable.name as foreignKeyTableName,
	fkTableCols.name as foreignKeyColumnName
INTO
	#relationships
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


-- GET ALL RELATIONSHIPS
SELECT 
	* 
FROM 
	#relationships
WHERE
	primaryKeyTableName LIKE @tbl
OR
	foreignKeyTableName LIKE @tbl


-- TABLES WHICH HAVE RELATIONSHIPS
SELECT DISTINCT primaryKeyTableName as linkedTables FROM #relationships
UNION
SELECT DISTINCT foreignKeyTableName as linkedTables FROM #relationships


-- TABLES WHICH HAVE RELATIONSHIPS
SELECT DISTINCT primaryKeyTableName as linkedTables, primaryKeyColumnName as [column], 1 as KeyType FROM #relationships
UNION
SELECT DISTINCT foreignKeyTableName as linkedTables, foreignKeyColumnName as [column], 2 as KeyType FROM #relationships
ORDER BY 
	linkedTables, keyType, [column]

select kc.name, t.name,  * 
from 
	sys.key_constraints kc
	inner join sys.tables t
	on kc.parent_object_id = t.object_id

--where kc.type = 'PK'
order by t.name


select * from sys.index_columns where object_id = 1189579276


SELECT 
    c.name AS column_name,
    i.name AS index_name,
    c.is_identity
FROM sys.indexes i
    inner join sys.index_columns ic  ON i.object_id = ic.object_id AND i.index_id = ic.index_id
    inner join sys.columns c ON ic.object_id = c.object_id AND c.column_id = ic.column_id
WHERE i.is_primary_key = 1
    and i.object_ID = OBJECT_ID('Person.EmailAddress');


DROP TABLE #relationships



