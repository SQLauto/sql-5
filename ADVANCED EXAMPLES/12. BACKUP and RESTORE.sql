--drop database useradmin



restore filelistonly
from disk = N'c:\temp\unzipLocation\UserAdmin.bak'


restore database UserAdmin
from disk = N'c:\temp\unzipLocation\UserAdmin.bak'
with
	move 'UserAdmin' to N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\UserAdmin.mdf',
	move 'UserAdmin_log' to N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\UserAdmin_log.ldf'



select * from sys.master_files



-- C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\flashcards_log.ldf

