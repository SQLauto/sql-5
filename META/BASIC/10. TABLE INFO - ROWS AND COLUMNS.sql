/**
Author:		Richard Rulach
Created:	08/05/2017
Description:	

UPDATES
---------------------------------------------------------------------------------
DATE		    EDITOR		DESCRIPTION
09/05/2017		RR			Added column count
08/05/2017		RR			File created

**/


SELECT 
	t.[object_id],
	s.name AS schemaName,
	T.[NAME] AS tableName,
	0 AS [rows],
	COUNT(*) AS [cols]
INTO
	#tdata
FROM 
	SYS.TABLES T
	INNER JOIN sys.schemas s
	ON t.schema_id = s.schema_id

	INNER JOIN sys.columns c
	ON t.object_id = c.object_id
WHERE
	T.[NAME] LIKE 'morAppFma_FMA%'
GROUP BY
	t.[object_id],
	s.[name],
	t.[name]	
ORDER BY 
	T.[NAME]


DECLARE @sname AS VARCHAR(200), @tname AS VARCHAR(200)

DECLARE	my_cursor CURSOR
FOR SELECT schemaName, tableName FROM #tdata

OPEN my_cursor

FETCH NEXT FROM my_cursor
INTO @sname, @tname

WHILE @@FETCH_STATUS = 0
BEGIN
	DECLARE @sql AS NVARCHAR(1000)

	SET @sql = N'update t set [rows] = (select count(*) from [' + @sname + '].[' + @tname + ']) from #tdata t where t.[schemaName] = ''' + @sname + ''' and t.[tablename] = ''' + @tname + ''''
	EXEC sp_executesql @sql

	FETCH NEXT FROM my_cursor
	INTO @sname, @tname
END

CLOSE my_cursor
DEALLOCATE my_cursor

SELECT * 
FROM 
	#tdata
WHERE 
	[rows] > 0
ORDER BY 
	tableName

DROP TABLE #tdata
