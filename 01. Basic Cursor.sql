
declare @lastname as varchar(200)
declare @pos as int

set @pos = 1

declare myCursor cursor 
	LOCAL
	SCROLL
	READ_ONLY
	TYPE_WARNING
	for 
	select top 10 lastname from person.person order by lastname

open myCursor

fetch absolute @pos from myCursor into @lastname

while @@fetch_status = 0
begin
	if @pos > 2 and @pos % 3 = 0
	begin
		declare @gp varchar(200)
		declare @newpos int
		set @newpos = @pos - 2
		fetch absolute @newpos from myCursor into @gp
		print @lastname + ' (' + @gp + ')'
	end
	else 
	begin
		print @lastname
	end

	set @pos = @pos + 1
	fetch absolute @pos from myCursor into @lastname
end

close myCursor
deallocate myCursor



