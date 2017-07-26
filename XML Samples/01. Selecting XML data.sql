USE backofficemortgage
GO

SELECT TOP 10  
	ApplicationRef AS '@ApplicationRef',
	TotalApplicants AS 'info/@NumApplicants',
	IsSubmitted AS 'Info/@Submitted',
	StatusNameId AS 'Info/@Status',
	NULL AS 'Info/Data'
FROM 
	dbo.morAppFma_FMAApplication
FOR XML PATH('application'), ELEMENTS XSINIL, ROOT('Applications')


SELECT TOP 10  
	ApplicationRef,
	TotalApplicants,
	IsSubmitted,
	StatusNameId,
	NULL AS OtherValue
FROM 
	dbo.morAppFma_FMAApplication
FOR XML RAW('App'), ELEMENTS XSINIL, ROOT('Applications')


SELECT TOP 10  
	ApplicationRef,
	TotalApplicants,
	IsSubmitted,
	StatusNameId,
	NULL AS OtherValue
FROM 
	dbo.morAppFma_FMAApplication
FOR XML AUTO



