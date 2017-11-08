SET NOCOUNT ON

IF OBJECT_ID('tempdb..#CurrentProcs') IS NOT NULL
	DROP TABLE #CurrentProcs

SELECT
	sp.spid,
	db.name
INTO 
	#CurrentProcs
FROM 
			sys.sysprocesses sp
INNER JOIN  sys.databases	 db ON sp.dbid = db.database_id
WHERE db.name IN
	(
		'BackofficeMortgage',
		'PortalUsers',
		'Products',
		'ThinkingWork',
		'UserAdmin',
		'PepperETL',
		'Lending'
	)


DECLARE @spid INT,
		@name sysname		

DECLARE	my_cursor CURSOR
FOR SELECT spid, name FROM #CurrentProcs

OPEN my_cursor

FETCH NEXT FROM my_cursor
INTO @spid, @name

WHILE @@FETCH_STATUS = 0
BEGIN
	DECLARE @sql nVARCHAR(1000)
	SELECT @sql = 'KILL ' + CAST(@spid AS VARCHAR(10))
	EXEC sp_executesql @statement = @sql

	FETCH NEXT FROM my_cursor
	INTO @spid, @name
END

CLOSE my_cursor
DEALLOCATE my_cursor

DROP TABLE #CurrentProcs
 