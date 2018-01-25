
-- DECLARE A BASIC XML DOCUMENT
DECLARE @xml XML 
SET @xml = 
'<root>
<people>
	<person name="richard">
		<age>20</age>
	</person>
	<person name="michael">
		<age>25</age>
	</person>
	<person name="davidson">
		<age>30</age>
	</person>
</people>
</root>';


DECLARE  @name VARCHAR(20) = 'michael'
		,@age VARCHAR(20) = '100000'

SELECT @xml.value('((/root/people/person)[@name = sql:variable("@name")]/age)[1]','varchar(20)') as SelectVariable

-- 1. Update the age
SET @xml.modify('
	replace value of ((/root/people/person)[@name = sql:variable("@name")]/age/text())[1]
	with sql:variable("@age")
')

SELECT @xml AS AgeUpdated

-- 2. Delete
SET @xml.modify('
	delete (/root/people/person[age/text() = sql:variable("@age")])[1]
')

-- New XML to insert
DECLARE @insert XML = '<person><age>41</age></person>'


SET @xml.modify('
	insert sql:variable("@insert")
	after (/root/people/person)[1]
')

SET @insert = '<person><age>40</age></person>'

SET @xml.modify('
	insert sql:variable("@insert")
	after (/root/people/person)[1]
')

SET @insert = '<person><age>39</age></person>'

SET @xml.modify('
	insert sql:variable("@insert")
	after (/root/people/person)[1]
')

SELECT @xml AS AfterAdditions



--select @xml.value('(/root/people/person/@name)[1]','varchar(20)')
--select @xml.value('(/root/people/person/age)[2]','varchar(20)')

--select @xml.value('((/root/people/person)[@name = "davidson"]/age)[1]','varchar(20)')



