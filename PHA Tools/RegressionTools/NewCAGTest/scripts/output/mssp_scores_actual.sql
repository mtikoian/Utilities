--use [dbmsemanticanalytics].

SELECT  [Id_Patient]
      ,[MSSPKey]
      ,LEFT([date_YearMonth],4)
      ,[Measure_PopulationInd]
      ,[Measure_MemberInd]
  FROM [dbmSemanticAnalytics].[Fact].[MSSP]
order by 1