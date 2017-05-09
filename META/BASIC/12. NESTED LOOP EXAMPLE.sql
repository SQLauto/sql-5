/**
Author:		Richard Rulach
Created:	09/05/2017
Description:Demo of nested loop in t-sql
			Prints the name of each table followed by the columns of the table
			separated by commas.

UPDATES
---------------------------------------------------------------------------------
DATE		    EDITOR		DESCRIPTION
09/05/2017		RR			File created

**/


DECLARE @oid AS INTEGER, @name AS VARCHAR(200)

DECLARE	outer_cursor CURSOR
FOR SELECT object_id, [name] FROM sys.tables

OPEN outer_cursor

-- REPEAT AT THE END OF THE OUTER LOOP!!!
FETCH NEXT FROM outer_cursor
INTO @oid, @name

WHILE @@FETCH_STATUS = 0
BEGIN

	-- INNER QUERY
	DECLARE @colName AS VARCHAR(200)
	DECLARE @colList AS VARCHAR(MAX)
    SELECT @colList = @name + ':'

	DECLARE	inner_cursor CURSOR
	FOR SELECT [name] FROM sys.columns WHERE object_id = @oid

	OPEN inner_cursor
	
	-- REPEAT AT THE END OF THE INNER LOOP!!!
	FETCH NEXT FROM inner_cursor
	INTO @colName

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SELECT @colList = @colList + @colName + ',' 

		FETCH NEXT FROM inner_cursor
		INTO @colName
	END

	CLOSE inner_cursor
	DEALLOCATE inner_cursor

	PRINT @colList 

	FETCH NEXT FROM outer_cursor
	INTO @oid, @name
END

CLOSE outer_cursor
DEALLOCATE outer_cursor


