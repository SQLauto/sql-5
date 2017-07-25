
;WITH cte AS (
	SELECT object_name(id) AS [tbl], rows
	FROM sysindexes
	WHERE indid IN (0, 1) 
)

SELECT * FROM cte
WHERE LEFT(tbl,3) <> 'sys'
AND rows > 0
ORDER BY tbl


