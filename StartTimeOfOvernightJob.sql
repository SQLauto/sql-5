
-- Defines the hour of the day when a new day starts
DECLARE @DayDivision INT = 12

IF OBJECT_ID(N'tempdb..#StartTimes') IS NOT NULL DROP TABLE #StartTimes

CREATE TABLE #StartTimes(
	start DATETIME NOT NULL
)

INSERT INTO #StartTimes
VALUES 
	 ('2018-01-09 00:01:38.000')
	,('2018-01-09 23:43:22.000')
,('2018-01-09 03:43:22.000')
,('2018-01-09 04:43:22.000')
,('2018-01-09 05:43:22.000')


SELECT 
	-- 3. Add the number of seconds to a day starting at the 
	--    day division hour, then extract the time portion
	CAST(DATEADD(SECOND,
		-- 2. Average number of seconds
		AVG(
			-- 1. Get the number of seconds from the day division point (@DayDivision)
			DATEDIFF(SECOND, 
				CASE WHEN DATEPART(HOUR,start) < @DayDivision THEN
					SMALLDATETIMEFROMPARTS(YEAR(DATEADD(DAY,-1,start)),MONTH(DATEADD(DAY,-1,start)),DAY(DATEADD(DAY,-1,start)),@DayDivision,0)
				ELSE
					SMALLDATETIMEFROMPARTS(YEAR(start),MONTH(start),DAY(start),@DayDivision,0)
				END
			,start)
		)
	,'01 jan 1900 ' + CAST(@DayDivision AS VARCHAR(2)) + ':00') AS TIME) AS AverageStartTime
FROM #StartTimes

