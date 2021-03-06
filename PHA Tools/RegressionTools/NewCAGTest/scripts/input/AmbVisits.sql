USE [dbmSemanticAnalytics]
GO

DELETE Fact.AmbulatoryVisits where id_Patient > 1000

SET IDENTITY_INSERT [Fact].[AmbulatoryVisits] ON
GO

  declare @StartDate int 
  
  SET @StartDate = 
  (select dbmsemanticanalyticsstg.dbo.convert_date(Dateadd(month, Datediff(month, -1, Getdate()) - 4, -1)))


INSERT [Fact].[AmbulatoryVisits] (
	[id_AmbulatoryVisit]
	,[id_Encounter]
	,[id_Patient]
	,[org_Assigned]
	,[org_Unit]
	,[org_Referring]
	,[provider_Referring]
	,[provider_Attending]
	,[provider_Related]
	,[date_Visit]
	,[date_VisitTime]
	,[attrib_Status]
	,[attrib_Priority]
	,[attrib_EncounterType]
	,[attrib_ServiceLine]
	,[attrib_DischargeDisposition]
	,[attrib_ReferralSource]
	,[attrib_VisitDiagnosisPrimary]
	,[attrib_SourceSystem]
	,[attrib_PatientResidency]
	,[attrib_PatientAge]
	,[measure_VisitInd]
	,[measure_AgeInDays]
	,[sys_PartitionDate]
	,[Bookmark]
	,[TimeStamp]
	)
VALUES (
	2001
	,2001
	,1001
	,5
	,2
	,7
	,11
	,11
	,11
	,@StartDate
	,10000
	,- 1
	,463537
	,- 1
	,- 1
	,617592
	,- 1
	,- 1
	,- 1
	,91770
	,10950
	,1
	,10950
	,201502
	,98
	,CAST(0x0000A49F010FA7E3 AS DATETIME)
	)


INSERT [Fact].[AmbulatoryVisits] (
	[id_AmbulatoryVisit]
	,[id_Encounter]
	,[id_Patient]
	,[org_Assigned]
	,[org_Unit]
	,[org_Referring]
	,[provider_Referring]
	,[provider_Attending]
	,[provider_Related]
	,[date_Visit]
	,[date_VisitTime]
	,[attrib_Status]
	,[attrib_Priority]
	,[attrib_EncounterType]
	,[attrib_ServiceLine]
	,[attrib_DischargeDisposition]
	,[attrib_ReferralSource]
	,[attrib_VisitDiagnosisPrimary]
	,[attrib_SourceSystem]
	,[attrib_PatientResidency]
	,[attrib_PatientAge]
	,[measure_VisitInd]
	,[measure_AgeInDays]
	,[sys_PartitionDate]
	,[Bookmark]
	,[TimeStamp]
	)
VALUES (
	2002
	,2002
	,1002
	,11
	,2
	,7
	,11
	,11
	,11
	,@StartDate
	,10000
	,- 1
	,463537
	,- 1
	,- 1
	,617592
	,- 1
	,- 1
	,- 1
	,91770
	,13140
	,1
	,13140
	,201502
	,99
	,CAST(0x0000A49F010FA7E3 AS DATETIME)
	)


INSERT [Fact].[AmbulatoryVisits] (
	[id_AmbulatoryVisit]
	,[id_Encounter]
	,[id_Patient]
	,[org_Assigned]
	,[org_Unit]
	,[org_Referring]
	,[provider_Referring]
	,[provider_Attending]
	,[provider_Related]
	,[date_Visit]
	,[date_VisitTime]
	,[attrib_Status]
	,[attrib_Priority]
	,[attrib_EncounterType]
	,[attrib_ServiceLine]
	,[attrib_DischargeDisposition]
	,[attrib_ReferralSource]
	,[attrib_VisitDiagnosisPrimary]
	,[attrib_SourceSystem]
	,[attrib_PatientResidency]
	,[attrib_PatientAge]
	,[measure_VisitInd]
	,[measure_AgeInDays]
	,[sys_PartitionDate]
	,[Bookmark]
	,[TimeStamp]
	)
VALUES (
	2004
	,2004
	,1004
	,11
	,2
	,7
	,11
	,11
	,11
	,@StartDate
	,10000
	,- 1
	,463537
	,- 1
	,- 1
	,617592
	,- 1
	,- 1
	,- 1
	,91770
	,8030
	,1
	,8030
	,201502
	,100
	,CAST(0x0000A49F010FA7E3 AS DATETIME)
	)


INSERT [Fact].[AmbulatoryVisits] (
	[id_AmbulatoryVisit]
	,[id_Encounter]
	,[id_Patient]
	,[org_Assigned]
	,[org_Unit]
	,[org_Referring]
	,[provider_Referring]
	,[provider_Attending]
	,[provider_Related]
	,[date_Visit]
	,[date_VisitTime]
	,[attrib_Status]
	,[attrib_Priority]
	,[attrib_EncounterType]
	,[attrib_ServiceLine]
	,[attrib_DischargeDisposition]
	,[attrib_ReferralSource]
	,[attrib_VisitDiagnosisPrimary]
	,[attrib_SourceSystem]
	,[attrib_PatientResidency]
	,[attrib_PatientAge]
	,[measure_VisitInd]
	,[measure_AgeInDays]
	,[sys_PartitionDate]
	,[Bookmark]
	,[TimeStamp]
	)
VALUES (
	2006
	,2006
	,1006
	,14
	,2
	,7
	,11
	,11
	,11
	,@StartDate
	,10000
	,- 1
	,463537
	,- 1
	,- 1
	,617592
	,- 1
	,- 1
	,- 1
	,91770
	,9125
	,1
	,9125
	,201502
	,102
	,CAST(0x0000A49F010FA7E3 AS DATETIME)
	)
GO

SET IDENTITY_INSERT [Fact].[AmbulatoryVisits] OFF
GO


