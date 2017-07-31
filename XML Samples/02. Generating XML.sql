
use AdventureWorksR2
select top 10 
	BusinessEntityID,
	FirstName,
	LastName
	 from person.person
for xml auto, type

select top 10 
	BusinessEntityID,
	FirstName,
	LastName
	 from person.person
for xml raw('node')

select top 10 
--	BusinessEntityID as tag,
	1 as tag,
	null as parent,
	FirstName as [person!1!FirstName],
	LastName as [person!1!LastName]
	 from person.person
for xml explicit


