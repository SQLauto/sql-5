
CREATE TABLE #temp(
	id INT IDENTITY(1,1) NOT NULL,
	name VARCHAR(20) NOT NULL
)

CREATE TABLE #temp2(
	id INT IDENTITY(1,1) NOT NULL,
	name VARCHAR(20) NOT NULL
)

INSERT INTO #temp
		(name)
OUTPUT
	inserted.*
VALUES
	('pete'),
	('dave'),
	('lionel')
    
INSERT INTO #temp2
		(name)
VALUES
	('peter'),
	('daver')
    

UPDATE #temp
SET name = 'steve'
OUTPUT
	deleted.*, INSERTED.* 
WHERE id = 2



DELETE #temp
OUTPUT deleted.*
WHERE
	id = 4

SELECT * FROM #temp


MERGE #temp T
USING #temp2 S
ON (T.id = S.id)
WHEN MATCHED THEN
	UPDATE 
	SET t.name = s.NAME
OUTPUT
	DELETED.*,  
	INSERTED.*
;

SELECT * FROM #temp
SELECT * FROM #temp2


--GO


DROP TABLE #temp
DROP TABLE #temp2

