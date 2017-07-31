

SELECT 
	reverse(stuff('0000000000',1,len(firstname),reverse(firstname))), 
	quotename(firstname), 
	lastname 
FROM 
	person.person



	select 
	'y' + space(10) + 'x',
	quotename('reason','"'), 
	difference('cat','dog')


	select stuff((
		select ',' + firstname from person.person for xml path('')
	),1,1,'');


