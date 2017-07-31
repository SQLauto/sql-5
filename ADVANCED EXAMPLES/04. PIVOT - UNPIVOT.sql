
use adventureworksr2

select * from sales.salesorderheader

select * from sales.SalesTerritory


;WITH pivotData AS (
	SELECT 
		soh.customerid 
		,sot.Name 
		,soh.TotalDue 
		--,*
	FROM 
				sales.SalesOrderHeader	SOH
	INNER JOIN	sales.salesTerritory	SOT ON soh.TerritoryID = sot.territoryid
)

SELECT 
	CustomerID
		,Australia
		,Canada
		,Central
		,France
		,Germany
		,Northeast
		,Northwest
		,Southeast
		,Southwest
		,[United Kingdom]
INTO #temp
FROM 
	pivotData
PIVOT(
	SUM(TotalDue)
	FOR Name IN (
		Australia
		,Canada
		,Central
		,France
		,Germany
		,Northeast
		,Northwest
		,Southeast
		,Southwest
		,[United Kingdom]
	)
) AS P
ORDER BY 
	CustomerID


select * from #temp

select customerid, [name], totalDue
from #temp
UNPIVOT( totalDue FOR [name] IN (
		Australia
		,Canada
		,Central
		,France
		,Germany
		,Northeast
		,Northwest
		,Southeast
		,Southwest
		,[United Kingdom]
	)
)as U


drop table #temp



SELECT 
	firstname, 
	lastname 
FROM 
	person.person
ORDER BY 
	lastname
OFFSET 2000 ROW 
FETCH FIRST 100 ROW ONLY

