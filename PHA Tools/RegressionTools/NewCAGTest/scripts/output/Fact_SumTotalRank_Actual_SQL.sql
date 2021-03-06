/****** Script for SelectTopNRows command from SSMS  ******/
SELECT distinct [id_PopulationMember]
      ,[provider_Related]
      ,[org_RelatedProvider]
      ,[sys_PartitionDate]
      ,[Patient]
      ,[TotalPatientRank]
      ,[date_YearMonth]
      ,[Comb_id]
  FROM [dbmSemanticAnalytics].[Fact].[SumTotalRank] F
  join [dbmSemanticAnalytics].Dim.Dates D
   on F.date_YearMonth = D.MonthYear
  where D.Year =  cast( datepart(yyyy,getdate())as varchar) and 
        [date_YearMonth] = cast( datepart(yyyy,getdate())as varchar)+'_'+CONVERT(varchar(2), GETDATE(), 101)
		AND [provider_Related]>0
		AND [org_RelatedProvider]>0
  order by 1


  ;