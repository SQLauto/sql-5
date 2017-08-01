USE AdventureWorksR2

--SELECT EMP.gender, DEP.name, YEAR(emp.HireDate), count(*)
--FROM
--	HumanResources.Employee EMP
--	INNER JOIN HumanResources.EmployeeDepartmentHistory EDH on EMP.BusinessEntityID = EDH.BusinessEntityID
--	INNER JOIN HumanResources.Department DEP on edh.DepartmentID = DEP.DepartmentID
--												and edh.EndDate is null
--GROUP BY 
--	EMP.Gender, DEP.Name, YEAR(emp.HireDate)


SELECT 
	grouping (dep.name),
	grouping_id(DEP.name,YEAR(emp.HireDate)),
	DEP.name, 
	YEAR(emp.HireDate) YearHired, 
	count(*) NumberOfEmp
FROM
	HumanResources.Employee EMP
	INNER JOIN HumanResources.EmployeeDepartmentHistory EDH on EMP.BusinessEntityID = EDH.BusinessEntityID
	INNER JOIN HumanResources.Department DEP on edh.DepartmentID = DEP.DepartmentID
												and edh.EndDate is null
--GROUP BY 
--	DEP.Name, YEAR(emp.HireDate)
--	EMP.Gender, DEP.Name, YEAR(emp.HireDate)

group by grouping sets
(
	(dep.name, year(emp.hiredate))
	,(dep.name)
	,(year(emp.hiredate))
--	,(dep.name)
	,()
)















