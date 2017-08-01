
CREATE TABLE #temp(
	name varchar(20) not null primary key,
	age	int			null
)

insert into #temp(name, age)
values
	 ('pete',10)
	,('bob',null)
	,('dave',null)


SELECT 
	COUNT(*) [count *], 
	COUNT(name) [count name],
	COUNT(age) [count age] 
FROM 
	#temp

drop table #temp

