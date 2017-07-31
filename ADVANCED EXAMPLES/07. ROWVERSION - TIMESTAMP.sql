
USE test1

IF OBJECT_ID(N'dbo.films') IS NOT NULL
	DROP TABLE dbo.films;

CREATE TABLE films(
	id			INT IDENTITY(1,1)	NOT NULL PRIMARY KEY,
	filmName	NVARCHAR(100)		NOT NULL,
	rating		VARCHAR(5)			NOT NULL,
	versionId	TIMESTAMP
)

INSERT INTO dbo.films(filmName, rating)
VALUES
	('The Godfather','*'),
	('Newsroom','*')


UPDATE dbo.films
SET rating = '**'
WHERE id = 2


SELECT * FROM films





