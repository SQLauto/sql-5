



USE cards

/*
truncate table atest

INSERT INTO atest(name, age)
VALUES
	('peter', 20),
	('paul',21),
	('john',22),
	('mark',23)

*/


IF object_id('tempdb..#temp') IS NOT NULL
	DROP TABLE #temp

CREATE TABLE #temp(
	id		INT				IDENTITY(1,1)		PRIMARY KEY		NOT NULL,
	[name]	VARCHAR(200)										NOT NULL,
	age		INT													NOT NULL
)  

INSERT INTO #temp(name, age)
VALUES
	('peter', 20),
	('paul',31),
	('john',22),
	('mark',33)



SELECT * FROM #temp


SELECT * FROM atest


MERGE 
INTO	atest	a
USING	#temp	t 
ON		A.NAME = t.name AND a.age = t.age

WHEN MATCHED THEN
--	DELETE 
	UPDATE SET a.age = a.age + 100
--WHEN NOT MATCHED THEN
--	INSERT ([name],[age]) VALUES (t.NAME, t.age)
WHEN NOT MATCHED BY TARGET THEN
	DELETE
OUTPUT inserted.*, $ACTION, DELETED.*
;


