
select sod.SalesOrderID, p.name, sod.productid, * from sales.SalesOrderDetail sod
inner join production.Product p on sod.ProductID = p.ProductID
order by sod.SalesOrderID

GO

SELECT sod.SalesOrderID, ORD.ProdList

FROM sales.SalesOrderHeader sod

OUTER APPLY (
		SELECT stuff(
			(SELECT ',' + p.name
			FROM production.Product p 
			inner join sales.SalesOrderDetail sod2
			on p.ProductID = sod2.ProductID
			WHERE sod.SalesOrderID = sod2.salesOrderid
			ORDER BY p.name 
--			offset 0 rows fetch next 10 rows only 
			FOR XML PATH('')
			), 1, 1, ''
		) AS ProdList
) ORD
ORDER BY sod.SalesOrderID

