/****** Script for SelectTopNRows command from SSMS  ******/
SELECT distinct  
      [Id_Patient]
      ,[Severity_Score]
      ,[comb_id]
      ,[ScoreType]
      ,[date_YearMonth]
      ,[measure_IndicatorInd]
      ,[sys_PartitionDate]
      ,[FlagNew]
      ,[ScoreTypeId]
      ,[date_Score]
      ,[id_IndexAdmission]
  FROM [dbmSemanticAnalytics].[Fact].[SeverityScores]F
    join [dbmSemanticAnalytics].Dim.Dates D
   on F.date_YearMonth = D.MonthYear or (F.date_YearMonth is null and date_Score/10000 =cast( datepart(yyyy,getdate())as varchar))
  where D.Year =  cast( datepart(yyyy,getdate())as varchar) --and f.Id_Patient = 860 -- and  scoretypeid = 3 and id_indexadmission = 468 and date_score =  20150130
  order by id_patient, date_YearMonth

