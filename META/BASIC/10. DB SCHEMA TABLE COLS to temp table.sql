-- CREATED 22-06-2017

USE MASTER
GO

CREATE TABLE #objects (
	db			VARCHAR(200),
	[schema]	VARCHAR(200),
	[table]		VARCHAR(200),
	[column]	VARCHAR(200),
	colOrder	INT
)

DECLARE @name VARCHAR(200)

DECLARE myCursor cursor for 
SELECT name FROM sys.databases WHERE database_id > 4

OPEN myCursor
FETCH NEXT FROM myCursor INTO @name

WHILE @@FETCH_STATUS = 0 
BEGIN
	DECLARE @sql NVARCHAR(1000) = 
		'insert into #objects ' +
		'select ' + 
		'	''' + @name + ''' as db, ' +
		'	s.name as [schema], ' +
		'	t.name as [table], ' +
		'	c.name as [column], ' +
		'	c.column_id as [colOrder] ' +
		'from	 ' +
		'	' + @name + '.sys.schemas s ' +
		'	inner join ' + @name + '.sys.tables t ' +
		'	on s.schema_id = t.schema_id ' +
		'	inner join ' + @name + '.sys.columns c ' +
		'	on t.object_id = c.object_id '

	EXEC sp_executesql @sql

	FETCH NEXT FROM myCursor INTO @name
END

CLOSE myCursor
DEALLOCATE myCursor

SELECT * 
FROM #objects
ORDER BY
	db,
	[schema],
	[table],
	[colOrder]

DROP TABLE #objects


