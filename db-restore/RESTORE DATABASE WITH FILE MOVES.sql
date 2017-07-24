
RESTORE DATABASE AdventureWorksR2
FROM DISK = N'C:\DEVELOPMENT\db_restores\AdventureWorks2008R2-Full Database Backup.bak'
WITH 
	 MOVE 'AdventureWorks2008R2_Data' TO 'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AdventureWorks2008R2.mdf'
	,MOVE 'AdventureWorks2008R2_Log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AdventureWorks2008R2.ldf'



