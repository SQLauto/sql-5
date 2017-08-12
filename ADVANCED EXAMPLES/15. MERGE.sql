
CREATE TABLE #temp1(
	id			INT				IDENTITY(1,1)	NOT NULL PRIMARY KEY,
	firstname	VARCHAR(20)						NULL,
	lastname	VARCHAR(20)						NULL
)

CREATE TABLE #temp2(
	id			INT				IDENTITY(1,1)	NOT NULL PRIMARY KEY,
	firstname	VARCHAR(20)						NULL,
	lastname	VARCHAR(20)						NULL
)


INSERT INTO #temp1(firstname, lastname)
VALUES
	('richard','cheese'),
	('dave','blue'),
	('m','ski'),
	('dave','blue2')

INSERT INTO #temp2(firstname, lastname)
VALUES
	('richard','smith'),
	('dave','thompson'),
	('mickey','drool')


MERGE #temp1 AS T
USING #temp2 AS S
ON (T.id = s.id and t.firstname = s.firstname)
WHEN NOT MATCHED BY TARGET THEN	
	INSERT (FIRSTNAME, LASTNAME) VALUES(S.FIRSTNAME, S.LASTNAME)
WHEN NOT MATCHED BY SOURCE THEN	
	DELETE
WHEN MATCHED THEN 
	UPDATE SET T.LastName = S.LastName
;



SELECT * FROM #temp1
SELECT * FROM #temp2

DROP TABLE #temp1
DROP TABLE #temp2





