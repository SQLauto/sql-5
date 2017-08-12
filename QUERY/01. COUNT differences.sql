
CREATE TABLE #temp(
	name varchar(20) not null primary key,
	age	int			null
)

insert into #temp(name, age)
values
	 ('pete',10)
	,('bob',null)
	,('dave',null)
	,('tim',12)
	,('joe',5)


SELECT 
	COUNT(*) [count *], 
	COUNT(case when len(name) = 4 then 2 else null end) [count name],
	sum(case when len(name) = 3 then 1 else 0 end ) [sum name],
	COUNT(age) [count age] 
FROM 
	#temp

drop table #temp

