
SELECT  [attrib_Measure],
case when cast (Gender as varchar (1)) = 1 then 'F' WHEN cast(Gender as varchar (1)) = 2 THEN 'M' ELSE cast (Gender as varchar (1)) END as [Gender]
,cast(round(sum(KPI_Score),2) as money) as KPIScore
  FROM [dbmSemanticAnalytics].[Fact].[KpiSummMonthly]
  
  where [date_YearMonth] = cast( datepart(yyyy,getdate())as varchar)+'_01'
  and [attrib_Measure] >0
  and [attrib_Provider] = -2
  and [attrib_PatientAge] = -2
  and [Severity_Score] = -2
  and [Gender] <> -2 
  and [attrib_Org] = -2
  and attrib_Program = -2
  group by [attrib_Measure],Gender
  order by [attrib_Measure]

