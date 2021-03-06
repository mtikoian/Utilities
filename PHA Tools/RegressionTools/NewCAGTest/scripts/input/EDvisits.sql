USE [dbmSemanticAnalytics]
GO

DELETE fact.EDVisits WHERE id_Patient > 1000

SET IDENTITY_INSERT [Fact].[EDVisits] ON

  declare @StartDate int 
  
  SET @StartDate = 
  (select dbmsemanticanalyticsstg.dbo.convert_date(Dateadd(month, Datediff(month, -1, Getdate()) - 4, -1)))

INSERT [Fact].[EDVisits] (
	[id_EDVisit]
	,[id_Patient]
	,[id_RelatedAdmission]
	,[org_Assigned]
	,[org_EDUnit]
	,[org_Referring]
	,[provider_Referring]
	,[provider_Attending]
	,[provider_Related]
	,[date_Visit]
	,[date_VisitTime]
	,[date_VisitDischarge]
	,[date_VisitDischargeTime]
	,[attrib_Status]
	,[attrib_Priority]
	,[attrib_EncounterType]
	,[attrib_ServiceLine]
	,[attrib_DischargeDisposition]
	,[attrib_ReferralSource]
	,[attrib_EDDiagnosisPrimary]
	,[attrib_SourceSystem]
	,[attrib_PatientResidency]
	,[attrib_PatientAge]
	,[range_LOS]
	,[measure_EDInd]
	,[measure_LengthOfStayMinutes]
	,[measure_EDDeathInd]
	,[measure_UrgentEDVisitInd]
	,[measure_AgeInDays]
	,[sys_PartitionDate]
	,[Bookmark]
	,[TimeStamp]
	)
VALUES (
	3001
	,1001
	,- 1
	,5
	,- 1
	,2
	,34
	,32
	,11
	,@StartDate
	,183900
	,null
	,null
	,- 1
	,618670
	,- 1
	,- 1
	,617592
	,- 1
	,- 1
	,- 1
	,91772
	,10950
	,0
	,1
	,12960
	,0
	,0
	,10950
	,201502
	,15
	,CAST(0x0000A49F010FA842 AS DATETIME)
	)


INSERT [Fact].[EDVisits] (
	[id_EDVisit]
	,[id_Patient]
	,[id_RelatedAdmission]
	,[org_Assigned]
	,[org_EDUnit]
	,[org_Referring]
	,[provider_Referring]
	,[provider_Attending]
	,[provider_Related]
	,[date_Visit]
	,[date_VisitTime]
	,[date_VisitDischarge]
	,[date_VisitDischargeTime]
	,[attrib_Status]
	,[attrib_Priority]
	,[attrib_EncounterType]
	,[attrib_ServiceLine]
	,[attrib_DischargeDisposition]
	,[attrib_ReferralSource]
	,[attrib_EDDiagnosisPrimary]
	,[attrib_SourceSystem]
	,[attrib_PatientResidency]
	,[attrib_PatientAge]
	,[range_LOS]
	,[measure_EDInd]
	,[measure_LengthOfStayMinutes]
	,[measure_EDDeathInd]
	,[measure_UrgentEDVisitInd]
	,[measure_AgeInDays]
	,[sys_PartitionDate]
	,[Bookmark]
	,[TimeStamp]
	)
VALUES (
	3002
	,1002
	,- 1
	,11
	,- 1
	,2
	,34
	,32
	,11
	,@StartDate
	,183900
	,null
	,null
	,- 1
	,618670
	,- 1
	,- 1
	,617592
	,- 1
	,- 1
	,- 1
	,91772
	,13140
	,0
	,1
	,12960
	,0
	,0
	,13140
	,201502
	,16
	,CAST(0x0000A49F010FA842 AS DATETIME)
	)


INSERT [Fact].[EDVisits] (
	[id_EDVisit]
	,[id_Patient]
	,[id_RelatedAdmission]
	,[org_Assigned]
	,[org_EDUnit]
	,[org_Referring]
	,[provider_Referring]
	,[provider_Attending]
	,[provider_Related]
	,[date_Visit]
	,[date_VisitTime]
	,[date_VisitDischarge]
	,[date_VisitDischargeTime]
	,[attrib_Status]
	,[attrib_Priority]
	,[attrib_EncounterType]
	,[attrib_ServiceLine]
	,[attrib_DischargeDisposition]
	,[attrib_ReferralSource]
	,[attrib_EDDiagnosisPrimary]
	,[attrib_SourceSystem]
	,[attrib_PatientResidency]
	,[attrib_PatientAge]
	,[range_LOS]
	,[measure_EDInd]
	,[measure_LengthOfStayMinutes]
	,[measure_EDDeathInd]
	,[measure_UrgentEDVisitInd]
	,[measure_AgeInDays]
	,[sys_PartitionDate]
	,[Bookmark]
	,[TimeStamp]
	)
VALUES (
	3004
	,1004
	,- 1
	,11
	,- 1
	,2
	,34
	,32
	,11
	,@StartDate
	,183900
	,null
	,null
	,- 1
	,618670
	,- 1
	,- 1
	,617592
	,- 1
	,- 1
	,- 1
	,91772
	,8030
	,0
	,1
	,12960
	,0
	,0
	,8030
	,201502
	,17
	,CAST(0x0000A49F010FA842 AS DATETIME)
	)


INSERT [Fact].[EDVisits] (
	[id_EDVisit]
	,[id_Patient]
	,[id_RelatedAdmission]
	,[org_Assigned]
	,[org_EDUnit]
	,[org_Referring]
	,[provider_Referring]
	,[provider_Attending]
	,[provider_Related]
	,[date_Visit]
	,[date_VisitTime]
	,[date_VisitDischarge]
	,[date_VisitDischargeTime]
	,[attrib_Status]
	,[attrib_Priority]
	,[attrib_EncounterType]
	,[attrib_ServiceLine]
	,[attrib_DischargeDisposition]
	,[attrib_ReferralSource]
	,[attrib_EDDiagnosisPrimary]
	,[attrib_SourceSystem]
	,[attrib_PatientResidency]
	,[attrib_PatientAge]
	,[range_LOS]
	,[measure_EDInd]
	,[measure_LengthOfStayMinutes]
	,[measure_EDDeathInd]
	,[measure_UrgentEDVisitInd]
	,[measure_AgeInDays]
	,[sys_PartitionDate]
	,[Bookmark]
	,[TimeStamp]
	)
VALUES (
	3006
	,1006
	,- 1
	,14
	,- 1
	,2
	,34
	,32
	,11
	,@StartDate
	,183900
	,null
	,null
	,- 1
	,618670
	,- 1
	,- 1
	,617592
	,- 1
	,- 1
	,- 1
	,91772
	,9125
	,0
	,1
	,12960
	,0
	,0
	,9125
	,201502
	,19
	,CAST(0x0000A49F010FA842 AS DATETIME)
	)
GO

SET IDENTITY_INSERT [Fact].[EDVisits] OFF
GO


