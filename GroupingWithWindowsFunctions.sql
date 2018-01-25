

IF OBJECT_ID(N'tempdb..#CreditHistory') IS NOT NULL DROP TABLE #CreditHistory;

CREATE TABLE #CreditHistory(
	 id				INT			IDENTITY(1,1)	NOT NULL
	,[name]			VARCHAR(20)					NOT NULL	
	,[status]		CHAR(1)						NULL
	,[dtRecorded]	DATE						NOT NULL
)


INSERT INTO #CreditHistory([name],[status],[dtRecorded])
VALUES  ('dave',	'5', '20170101')
	   ,('dave',	'5', '20170201')
	   ,('dave',	'5', '20170301')
	   ,('dave',	'4', '20170401')
	   ,('dave',	'I', '20170501')
	   ,('dave',	'I', '20170601')
	   ,('dave',	'I', '20170701')
	   ,('dave',	'I', '20170801')
	   ,('dave',	'0', '20170901')
	   ,('dave',	'I', '20171001')
	   ,('dave',	'1', '20171101')
	   ,('dave',	'2', '20171201')
	   ,('mike',	'I', '20170101')
	   ,('mike',	'1', '20170201')
	   ,('mike',	'2', '20170301')
	   ,('mike',	'3', '20170401')
	   ,('mike',	'4', '20170501')
	   ,('mike',	'I', '20170601')
	   ,('mike',	'I', '20170701')
	   ,('mike',	'1', '20170801')
	   ,('mike',	'2', '20170901')
	   ,('mike',	'I', '20171001')
	   ,('mike',	'I', '20171101')
	   ,('mike',	'0', '20171201')
	   
/*=================================================================================================
STEP 1:
		Use the CTE to identify the groups that each record falls into.
=================================================================================================*/
;WITH CTE_GROUPED AS (
	SELECT 
		 [id]
		,[name]
		,[status] 
		,[dtRecorded]
		 -- COUNT: Only counts non null values!
		,COUNT(
				-- CASE: returns null when you want it to be grouped with values above
				CASE WHEN [status] = 'I' THEN NULL ELSE [status] END
		 ) 
		 OVER (PARTITION BY [name] ORDER BY [name], [dtRecorded]) AS [grouping]

	FROM #CreditHistory
)


/*=================================================================================================
STEP 2:
		Return the results with the new status value.
		The [grouping] field is used to limit the max of the status- which is the newStatus
=================================================================================================*/
SELECT 
	 [id]
	,[name]
	,[status]
	,[dtRecorded]
	,[grouping] 

	 -- MAX: Discards null values
	,MAX(CASE WHEN [status] = 'I' THEN NULL ELSE [status] END) 
	 -- Add [grouping] to the partition clause to limit the max calculation 
	 OVER (PARTITION BY [name],[grouping] ORDER BY [name],[dtRecorded]) AS [newStatus]

FROM CTE_GROUPED

