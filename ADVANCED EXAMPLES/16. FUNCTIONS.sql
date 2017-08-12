use test1;
go

ALTER FUNCTION dbo.myName()
RETURNS VARCHAR(20)
WITH EXECUTE AS CALLER
AS
	BEGIN
		DECLARE @val VARCHAR(20);
		SET @val = 'richard';
		RETURN @val
	END
;

GO

CREATE FUNCTION dbo.myNames()
RETURNS @table TABLE (
	[name]			NVARCHAR(20),
	[description]	NVARCHAR(20)
)
WITH EXECUTE AS CALLER
AS
BEGIN
	INSERT INTO @table 
	SELECT [name], [description] FROM Demo
	
	RETURN
END;

GO

select * from dbo.myNames()


select dbo.myName()


select *, dbo.myName() 
from Demo

