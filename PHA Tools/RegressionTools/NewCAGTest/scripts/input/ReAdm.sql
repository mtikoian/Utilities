USE [dbmSemanticAnalytics]
GO

DELETE [Fact].[Readmissions] where id_Patient > 1000

  declare @StartDate int 
  declare @EndDate int 

  SET @StartDate = 
  (select dbmsemanticanalyticsstg.dbo.convert_date(Dateadd(month, Datediff(month, -1, Getdate()) - 4, -1)))

  SET @EndDate = 
  (select dbmsemanticanalyticsstg.dbo.convert_date(Dateadd(month, Datediff(month, -1, Getdate()) - 3, -1))) 

INSERT [Fact].[Readmissions] (
	[id_IndexAdmission]
	,[id_Readmission]
	,[id_FUV]
	,[id_Patient]
	,[org_Assigned_IndexAdm]
	,[org_Referring_IndexAdm]
	,[org_DischargingUnit_IndexAdm]
	,[org_RelatedProvider_IndexAdm]
	,[org_Assigned_Readm]
	,[org_Referring_Readm]
	,[org_DischargingUnit_Readm]
	,[org_RelatedProvider_Readm]
	,[provider_Referring_IndexAdm]
	,[provider_Discharging_IndexAdm]
	,[provider_Admitting_IndexAdm]
	,[provider_Related_IndexAdm]
	,[provider_Attending_IndexAdm]
	,[provider_Referring_Readm]
	,[provider_Discharging_Readm]
	,[provider_Admitting_Readm]
	,[provider_Related_Readm]
	,[provider_Attending_Readm]
	,[date_IndexAdmission]
	,[date_DischargeIndexAdmission]
	,[date_Readmission]
	,[date_DischargeReadmission]
	,[attrib_PatientAge]
	,[attrib_Cohort]
	,[attrib_AdmissionDiagnosisPrimary_IndexAdm]
	,[attrib_DischargeDiagnosisPrimary_IndexAdm]
	,[attrib_ReadmissionDiagnosisPrimary]
	,[attrib_ReadmissionDischargeDiagnosisPrimary]
	,[attrib_UrgentAdmissionInd_IndexAdm]
	,[attrib_UrgentReadmissionInd]
	,[attrib_DeathDuringReadmissionInd]
	,[attrib_SameDischargeFacilityInd]
	,[range_LOS_IndexAdmission]
	,[range_LOS_Readmission]
	,[range_TimeBetweenAdmissions]
	,[range_TimeToFUV]
	,[mesure_IndexAdmissionInd]
	,[measure_ReadmissionInd]
	,[measure_FUV_7Day_Ind]
	,[measure_FUV_30Day_Ind]
	,[measure_AgeInDays_IndexAdm]
	,[measure_LengthOfStay_IndexAdm]
	,[measure_LengthOfStay_Readmission]
	,[measure_TimeBetweenAdmissions]
	,[measure_TimeToFUV]
	,[sys_PartitionDate]
	,[LACEScore]
	)
VALUES (
	1001
	,1010
	,- 1
	,1001
	,5
	,5
	,- 1
	,2
	,5
	,5
	,- 1
	,2
	,31
	,- 1
	,29
	,11
	,30
	,34
	,- 1
	,32
	,11
	,33
	,20130403
	,20130419
	,@StartDate
	,@EndDate
	,16451
	,80
	,- 1
	,- 1
	,- 1
	,- 1
	,0
	,0
	,0
	,1
	,16
	,7
	,24
	,- 1
	,1
	,1
	,NULL
	,NULL
	,10950
	,384
	,168
	,24
	,NULL
	,201304
	,10
	)


