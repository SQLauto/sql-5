

;WITH mycte(i)
AS (
SELECT 1 as i
Union ALL
SELECT i +1 as seq FROM mycte WHERE i < 8)
 --select * from mycte

SELECT m1.i AS n1, m2.i AS n2, m3.i AS n3, m4.i AS n4
, m5.i AS n5, m6.i AS n6, m7.i AS n7, m8.i AS n8
FROM mycte AS m1
      CROSS JOIN mycte AS m2
      CROSS JOIN mycte AS m3
      CROSS JOIN mycte AS m4   
      CROSS JOIN mycte AS m5   
      CROSS JOIN mycte AS m6   
      CROSS JOIN mycte AS m7   
      CROSS JOIN mycte AS m8   

WHERE		 m1.i NOT IN (m2.i, m3.i, m4.i, m5.i, m6.i, m7.i, m8.i)
		 AND m2.i NOT IN (m3.i, m4.i, m5.i, m6.i, m7.i, m8.i)
		 AND m3.i NOT IN (m4.i, m5.i, m6.i, m7.i, m8.i)
		 AND m4.i NOT IN (m5.i, m6.i, m7.i, m8.i)
		 AND m5.i NOT IN (m6.i, m7.i, m8.i)
		 AND m6.i NOT IN (m7.i, m8.i)
		 AND m7.i NOT IN (m8.i)
AND
	1 - m1.i <> 2 - m2.i AND
	1 - m1.i <> 3 - m3.i AND
	1 - m1.i <> 4 - m4.i AND
	1 - m1.i <> 5 - m5.i AND
	1 - m1.i <> 6 - m6.i AND
	1 - m1.i <> 7 - m7.i AND
	1 - m1.i <> 8 - m8.i
AND
	2 - m2.i <> 3 - m3.i AND
	2 - m2.i <> 4 - m4.i AND
	2 - m2.i <> 5 - m5.i AND
	2 - m2.i <> 6 - m6.i AND
	2 - m2.i <> 7 - m7.i AND
	2 - m2.i <> 8 - m8.i
AND
	3 - m3.i <> 4 - m4.i AND
	3 - m3.i <> 5 - m5.i AND
	3 - m3.i <> 6 - m6.i AND
	3 - m3.i <> 7 - m7.i AND
	3 - m3.i <> 8 - m8.i
AND
	4 - m4.i <> 5 - m5.i AND
	4 - m4.i <> 6 - m6.i AND
	4 - m4.i <> 7 - m7.i AND
	4 - m4.i <> 8 - m8.i
AND
	5 - m5.i <> 6 - m6.i AND
	5 - m5.i <> 7 - m7.i AND
	5 - m5.i <> 8 - m8.i
AND
	6 - m6.i <> 7 - m7.i AND
	6 - m6.i <> 8 - m8.i
AND
	7 - m7.i <> 8 - m8.i


AND
	1 + m1.i <> 2 + m2.i AND
	1 + m1.i <> 3 + m3.i AND
	1 + m1.i <> 4 + m4.i AND
	1 + m1.i <> 5 + m5.i AND
	1 + m1.i <> 6 + m6.i AND
	1 + m1.i <> 7 + m7.i AND
	1 + m1.i <> 8 + m8.i
AND
	2 + m2.i <> 3 + m3.i AND
	2 + m2.i <> 4 + m4.i AND
	2 + m2.i <> 5 + m5.i AND
	2 + m2.i <> 6 + m6.i AND
	2 + m2.i <> 7 + m7.i AND
	2 + m2.i <> 8 + m8.i
AND
	3 + m3.i <> 4 + m4.i AND
	3 + m3.i <> 5 + m5.i AND
	3 + m3.i <> 6 + m6.i AND
	3 + m3.i <> 7 + m7.i AND
	3 + m3.i <> 8 + m8.i
AND
	4 + m4.i <> 5 + m5.i AND
	4 + m4.i <> 6 + m6.i AND
	4 + m4.i <> 7 + m7.i AND
	4 + m4.i <> 8 + m8.i
AND
	5 + m5.i <> 6 + m6.i AND
	5 + m5.i <> 7 + m7.i AND
	5 + m5.i <> 8 + m8.i
AND
	6 + m6.i <> 7 + m7.i AND
	6 + m6.i <> 8 + m8.i
AND
	7 + m7.i <> 8 + m8.i


ORDER BY 
	m1.i,
	m2.i,
	m3.i,
	m4.i,
	m5.i,
	m6.i,
	m7.i,
	m8.i

--					and b2.row - b2.col <> b1.row - b1.col
--					and b2.row + b2.col <> b1.row + b1.col

