/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [date_YearMonth]
      ,[attrib_Measure]
      --,[attrib_Provider]
      --,[attrib_Org]
      --,[attrib_PatientAge]
      ,[measure_population]
      --,[sys_PartitionDate]
  FROM [dbmSemanticAnalytics].[Fact].PopulationSumMonthly
  where left(date_YearMonth,4) =  cast( datepart(yyyy,getdate())as varchar)
  --and attrib_Measure = 1121
 and attrib_Org = -2
 and attrib_PatientAge = -2
 and attrib_Provider = -2
 AND Comb_id=-2
  AND Severity_Score=-2
 and measure_population > 0
  order by attrib_Measure, date_YearMonth
  