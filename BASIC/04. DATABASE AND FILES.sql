SET NOCOUNT ON

CREATE TABLE #database(
	databaseId		INT				IDENTITY(1,1)	PRIMARY KEY,
	databaseName	NVARCHAR(100)					NOT NULL,
	database_id		INT								NOT NULL
)

CREATE TABLE #file(
	fileId			INT				IDENTITY(1,1)	PRIMARY KEY,
	databaseId		INT								NOT NULL,
	[filename]		NVARCHAR(100)					NOT NULL,
	physical_name	NVARCHAR(2000)					NOT NULL,
	[size]			BIGINT							NOT NULL			
)

INSERT INTO #database (databaseName, database_id)
SELECT 
	name, 
	database_id
FROM sys.databases

DECLARE	@dbId INT,
		@dbName NVARCHAR(100),
		@database_id INT

DECLARE	my_cursor CURSOR
FOR SELECT databaseId, databaseName, database_id FROM #database 

OPEN my_cursor

FETCH NEXT FROM my_cursor
INTO @dbid, @dbName, @database_id

WHILE @@FETCH_STATUS = 0
BEGIN

	DECLARE	@sql NVARCHAR(MAX)
	SET @sql = 
		'INSERT INTO #file(databaseId,[filename],physical_name,size) ' + 
		'SELECT ' + CAST(@database_id AS VARCHAR(10)) + ', [name], physical_name, [size] FROM [' + @dbName + '].sys.database_files'

	EXEC sys.sp_executesql @sql

	FETCH NEXT FROM my_cursor
	INTO @dbid, @dbName, @database_id
END


CLOSE my_cursor
DEALLOCATE my_cursor

SELECT 
	* 
FROM 
	#database
	INNER JOIN #file
	ON #database.databaseId = #file.databaseId
ORDER BY #database.databaseName

DROP TABLE #database
DROP TABLE #file

