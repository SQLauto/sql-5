
IF OBJECT_ID(N'tempdb..#temp') IS NOT NULL DROP TABLE #temp

CREATE TABLE #temp(
	id INT IDENTITY(1,1) NOT NULL
  ,[name] VARCHAR(20) NOT NULL
  ,[score] INT NOT NULL  
)


INSERT INTO #temp ([name],[score])
VALUES 
	('dave',10),
	('pete',12),
	('mike',13),
	('tim',14),
	('tony',20),
	('eric',21),
	('max',22),
	('steve',23),
	('sal',26),
	('vin',27)

;WITH cte AS (
	SELECT 
		* 
		,
		CASE WHEN 
			lead(score) OVER (ORDER BY score) - score = 1 
			AND 
			(lag(score) OVER (ORDER BY score) - score) <> -1 THEN 1
			WHEN 
			lead(score) OVER (ORDER BY score) - score <> 1 
			AND 
			(lag(score) OVER (ORDER BY score) - score) = -1 THEN 2
			WHEN 

				lead(score) OVER (ORDER BY score) is NULL 
				AND
			(lag(score) OVER (ORDER BY score) - score) = -1 THEN 2
				 

		END AS Points
		--COALESCE(
		--	lead(score) OVER (ORDER BY score) - score 
		--	,(lag(score) OVER (ORDER BY score) - score) * -1 
		--) = 1 THEN 1 ELSE 0 END AS [diff]			
	FROM #temp
)

, CTE2 AS (
	SELECT 
		 * 
		,CASE WHEN points = 1 THEN score ELSE lag(score) OVER (ORDER BY score) END AS StartGroup
		,CASE WHEN points = 2 THEN score ELSE lead(score) OVER (ORDER BY score) END	AS EndGroup
	FROM cte
	WHERE points IS NOT NULL
)

SELECT 
	 DISTINCT
	 StartGroup
	,EndGroup 
FROM 
	CTE2

--SELECT DISTINCT COUNT(startGroup) OVER(ORDER BY startGroup) / 2, StartGroup,EndGroup FROM CTE2

