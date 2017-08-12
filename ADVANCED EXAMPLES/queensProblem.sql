

-- queens problem

;with board as (
	select 1 as i, 1 as [row], 1 as [col]
	union all
	select b.i + 1, 1 + floor(b.i / 8) as row, 1 + (b.i % 8) as col 
	from board b where b.i < 64
)


select * 
from board b1
inner join board b2 on b1.col <> b2.col and b1.row / b1.col <> b2.row / b2.col
--inner join board b4
--inner join board b5
--inner join board b6
--inner join board b7
--inner join board b8


