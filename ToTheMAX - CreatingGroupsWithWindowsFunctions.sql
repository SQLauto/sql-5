

IF OBJECT_ID(N'tempdb..#test') IS NOT NULL DROP TABLE #test

CREATE TABLE #test(
	id INT IDENTITY(1,1),
	[name] VARCHAR(30) NOT NULL,
	[age]	INT NULL
)

INSERT INTO #test([name],[age])
VALUES  ('tom',10),
		('dave',null),
		('pete',null),
		('mike',null),
		('eric',13),
		('eric',1),
		('eric',2),
		('eric',null),
		('eric',4),
		('eric',null),
		('eric',null),
		('eric',7),
		('eric',8)

;WITH cte AS (
	SELECT 
		*
		,COUNT(
			CASE WHEN age IS NOT NULL THEN age END	
		) OVER (ORDER BY id) AS Grp	
	FROM #test
)

SELECT 
	 * 
	,MAX(age) OVER (
		PARTITION BY Grp
		--ORDER BY id
		) AgeNoGaps
FROM cte




