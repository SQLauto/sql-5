
use AdventureWorksR2
go

;with accounts as (
	
	select 
		firstname, 
		lastname
	from
		person.Person		
)


select * from accounts




;with dates as (
	select 
		getdate() as dt
	union all
	select
		dateadd(d,1,d.dt) as dt
	from
		dates d
	where 
		d.dt < EOMONTH(getdate())
		
)


select * from dates


select OBJECT_NAME(c.object_id) from sys.columns c where c.name like 'parentid'

