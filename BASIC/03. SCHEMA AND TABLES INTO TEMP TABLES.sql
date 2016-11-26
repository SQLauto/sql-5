USE AdventureWorks2014
GO

SET NOCOUNT ON

CREATE TABLE #schema (
	schemaId	INT				IDENTITY(1,1)	PRIMARY KEY,
	schemaName	NVARCHAR(200)					NOT NULL
)

INSERT INTO #schema(schemaName)
SELECT SCHEMA_NAME 
FROM INFORMATION_SCHEMA.SCHEMATA

CREATE TABLE #table (
	tableId		INT				IDENTITY(1,1)	PRIMARY KEY,
	schemaId	INT								NOT NULL,
	tableName	NVARCHAR(200)					NOT NULL,
	[rowCount]	INT				DEFAULT 0,
	[colCount]	INT				DEFAULT 0
)

INSERT INTO #table(schemaId, tableName)
SELECT 
	(	SELECT schemaId 
		FROM #schema 
		WHERE schemaName = tabs.TABLE_SCHEMA 
		COLLATE SQL_Latin1_General_CP1_CI_AS
	),
	tabs.TABLE_NAME
FROM
	INFORMATION_SCHEMA.tables tabs
WHERE
	tabs.TABLE_TYPE = 'BASE TABLE'
ORDER BY 
	tabs.table_name


DECLARE my_cursor CURSOR
FOR SELECT tableId, tableName FROM #table

DECLARE @tableId INT,
		@tableName NVARCHAR(200)

OPEN my_cursor

FETCH NEXT FROM my_cursor
INTO @tableId, @tableName

WHILE @@FETCH_STATUS = 0
BEGIN
	
	PRINT @tableName

	FETCH NEXT FROM my_cursor
	INTO @tableId, @tableName
END

CLOSE my_cursor
DEALLOCATE my_cursor


-- CHECK ON VALUES
SELECT 
	* 
FROM 
	#schema
	INNER JOIN #table
	ON #schema.schemaId = #table.schemaId

DROP TABLE #schema
DROP TABLE #table


