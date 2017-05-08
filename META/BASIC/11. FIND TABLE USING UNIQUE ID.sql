/**
Author:		Richard Rulach
Created:	08/05/2017
Description:	

UPDATES
---------------------------------------------------------------------------------
DATE		    EDITOR		DESCRIPTION
08/05/2017		RR			File created

**/

DECLARE @searchId VARCHAR(200) = '7334C059-9B7F-4AB6-8AF6-00006EE23FCA'

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

DECLARE	my_cursor CURSOR
FOR SELECT schemaName, tableName FROM #tdata

OPEN my_cursor

FETCH NEXT FROM my_cursor
INTO @sname, @tname

WHILE @@FETCH_STATUS = 0
BEGIN
	DECLARE @sql AS NVARCHAR(1000)
	DECLARE @result AS INTEGER
    
	SET @sql = N'set @result = (select count(*) from [' + @sname + '].[' + @tname + '] where id = ''' + @searchId + ''')'

	EXEC sp_executesql 
		@sql,
		N'@Result INT OUTPUT',
		@result = @result OUTPUT; 	
	
	IF @result > 0 
		PRINT @sname + '.' + @tname  
	
	FETCH NEXT FROM my_cursor
	INTO @sname, @tname
END

CLOSE my_cursor
DEALLOCATE my_cursor




DROP TABLE #tdata


--SELECT * FROM dbo.morAppFma_FMAAddress WHERE ParentId IS NOT NULL

--SELECT * FROM dbo.morAppFma_FMAAddress WHERE id = '7334C059-9B7F-4AB6-8AF6-00006EE23FCA'


 