	/* This query is testing specific procedure - ProcedureCode  = 429400009 - */
/*please do not add procedures with code 429400009, because it will cause the test to fail  */
	
SET ANSI_WARNINGS OFF 
go 
SET NOCOUNT ON 
go 
SELECT DISTINCT ProcedureId_Root, ProcedureId_Extension, PatientId_Root, PatientId_Extension, ProcedureCode, ProcedureCodeSystem, ProcedureDisplayName, 
                         ProcedureStartDate, StatusCode, StatusCodeSystem
FROM [dbmClinicalAnalyticsGateway].[Fact].[Procedures]
where ProcedureCode  = '429400009'
ORDER BY 2
