
-- window offset functions




USE AdventureWorksR2

SELECT 
	year(orderDate),
	orderDate
	,TotalDue  
	, LAG(TotalDue,2) OVER (ORDER BY orderDate) as previousValue
	, LEAD(TotalDue,2) OVER (ORDER BY orderDate) as nextValue

	, FIRST_VALUE(TotalDue) OVER (PARTITION BY MONTH(orderDate) ORDER BY orderDate, totalDue ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) as FirstValue
	, LAST_VALUE(TotalDue) OVER (PARTITION BY MONTH(orderDate) ORDER BY orderDate, totalDue ROWS BETWEEN  CURRENT ROW AND UNBOUNDED FOLLOWING) as LastValue
FROM 
	sales.SalesOrderHeader
WHERE 
	YEAR(orderDate) = 2005
ORDER BY 
	orderDate, totalDue
