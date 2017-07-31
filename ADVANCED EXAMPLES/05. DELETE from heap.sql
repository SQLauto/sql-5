use test1

create table heap(
	id int,
	fname varchar(20),
	lname varchar(20)
)


insert into heap (id, fname, lname)
values
	(1,'bob','bob'),
	(1,'bob','bob'),
	(1,'bob','bob'),
	(1,'bob','bob')



set rowcount 5

delete heap

set rowcount 0

select * from heap




