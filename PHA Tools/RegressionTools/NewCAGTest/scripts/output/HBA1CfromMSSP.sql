SELECT  [Id_Patient]
      ,[MSSPKey]
      ,[date_YearMonth]
      ,[Measure_PopulationInd]
      ,[Measure_MemberInd]
  FROM [dbmSemanticAnalytics].[Fact].[MSSP]
  where msspkey=5
 -- and Id_Patient=256
  order by 1,3