

USE test1;


CREATE TABLE dbo.People(
	PeopleId	INT			IDENTITY(1,1)	NOT NULL,
	FirstName	VARCHAR(20)					NOT NULL,
	LastName	VARCHAR(20)					NOT NULL,
	CompanyId	INT							NULL,

	CONSTRAINT	PK_People				PRIMARY KEY		(PeopleId),
	CONSTRAINT	FK_People_Company		FOREIGN KEY		(CompanyId)	REFERENCES dbo.Company(CompanyId),

	INDEX		IDX_People_CompanyId	NONCLUSTERED	(CompanyId)
)

---------------------------------------------------
-- DROP CONSTRAINTS AND INDEX
ALTER TABLE dbo.People
DROP CONSTRAINT PK_PEOPLE;

ALTER TABLE dbo.People
DROP CONSTRAINT FK_People_Company;

DROP INDEX IDX_People_CompanyId ON dbo.People;
---------------------------------------------------



---------------------------------------------------
-- RECREATE CONSTRAINTS AND INDEX
ALTER TABLE dbo.People
ADD CONSTRAINT PK_PEOPLE PRIMARY KEY (PeopleId);

ALTER TABLE dbo.People
ADD CONSTRAINT FK_People_Company	FOREIGN KEY	(CompanyId) REFERENCES Company(CompanyId);

CREATE INDEX IDX_People_CompanyId ON dbo.People(CompanyId);
---------------------------------------------------



--------------------------------------------------------------------------------
-- ALTERNATIVE - CREATED CLUSTERED INDEX WITHOUT CREATING AS A PRIMARY KEY
CREATE CLUSTERED INDEX IDX_People	ON dbo.People(CompanyId)
--------------------------------------------------------------------------------



DROP TABLE dbo.People

