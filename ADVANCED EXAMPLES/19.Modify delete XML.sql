use AdventureWorksR2

go

declare @xml table(xVal xml)
declare  @xml2 as xml

insert into @xml(xVal)
select 
(
	SELECT TOP 10
		BusinessEntityID AS [@bid],
		(
			select top 3 emailaddressid as [@eid], emailaddress as [@eadd] from person.emailAddress
			for xml path('email'), TYPE
		),
		firstname,
		middlename,
		lastname 
	FROM person.person
	FOR XML PATH('people'), TYPE, ROOT('elments')
)

--update @xml
--set xVal.modify('delete //emailaddress')

update @xml
set xVal.modify('delete //email/@eadd[1]')


select * from @xml





