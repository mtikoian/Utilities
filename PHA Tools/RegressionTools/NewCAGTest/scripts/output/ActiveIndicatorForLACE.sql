use [dbmSemanticAnalytics]
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR;
SELECT[dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](b.FirstName) FirstName--, id_patient
,c.Encounter_Ext
      ,[IndicatorId]
      ,[FromDate]
      ,[To_Date]
      ,[measure_IndicatorInd]
      --[id_IndexAdmission]
  FROM [dbmSemanticAnalytics].[Fact].[ActiveIndicator] a
  INNER JOIN dim.patients b
  ON a.Id_Patient = b.PatientKey
  left JOIN dbmSemanticAnalyticsSTG.Persist.FactEncounters c
  ON a.id_IndexAdmission = c.id_Encounter
    where ([dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](b.FirstName) LIKE '%lace%')
	AND IndicatorId BETWEEN 18 AND 38
  order by 1,2,3

  