INSERT [Fact].[Readmissions] (
	[id_IndexAdmission]
	,[id_Readmission]
	,[id_FUV]
	,[id_Patient]
	,[org_Assigned_IndexAdm]
	,[org_Referring_IndexAdm]
	,[org_DischargingUnit_IndexAdm]
	,[org_RelatedProvider_IndexAdm]
	,[org_Assigned_Readm]
	,[org_Referring_Readm]
	,[org_DischargingUnit_Readm]
	,[org_RelatedProvider_Readm]
	,[provider_Referring_IndexAdm]
	,[provider_Discharging_IndexAdm]
	,[provider_Admitting_IndexAdm]
	,[provider_Related_IndexAdm]
	,[provider_Attending_IndexAdm]
	,[provider_Referring_Readm]
	,[provider_Discharging_Readm]
	,[provider_Admitting_Readm]
	,[provider_Related_Readm]
	,[provider_Attending_Readm]
	,[date_IndexAdmission]
	,[date_DischargeIndexAdmission]
	,[date_Readmission]
	,[date_DischargeReadmission]
	,[attrib_PatientAge]
	,[attrib_Cohort]
	,[attrib_AdmissionDiagnosisPrimary_IndexAdm]
	,[attrib_DischargeDiagnosisPrimary_IndexAdm]
	,[attrib_ReadmissionDiagnosisPrimary]
	,[attrib_ReadmissionDischargeDiagnosisPrimary]
	,[attrib_UrgentAdmissionInd_IndexAdm]
	,[attrib_UrgentReadmissionInd]
	,[attrib_DeathDuringReadmissionInd]
	,[attrib_SameDischargeFacilityInd]
	,[range_LOS_IndexAdmission]
	,[range_LOS_Readmission]
	,[range_TimeBetweenAdmissions]
	,[range_TimeToFUV]
	,[mesure_IndexAdmissionInd]
	,[measure_ReadmissionInd]
	,[measure_FUV_7Day_Ind]
	,[measure_FUV_30Day_Ind]
	,[measure_AgeInDays_IndexAdm]
	,[measure_LengthOfStay_IndexAdm]
	,[measure_LengthOfStay_Readmission]
	,[measure_TimeBetweenAdmissions]
	,[measure_TimeToFUV]
	,[sys_PartitionDate]
	,[LACEScore]
	)
VALUES (
	1002
	,1020
	,- 1
	,1002
	,5
	,5
	,- 1
	,2
	,11
	,5
	,- 1
	,2
	,31
	,- 1
	,29
	,11
	,30
	,34
	,- 1
	,32
	,11
	,33
	,20130403
	,20130419
	,@StartDate
	,@EndDate
	,16451
	,80
	,- 1
	,- 1
	,- 1
	,- 1
	,0
	,0
	,0
	,1
	,16
	,7
	,24
	,- 1
	,1
	,1
	,NULL
	,NULL
	,13140
	,384
	,168
	,24
	,NULL
	,201304
	,10
	)


INSERT [Fact].[Readmissions] (
	[id_IndexAdmission]
	,[id_Readmission]
	,[id_FUV]
	,[id_Patient]
	,[org_Assigned_IndexAdm]
	,[org_Referring_IndexAdm]
	,[org_DischargingUnit_IndexAdm]
	,[org_RelatedProvider_IndexAdm]
	,[org_Assigned_Readm]
	,[org_Referring_Readm]
	,[org_DischargingUnit_Readm]
	,[org_RelatedProvider_Readm]
	,[provider_Referring_IndexAdm]
	,[provider_Discharging_IndexAdm]
	,[provider_Admitting_IndexAdm]
	,[provider_Related_IndexAdm]
	,[provider_Attending_IndexAdm]
	,[provider_Referring_Readm]
	,[provider_Discharging_Readm]
	,[provider_Admitting_Readm]
	,[provider_Related_Readm]
	,[provider_Attending_Readm]
	,[date_IndexAdmission]
	,[date_DischargeIndexAdmission]
	,[date_Readmission]
	,[date_DischargeReadmission]
	,[attrib_PatientAge]
	,[attrib_Cohort]
	,[attrib_AdmissionDiagnosisPrimary_IndexAdm]
	,[attrib_DischargeDiagnosisPrimary_IndexAdm]
	,[attrib_ReadmissionDiagnosisPrimary]
	,[attrib_ReadmissionDischargeDiagnosisPrimary]
	,[attrib_UrgentAdmissionInd_IndexAdm]
	,[attrib_UrgentReadmissionInd]
	,[attrib_DeathDuringReadmissionInd]
	,[attrib_SameDischargeFacilityInd]
	,[range_LOS_IndexAdmission]
	,[range_LOS_Readmission]
	,[range_TimeBetweenAdmissions]
	,[range_TimeToFUV]
	,[mesure_IndexAdmissionInd]
	,[measure_ReadmissionInd]
	,[measure_FUV_7Day_Ind]
	,[measure_FUV_30Day_Ind]
	,[measure_AgeInDays_IndexAdm]
	,[measure_LengthOfStay_IndexAdm]
	,[measure_LengthOfStay_Readmission]
	,[measure_TimeBetweenAdmissions]
	,[measure_TimeToFUV]
	,[sys_PartitionDate]
	,[LACEScore]
	)
