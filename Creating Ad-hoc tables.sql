

        -- set up temp table
		IF OBJECT_ID(N'tempdb..#temp') IS NOT NULL 
			DROP TABLE #temp
        
		CREATE TABLE #temp
			(
			 id INT IDENTITY(1, 1)
					NOT NULL
			,Reference VARCHAR(20) NOT NULL
			,DirectDebit MONEY NOT NULL
			)
        
		INSERT	INTO #temp
				(Reference, DirectDebit)
		VALUES	('00200', 300)
        		,
				('00201', 600)
        		,
				('00202', 900)
        
		-- cross join with values created table
;
		WITH	cte
				  AS (
					  SELECT	*
							   ,COUNT(T.id) OVER (PARTITION BY T.id) AS NumberOfDates
					  FROM		#temp T
					  CROSS JOIN ( VALUES ( CAST('10 may 2008' AS DATE))
        		, ( CAST('10 june 2008' AS DATE))
        		, ( CAST('10 july 2008' AS DATE)) ) X (refDate)
					 )
			SELECT	*
				   ,DirectDebit / NumberOfDates
			FROM	cte
			ORDER BY reference

`


		IF OBJECT_ID(N'tempdb..#temp') IS NOT NULL 
			DROP TABLE #temp
        
		SELECT	A.dt
		INTO	#temp
		FROM	( VALUES ( CAST('10 may 2008' AS DATE))
        , ( CAST('10 june 2008' AS DATE))
        , ( CAST('10 july 2008' AS DATE)) ) A (dt)
		SELECT	*
		FROM	#temp






