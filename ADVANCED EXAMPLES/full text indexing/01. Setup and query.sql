USE auditor


SELECT 
	AuditItem.xmlInfo.query('
		for $i in C_/S_/C_
		return <table>{data($i/@t_)}</table>
	')
FROM
	(
		SELECT TOP 10 *, 
			CAST(CAST(auditxml AS NTEXT) AS XML) xmlInfo
		FROM dbo.audit_AuditItem
		WHERE EntityType =  'FMAApplication'
	)	AuditItem




SELECT SERVERPROPERTY('IsFullTextInstalled')

USE AdventureWorksR2
SELECT * FROM sys.fulltext_catalogs

SELECT * FROM sys.fulltext_indexes



SELECT * FROM sys.fulltext_document_types
SELECT * FROM sys.fulltext_languages

EXEC sys.sp_help_fulltext_system_components 'filter'


SELECT * FROM sys.fulltext_stoplists
SELECT * FROM sys.fulltext_stopwords


USE test1

CREATE TABLE mySampleData(
	id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	name NVARCHAR(200) NOT NULL,
	personalStatement NVARCHAR(MAX) NULL
)

INSERT INTO mySampleData(name, personalStatement)
VALUES
	('peter','before he went to college he went to st georges, later he went to london and canterbury'),
	('paul','went to st georges, went to chelsea, went to leicester, went to japan'),
	('david','went to st georges, went to chelsea, went to bristol, went to glasgow'),
	('travis','went to bristol, went to glasgow')

INSERT INTO mySampleData(name, personalStatement)
VALUES
	('travis','went to bristol, went to glasgow')


SELECT * FROM mySampleData2 WHERE CONTAINS(personalStatement,'bristol')

SELECT * FROM mySampleData WHERE FREETEXT(personalStatement,'george')



CREATE TABLE mySampleData2(
	id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	name NVARCHAR(200) NOT NULL,
	personalStatement NVARCHAR(MAX) NULL
)

INSERT INTO mySampleData2(name, personalStatement)
VALUES
	('peter','before he went to college he went to st georges, later he went to london and canterbury'),
	('paul','went to st georges, went to chelsea, went to leicester, went to japan'),
	('david','went to st georges, went to chelsea, went to bristol, went to glasgow'),

SELECT * FROM mySampleData2 WHERE CONTAINS(personalStatement,'salvatorian')



CREATE FULLTEXT CATALOG ftCatalogSampleData2;  
GO  

CREATE FULLTEXT INDEX ON dbo.mySampleData2(
	personalStatement Language 1033
) 
	KEY INDEX PK__mySample__3213E83FF7347B94
	ON ftCatalogSampleData2;  
GO  


SELECT * FROM 
	mySampleData
	CROSS APPLY 
		CONTAINSTABLE( mySampleData, personalStatement, 'bristol') ct
WHERE 
	mySampleData.id = ct.[key]

