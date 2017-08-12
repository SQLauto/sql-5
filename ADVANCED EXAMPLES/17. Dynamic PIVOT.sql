
USE AdventureWorksR2

DECLARE @dt				DATETIME,
		@colsSelect		NVARCHAR(MAX),
		@colsPivot		NVARCHAR(MAX)


-- GET THE RANGE OF DATES THAT WILL FORM THE COLUMN NAMES
SELECT @dt = MAX(orderdate) FROM sales.SalesOrderHeader

-- DEMO ALL DATES
;WITH 
Dates(OrderDate, TxtOrderDate) AS (
	SELECT MIN(orderdate) as OrderDate, FORMAT(MIN(orderdate),'MM/yyyy') as TxtOrderDate FROM sales.SalesOrderHeader 	
	UNION ALL
	SELECT DATEADD(mm, 1,OrderDate),FORMAT(DATEADD(mm, 1,OrderDate),'MM/yyyy') FROM Dates
	WHERE OrderDate < @dt 
)

-- DEMO ALL DATES IN 2008 (EVEN IF THERE ARE NO ORDERS FOR IT)
--;WITH 
--Dates(OrderDate, TxtOrderDate) AS (
--	SELECT DATEFROMPARTS(2008,1,1) as OrderDate, FORMAT(DATEFROMPARTS(2008,1,1),'MM/yyyy') AS TxtOrderDate
--	UNION ALL
--	SELECT DATEADD(mm, 1,OrderDate),FORMAT(DATEADD(mm, 1,OrderDate),'MM/yyyy') FROM Dates
--	WHERE MONTH(OrderDate) <= 11
--)

SELECT * INTO #dateRange FROM Dates

-- PUT COLUMN NAMES INTO A VARIABLE FOR SELECT AND A VARIABLE FOR THE PIVOT STATEMENT
SELECT @colsSelect = STUFF((SELECT ',ISNULL(' + QUOTENAME(TxtOrderDate) + ',0) as ' + QUOTENAME(TxtOrderDate) FROM #dateRange FOR XML PATH('')),1,1,'');
SELECT @colsPivot = STUFF((SELECT ',' + QUOTENAME(TxtOrderDate) FROM #dateRange FOR XML PATH('')),1,1,'');

-- COMPILE INTO THE DYNAMIC SQL STATEMENT
DECLARE @SQL NVARCHAR(MAX) = 
	'SELECT CustomerName, ' + @colsSelect + ' ' +
	'FROM 
		#pivottedData
	PIVOT(
		SUM(TotalDue)
		FOR OrderDate 
		IN (' + @colsPivot + ')
	) T
	ORDER BY 
		CustomerName';

-- INSERT THE DATA TO BE PIVOTTED INTO THE TEMP TABLE
SELECT 
     P.FirstName + ' ' + P.LastName					AS CustomerName
	,FORMAT(SOH.OrderDate,'MM/yyyy')				AS OrderDate
	,SUM(SOH.TotalDue)								AS TotalDue
INTO
	#pivottedData
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
DROP TABLE #pivottedData
DROP TABLE #dateRange

