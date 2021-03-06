/****** Script for SelectTopNRows command from SSMS  ******/
SELECT distinct
     [Patient]
      ,[TotalPatientRank]
    
  FROM [dbmSemanticAnalytics].[Fact].[SumTotalRank] d
  where d.date_YearMonth = cast( datepart(yyyy,getdate())as varchar)+'_01' 
  order by 1 desc
