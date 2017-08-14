
use test1


IF OBJECT_ID(N'dbo.InsertCounter') IS NOT NULL
	DROP SEQUENCE dbo.InsertCounter;


CREATE SEQUENCE dbo.InsertCounter AS INT
	MINVALUE		1
	MAXVALUE		5
	INCREMENT BY	-1
	START WITH		5
	CYCLE;


IF OBJECT_ID(N'dbo.InsertCounter') IS NOT NULL
	DROP SEQUENCE dbo.InsertCounter;

CREATE SEQUENCE dbo.InsertCounter AS INT
    MINVALUE 1
    MAXVALUE 5
    START WITH 5
    INCREMENT BY -1
    CYCLE;


SELECT NEXT VALUE FOR dbo.InsertCounter


ALTER SEQUENCE dbo.InsertCounter
	RESTART WITH 1;



DROP SEQUENCE dbo.InsertCounter


create table dbo.tmp(
	myId int not null,
	myName varchar(20) not null
)


alter table dbo.tmp
add constraint tmpConstraint default(next value for dbo.InsertCounter) FOR myId

insert into tmp(myName) 
values ('juan'),('julio'),('steve')


select * from dbo.tmp


delete from dbo.tmp


drop table dbo.tmp





