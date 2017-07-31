
USE AdventureWorksR2

SELECT 
	ROW_NUMBER()	OVER (ORDER BY lastname),
	RANK()			OVER (ORDER BY lastname),
	DENSE_RANK()	OVER (ORDER BY lastname),
	NTILE(10)			OVER (ORDER BY lastname),
	lastname,
	* 
FROM 
	person.person


--EXEC sp_fkeys @pktable_name = ''





