
RESTORE HEADERONLY
FROM DISK = N'C:\DEVELOPMENT\db_restores\AdventureWorks2008R2-Full Database Backup.bak'

RESTORE FILELISTONLY
FROM DISK = N'C:\DEVELOPMENT\db_restores\AdventureWorks2008R2-Full Database Backup.bak'

SELECT * FROM SYS.master_files


