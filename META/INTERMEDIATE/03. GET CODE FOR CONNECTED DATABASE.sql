/*

1 - GET ALL THE EMPTY TABLES
2 - UPDATE THE PRIMARY KEYS
3 - GENERATE THE TABLES AND THEIR PRIMARY KEY
4 - ADD FOREIGN KEYS AND LINK TO THEIR PRIMARY KEY TABLE

*/


CREATE TABLE #LiveTables(
	oid				INT,
	sch				VARCHAR(100),
	tbl				VARCHAR(100),
	primaryKey		VARCHAR(200),
	primaryKeyType	VARCHAR(200)
)

DECLARE @oid INT,
		@sch VARCHAR(100),
		@tbl VARCHAR(100)

DECLARE	my_cursor CURSOR
FOR SELECT t.OBJECT_ID, SCHEMA_NAME(t.schema_id),t.name FROM sys.tables t

OPEN my_cursor

FETCH NEXT FROM my_cursor
INTO @oid, @sch, @tbl

WHILE @@FETCH_STATUS = 0
BEGIN
	--DO SOMETHING HERE
	DECLARE @count INT,
			@sql NVARCHAR(2000)
  
	SET @sql = 'select @cnt=count(*) from ' + QUOTENAME(@sch) + '.' + QUOTENAME(@tbl)	  

	EXEC sp_executesql @sql, N'@cnt INT OUTPUT', @cnt = @count OUTPUT
	
	IF @count > 0 
		INSERT INTO #LiveTables(oid, sch, tbl)
		VALUES (@oid, @sch, @tbl)

	FETCH NEXT FROM my_cursor
	INTO @oid, @sch, @tbl
END

CLOSE my_cursor
DEALLOCATE my_cursor


--SELECT * FROM #LiveTables

UPDATE LT
	SET 
		LT.primaryKey = c.NAME,
		LT.primaryKeyType = 
			CASE 
				WHEN c.user_type_id = 36 THEN 'UNIQUEIDENTIFIER'
				WHEN c.user_type_id = 56 THEN 'INT'
				ELSE ''
			END 
FROM 
	#LiveTables LT
	
	INNER JOIN sys.indexes i 
	ON LT.oid = i.object_id
	AND i.is_primary_key = 1

	INNER JOIN sys.index_columns ic 
	ON LT.oid = ic.object_id
	AND ic.index_id = i.index_id

	INNER JOIN sys.columns c
	ON LT.oid = c.object_id
	AND ic.column_id = c.column_id	

DELETE #LiveTables WHERE primaryKey IS NULL

SELECT * FROM #LiveTables

DROP TABLE	#LiveTables









-- TELLS YOU THE TABLES AND FOREIGN KEYS TO ADD TO THE DATABASE.
-- PROCESS THESE AND GENERATE COLUMNS AND KEYS

CREATE TABLE #ConnectedTables(
    PKTABLE_QUALIFIER NVARCHAR(128) NULL,
    PKTABLE_OWNER     NVARCHAR(128) NULL,
    PKTABLE_NAME      NVARCHAR(128) NULL,
    PKCOLUMN_NAME     NVARCHAR(128) NULL,
    FKTABLE_QUALIFIER NVARCHAR(128) NULL,
    FKTABLE_OWNER     NVARCHAR(128) NULL,
    FKTABLE_NAME      NVARCHAR(128) NULL,
    FKCOLUMN_NAME     NVARCHAR(128) NULL,
    KEY_SEQ           SMALLINT      NULL,
    UPDATE_RULE       SMALLINT      NULL,
    DELETE_RULE       SMALLINT      NULL,
    FK_NAME           NVARCHAR(128) NULL,
    PK_NAME           NVARCHAR(128) NULL,
    DEFERRABILITY     SMALLINT      NULL
)

DECLARE @sch AS VARCHAR(100),
		@tbl AS VARCHAR(100)

DECLARE	my_cursor CURSOR
FOR 
	SELECT 
		SCHEMA_NAME(t.schema_id), 
		t.NAME
	FROM 
		sys.tables t

OPEN my_cursor

FETCH NEXT FROM my_cursor
INTO @sch, @tbl

WHILE @@FETCH_STATUS = 0
BEGIN
	INSERT INTO #ConnectedTables
	EXECUTE sp_fkeys @fktable_name = @tbl, @fktable_owner = @sch

	FETCH NEXT FROM my_cursor
	INTO @sch, @tbl
END

CLOSE my_cursor
DEALLOCATE my_cursor

SELECT * FROM #ConnectedTables

DROP TABLE #ConnectedTables









