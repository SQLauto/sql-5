
/*
	Date : 17/01/2018
	Notes: Catches a bad xml character error and displays messages to help with debugging
*/

DECLARE @x VARCHAR(MAX)
SET @x = '<?xml version="1.0" encoding="UTF-8"?><root><person>dave' + CHAR(160) + 'smith</person></root>'

BEGIN TRY
	SELECT CAST(@x AS XML) AS xmlOutput
END TRY
BEGIN CATCH

	DECLARE  @errorMessage VARCHAR(MAX)
			,@errPos INT

	SELECT @errorMessage = ERROR_MESSAGE()
	
	IF PATINDEX('%illegal xml character%', @errorMessage) > 0
	BEGIN  
		SELECT @errPos = SUBSTRING(@errorMessage, 
									PATINDEX('%character %', @errorMessage) + 10,
									PATINDEX('%, illegal%', @errorMessage) - PATINDEX('%character %', @errorMessage) - 10 )

		PRINT 'Error caused by illegal character in XML:'
		PRINT 'Character:' + SUBSTRING(@x,@errPos,1)
		PRINT 'Ascii Code:'	+ CAST(ASCII(SUBSTRING(@x,@errPos,1)) AS VARCHAR(MAX))
		PRINT 'Surrounding text:' + SUBSTRING(@x,@errPos-100,200)
		PRINT ''
	END
    
END CATCH	

