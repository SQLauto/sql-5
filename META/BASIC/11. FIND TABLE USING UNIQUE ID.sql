/**
Author:		Richard Rulach
Created:	08/05/2017
Description:	

UPDATES
---------------------------------------------------------------------------------
DATE		    EDITOR		DESCRIPTION
08/05/2017		RR			File created

**/

CREATE TABLE #results(
	[name] VARCHAR(500)
)

SELECT 
	t.[object_id],
	s.name AS schemaName,
	T.[NAME] AS tableName,
	0 AS [rows],
	0 AS [cols]
INTO
	#tdata
FROM 
	SYS.TABLES T
	INNER JOIN sys.schemas s
	ON t.schema_id = s.schema_id
WHERE
	T.[NAME] LIKE 'morAppFma_FMA%'
ORDER BY 
	T.[NAME]


DECLARE @sname AS VARCHAR(200), @tname AS VARCHAR(200)

DECLARE @id AS UNIQUEIDENTIFIER

DECLARE	address_cursor CURSOR
FOR SELECT TOP 1000 parentid FROM dbo.morAppFma_FMAAddress ORDER BY NEWID()

OPEN address_cursor

FETCH NEXT FROM address_cursor
INTO @id

WHILE @@FETCH_STATUS = 0
BEGIN
	--DO SOMETHING HERE


	DECLARE	my_cursor CURSOR
	FOR SELECT schemaName, tableName FROM #tdata

	OPEN my_cursor

	FETCH NEXT FROM my_cursor
	INTO @sname, @tname

	WHILE @@FETCH_STATUS = 0
	BEGIN
		DECLARE @sql AS NVARCHAR(1000)
		DECLARE @result AS INTEGER
    
		SET @sql = N'set @result = (select count(*) from [' + @sname + '].[' + @tname + '] where id = ''' + CAST(@id AS VARCHAR(200)) + ''')'

		EXEC sp_executesql 
			@sql,
			N'@Result INT OUTPUT',
			@result = @result OUTPUT; 	
	
		IF @result > 0 
			INSERT INTO #results( name )
			VALUES  ( @sname + '.' + @tname)

		FETCH NEXT FROM my_cursor
		INTO @sname, @tname
	END

	CLOSE my_cursor
	DEALLOCATE my_cursor

	FETCH NEXT FROM address_cursor
	INTO @id
END

CLOSE address_cursor
DEALLOCATE address_cursor

SELECT DISTINCT [name] FROM #results

DROP TABLE #results
DROP TABLE #tdata

 