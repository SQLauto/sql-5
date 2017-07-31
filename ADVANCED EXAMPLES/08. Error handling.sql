

create procedure sp_runTest 
as
begin
	select *
	from demodsa
end 

begin try
	exec sp_runTest	

end try


begin catch
	print 'error'
	select	ERROR_LINE() as line,
			ERROR_NUMBER() as number,
			ERROR_PROCEDURE() as procName,
			ERROR_SEVERITY() as severity,
			ERROR_STATE() as [state]
end catch;
GO


