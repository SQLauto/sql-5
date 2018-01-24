-- TABLE BACKUP SCRIPT

USE AdventureWorks2012

DECLARE @fieldName  SYSNAME,
		@typeName	SYSNAME, 
		@length		INT,
		@precision	INT,
		@scale		INT,
		@collation	SYSNAME,
		@isNullable	INT,
		@nextLine	VARCHAR(MAX)

DECLARE myCursor CURSOR FOR
	SELECT 
		 [name]						AS [FieldName]
		,TYPE_NAME(system_type_id)	AS [TypeName] 
		,[max_length]				AS [max_length]
		,[precision]				AS [precision]
		,[scale]					AS [scale]
		,[collation_name]			AS [collation_name]
		,[is_nullable]				AS [is_nullable]
	FROM 
		sys.columns 
	WHERE 
		object_id = object_id(N'Sales.SpecialOffer')
	ORDER BY 
		column_id

OPEN myCursor

FETCH NEXT FROM myCursor INTO 
@fieldName,	@typeName, @length, @precision, @scale, @collation, @isNullable

PRINT 'CREATE TABLE Sales.SpecialOfferBackup ('

WHILE @@FETCH_STATUS = 0
BEGIN

	SELECT @nextLine = 
		'[' + @fieldName + '] [' + @typeName + ']' + 
		CASE WHEN @typeName in ('nvarchar') THEN '(' + CAST(@length / 2 AS VARCHAR(20)) + ')'
			 WHEN @typeName in ('varchar') THEN '(' + CAST(@length AS VARCHAR(20)) + ')'
			 WHEN @typeName in ('decimal','numeric') THEN '(' + CAST(@precision AS VARCHAR(20)) + ',' + CAST(@scale AS VARCHAR(20)) + ')'
			 
			 ELSE ''
		END +
		CASE WHEN @isNullable = 1 THEN ' NULL' ELSE ' NOT NULL' END

	FETCH NEXT FROM myCursor INTO 
	@fieldName,	@typeName, @length, @precision, @scale, @collation, @isNullable

	IF @@FETCH_STATUS = 0 
		PRINT @nextLine + ','
	ELSE
		PRINT @nextLine
		
END

PRINT ')'

CLOSE myCursor
DEALLOCATE myCursor



