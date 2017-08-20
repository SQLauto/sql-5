
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

alter sequence dbo.insertCounter
	cache 200;



select cache_size, * from test1.sys.sequences


drop sequence MySeq
drop sequence InsertCounter

drop table dbo.tmp


declare @firstVal sql_variant,
		@lastVal sql_variant

exec sp_sequence_get_range N'dbo.insertCounter', 2, @range_first_value = @firstVal OUTPUT, @range_last_value = @lastVal OUTPUT


select @firstVal, @lastVal

select @@TRANCOUNT, xact_state()

select * from sys.dm_tran_active_transactions


begin tran

select @@TRANCOUNT
begin tran paul with mark;

select @@TRANCOUNT

rollback

select @@TRANCOUNT

