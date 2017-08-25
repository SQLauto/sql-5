use AdventureWorksR2

go

declare @xml table(xVal xml)
declare  @xml2 as xml

	--select @xml2 = 
	--insert into @xml(xVal)
	select @xml2 = 
	(
		SELECT TOP 10
			BusinessEntityID AS [@bid],
			(
				SELECT TOP 3 emailaddressid, emailaddress FROM person.emailAddress
				FOR XML PATH('email'), TYPE
			),
			firstname,
			middlename,
			lastname 
	--	into #temp
		FROM person.person
		FOR XML PATH('people'), TYPE, ROOT('elments')
	)


	 --xmlns:rr="rr"


--UPDATE @xml
--set xVal.modify('
--	replace value of (//email/[1])
--	with <email></email>
--')

--update @xml
--set xVal.modify('delete //email/@eadd[1]')

select @xml2.query('
	for $x in //emailaddress
	return $x
')


--SELECT * FROM @xml





