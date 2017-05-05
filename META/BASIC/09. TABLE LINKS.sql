
USE BackOfficeMortgage
go

--select * FROM sys.procedures
DECLARE @tbl VARCHAR(100) = 'morAppFma_FMALoanDetails'


-- WHAT OTHER TABLES REFERENCE IT?
EXEC sp_fkeys @pktable_name = @tbl

-- WHAT FOREIGN KEYS DOES IT HAVE?
exec sp_fkeys @fktable_name = @tbl

