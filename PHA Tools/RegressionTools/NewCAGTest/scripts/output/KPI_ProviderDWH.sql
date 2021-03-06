/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [attrib_Measure]
      ,[attrib_Provider]
      ,cast(round(sum(KPI_Score),2) as money) as KPIScore
  FROM [dbmSemanticAnalytics].[Fact].[KpiSummMonthly]
   where [date_YearMonth] = cast( datepart(yyyy,getdate())as varchar)+'_01'
     and [attrib_Measure] >0
  and [attrib_Provider] <> -2
  and [attrib_PatientAge] = -2
  and [Severity_Score] = -2
  and [Gender] = -2 
  and [attrib_Org] = -2
  and [attrib_Program] = -2

  group by [attrib_Measure]
          ,[attrib_Provider]
		order by 1,2

  