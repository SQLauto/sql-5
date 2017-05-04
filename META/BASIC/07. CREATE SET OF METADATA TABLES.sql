

USE BackOfficeMortgage
go


CREATE TABLE #schema(
	[sid]	INT PRIMARY KEY,
	[schemaName] VARCHAR(200)
)

CREATE TABLE #table (
	[oid]  INT PRIMARY KEY,
	[sid]  INT,
	[tableName] VARCHAR(200),
	[rows] INT,
	[cols] INT
)

INSERT INTO #schema([sid],[schemaName])
SELECT schema_id, name FROM sys.schemas

INSERT INTO #table([oid],[sid],[tableName])
SELECT object_id, schema_id, name FROM sys.tables

SELECT * FROM #schema
SELECT * FROM #table


DROP TABLE #table
DROP TABLE #schema

