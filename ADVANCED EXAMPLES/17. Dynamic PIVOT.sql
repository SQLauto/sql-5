
USE AdventureWorksR2

DECLARE @dt DATETIME,
		@cols NVARCHAR(MAX),
		@cols2 NVARCHAR(MAX)

SELECT @dt = MAX(orderdate) FROM sales.SalesOrderHeader

;WITH 
Dates(OrderDate, TxtOrderDate) AS (
	SELECT MIN(orderdate) as OrderDate, FORMAT(MIN(orderdate),'MM/yyyy') as TxtOrderDate FROM sales.SalesOrderHeader 	
	UNION ALL
	SELECT DATEADD(mm, 1,OrderDate),FORMAT(DATEADD(mm, 1,OrderDate),'MM/yyyy') FROM Dates
	WHERE OrderDate < @dt
)

SELECT * INTO #temp2 FROM Dates

SELECT @cols = STUFF((SELECT ',ISNULL(' + QUOTENAME(TxtOrderDate) + ',0) as ' + QUOTENAME(TxtOrderDate) FROM #temp2 FOR XML PATH('')),1,1,'');
SELECT @cols2 = STUFF((SELECT ',' + QUOTENAME(TxtOrderDate) FROM #temp2 FOR XML PATH('')),1,1,'');

DECLARE @SQL NVARCHAR(MAX) = 
	'SELECT CustomerName, ' + @cols + ' ' +
	'FROM 
		#temp
	PIVOT(
		SUM(TotalDue)
		FOR OrderDate 
		IN (' + @cols2 + ')
	) T
	ORDER BY 
		CustomerName';

-- INSERT THE DATA TO BE PIVOTTED INTO THE TEMP TABLE
SELECT 
     P.FirstName + ' ' + P.LastName					AS CustomerName
	,FORMAT(SOH.OrderDate,'MM/yyyy')				AS OrderDate
	,SUM(SOH.TotalDue)								AS TotalDue
INTO
	#temp
FROM 
				sales.SalesOrderHeader	SOH
	INNER JOIN	sales.Customer			C	ON SOH.CustomerID = C.CustomerID
	INNER JOIN	person.Person			P	ON C.PersonID = P.BusinessEntityID
GROUP BY 
	P.FirstName + ' ' + P.LastName, 
	FORMAT(SOH.OrderDate,'MM/yyyy')		

-- RUN THE PIVOT QUERY
EXEC sp_executeSQL @sql


-- CLEANUP
DROP TABLE #temp
DROP TABLE #temp2