VALUES (
	1004
	,1040
	,- 1
	,1004
	,5
	,5
	,- 1
	,2
	,11
	,5
	,- 1
	,2
	,31
	,- 1
	,29
	,11
	,30
	,34
	,- 1
	,32
	,11
	,33
	,20130403
	,20130419
	,@StartDate
	,@EndDate
	,16451
	,80
	,- 1
	,- 1
	,- 1
	,- 1
	,0
	,0
	,0
	,1
	,16
	,7
	,24
	,- 1
	,1
	,1
	,NULL
	,NULL
	,8030
	,384
	,168
	,24
	,NULL
	,201304
	,10
	)


INSERT [Fact].[Readmissions] (
	[id_IndexAdmission]
	,[id_Readmission]
	,[id_FUV]
	,[id_Patient]
	,[org_Assigned_IndexAdm]
	,[org_Referring_IndexAdm]
	,[org_DischargingUnit_IndexAdm]
	,[org_RelatedProvider_IndexAdm]
	,[org_Assigned_Readm]
	,[org_Referring_Readm]
	,[org_DischargingUnit_Readm]
	,[org_RelatedProvider_Readm]
	,[provider_Referring_IndexAdm]
	,[provider_Discharging_IndexAdm]
	,[provider_Admitting_IndexAdm]
	,[provider_Related_IndexAdm]
	,[provider_Attending_IndexAdm]
	,[provider_Referring_Readm]
	,[provider_Discharging_Readm]
	,[provider_Admitting_Readm]
	,[provider_Related_Readm]
	,[provider_Attending_Readm]
	,[date_IndexAdmission]
	,[date_DischargeIndexAdmission]
	,[date_Readmission]
	,[date_DischargeReadmission]
	,[attrib_PatientAge]
	,[attrib_Cohort]
	,[attrib_AdmissionDiagnosisPrimary_IndexAdm]
	,[attrib_DischargeDiagnosisPrimary_IndexAdm]
	,[attrib_ReadmissionDiagnosisPrimary]
	,[attrib_ReadmissionDischargeDiagnosisPrimary]
	,[attrib_UrgentAdmissionInd_IndexAdm]
	,[attrib_UrgentReadmissionInd]
	,[attrib_DeathDuringReadmissionInd]
	,[attrib_SameDischargeFacilityInd]
	,[range_LOS_IndexAdmission]
	,[range_LOS_Readmission]
	,[range_TimeBetweenAdmissions]
	,[range_TimeToFUV]
	,[mesure_IndexAdmissionInd]
	,[measure_ReadmissionInd]
	,[measure_FUV_7Day_Ind]
	,[measure_FUV_30Day_Ind]
	,[measure_AgeInDays_IndexAdm]
	,[measure_LengthOfStay_IndexAdm]
	,[measure_LengthOfStay_Readmission]
	,[measure_TimeBetweenAdmissions]
	,[measure_TimeToFUV]
	,[sys_PartitionDate]
	,[LACEScore]
	)
VALUES (
	1006
	,1060
	,- 1
	,1006
	,5
	,5
	,- 1
	,2
	,14
	,5
	,- 1
	,2
	,31
	,- 1
	,29
	,11
	,30
	,34
	,- 1
	,32
	,11
	,33
	,20130403
	,20130419
	,@StartDate
	,@EndDate
	,16451
	,80
	,- 1
	,- 1
	,- 1
	,- 1
	,0
	,0
	,0
	,1
	,16
	,7
	,24
	,- 1
	,1
	,1
	,NULL
	,NULL
	,9125
	,384
	,168
	,24
	,NULL
	,201304
	,10
	)
GO


