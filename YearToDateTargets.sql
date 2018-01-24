
DECLARE @TargetDate DATETIME = '01 mar 2018'

IF OBJECT_ID(N'tempdb..#temp') IS NOT NULL DROP TABLE #temp

;WITH cte AS (
	SELECT CAST('01 jan 2018' AS DATE) AS dateid
	UNION ALL
	SELECT dateadd(month,1,dateid) FROM cte 
	WHERE MONTH(dateid) <> 12 
)


SELECT dateid,'averageLoan' AS [TargetName], month(dateid) AS [Target] INTO #temp FROM cte
UNION ALL
SELECT dateid,'target_1', 2 AS [Target] FROM cte
UNION ALL
SELECT dateid,'target_2', 3 AS [Target] FROM cte
UNION ALL
SELECT dateid,'target_3', 4 AS [Target] FROM cte
UNION ALL
SELECT dateid,'target_4', 5 AS [Target] FROM cte


SELECT 
	t1.targetName					AS TargetName, 
	SUM(t1.[target] * t2.[target])	AS TargetValue

FROM		#temp t1 
INNER JOIN	#temp t2	ON t1.dateid = t2.dateid

WHERE 
	MONTH(t1.dateid) <= MONTH(@TargetDate)
AND 
	t1.targetName <> 'averageLoan'
AND 
	t2.targetName = 'averageLoan'
GROUP BY 
	t1.targetName





