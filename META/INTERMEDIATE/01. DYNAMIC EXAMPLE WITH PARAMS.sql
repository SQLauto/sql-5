
/*
	Author:	Richard Rulach
	Date:	23/06/2017
	Description:
			Demonstration of how to put parameters in and out of a dynamic sql statement

	Helpspot Ticket:
	Jira Ticket:
*/


DECLARE @sql NVARCHAR(2000) = 'SELECT @cnt=COUNT(*) FROM morAppFMA_FMAApplication where ApplicationType = @type'
DECLARE @type VARCHAR(100) = 'FMA'
DECLARE @count INT

EXEC sp_executesql @sql, N'@type varchar(100),@cnt int OUTPUT', @type = @type, @cnt = @count OUTPUT

PRINT @count


