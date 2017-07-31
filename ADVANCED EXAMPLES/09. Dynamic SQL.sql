


declare @sql as varchar(200)

set @sql = 'select * from demo'

exec(@sql)





declare @sql2 as nvarchar(200)
declare @count int 
declare @value varchar(20)
declare @txt varchar(20)
set @value = N'mike'

--set @sql2 = N'select @cnt = max(demoid), @t = max(description) from dbo.demo where [name] = @val'
set @sql2 = N'select @count = count(*) from dbo.demo'

EXEC sp_executeSQL	@sql2, 
					N'@count INT OUTPUT', 
					@count OUT



--EXEC sp_executeSQL	@sql2, 
--					N'@cnt INT OUTPUT, @val varchar(20), @t varchar(20) OUT', 
--					@cnt = @count OUT, @val = @value, @t = @txt OUT


print @count
print @txt

declare @tName SYSNAME
