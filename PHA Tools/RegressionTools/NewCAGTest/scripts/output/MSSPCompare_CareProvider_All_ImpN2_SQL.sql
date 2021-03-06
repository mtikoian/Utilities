use [dbmSemanticAnalytics]
go

with  cte1
as
(
SELECT  
      [MSSPKey]
      ,[date_YearMonth]
      ,sum ([Measure_PopulationInd])[Measure_PopulationInd]
      ,sum([Measure_MemberInd]) [Measure_MemberInd]
	  ,O.CareProviderKey
  FROM [dbmSemanticAnalytics].[Fact].[MSSP_Services_Final]  F left join dim.CareProviders O
         on F.CareProviderKey = O.CareProviderKey
		 group by  [MSSPKey],[date_YearMonth],O.CareProviderKey
)
,
cte2 as
(
SELECT  [Id_Patient]
      ,[MSSPKey]
      ,[date_YearMonth]
      ,[Measure_PopulationInd]
      ,[Measure_MemberInd]
      ,O.[CareProviderKey]
      ,[OrganizationKey]
      ,[Sys_partitonDate]
      ,[Is_Reported]
  FROM [dbmSemanticAnalytics].[Fact].[MSSP_Services_Final]  F left join dim.CareProviders O
         on F.CareProviderKey = O.CareProviderKey
)
-----------------------------------------------------------------------------------------------------------
select 
      cast (DM.MeasureName as varchar(40))MeasureName
	  ,cast(DM.GroupName as varchar(60)) GroupName
         ,cast(MJ.vector_L3 as varchar(30))vector_L3
		 ,cast (CP.FullName as varchar(15)) CareProvider 
         --,MJ.CareProviderKey
        ,cast(MJ.OrganizationKey as varchar(5))[Organization Key]
         ,case 
         when DM.ImpN <> 2 then cast(C.[Measure_MemberInd] as float)/C.[Measure_PopulationInd] 
              else 1- cast(C.[Measure_MemberInd] as float)/C.[Measure_PopulationInd]  end MeasureScore
           ,case 
         when DM.ImpN <> 2 then cast(E.[Measure_MemberInd] as float)/E.[Measure_PopulationInd]  
              else 1- cast(E.[Measure_MemberInd] as float)/E.[Measure_PopulationInd]   end PrevMeasureScore
          ,C.[Measure_MemberInd]
       ,C.[Measure_PopulationInd]
         ,cast ( DM.ImpN as int)ImpN
         ,case 
              when (DM.ImpN <> 2 and G.AttributedPatientsScore is not null ) then G.AttributedPatientsScore
                 else 
				 case when G.AttributedPatientsScore is not null then 1-G.AttributedPatientsScore
				 else 0 end
                 end  AttributedPatientsScore
         ,cast (P.Precentile as float(2))mssp_precentile
         ,cast (p.Points as float(2))mssp_points
         ,cast(F.mssp_target as float(2))mssp_target
		-- ,P.lead
         ,cast (case when DM.ImpN <> 2 then ceiling((C.[Measure_PopulationInd]*P.lead)-	C.[Measure_MemberInd])
		            else ceiling(C.[Measure_MemberInd]-(C.[Measure_PopulationInd]*(1-P.lead))) end as float) gap 
		 ,E.Measure_PopulationInd PrevDenominator
     from  dim.MSSP DM
left join [dbmSemanticAnalytics].[Fact].[Mssp_Junc_Dim] MJ
                on   cast (DM.MSSPKey as varchar) = Mj.MSSPKey
left join [dim].Dates D
                on MJ.date_YearMonth = D.DateKey
left join  [dbmSemanticAnalytics].Dim.CareProviders CP
                on MJ.CareProviderKey = CP.CareProviderKey 
left join cte1 C       
      on    C.Measure_PopulationInd <>0 
              and cast(C.MSSPKey as varchar) = cast (MJ.MSSPKey as varchar)
              and cast(C.date_YearMonth as varchar) = cast(MJ.date_YearMonth as varchar)
              and  cast(C.CareProviderKey as varchar) = cast (MJ.CareProviderKey as varchar)
left join 
           (
           SELECT [MSSPKey] ,[date_YearMonth] ,CareProviderKey
                ,[Measure_PopulationInd]
                 ,[Measure_MemberInd]
             FROM cte1 
                      where date_YearMonth = cast( datepart(yyyy,getdate()) -1 as varchar)+'0101'
             )E
              on  cast(E.MSSPKey as varchar) = cast (MJ.MSSPKey as varchar)
              and cast(E.date_YearMonth +10000 as varchar) = cast(MJ.date_YearMonth as varchar)
              and cast(E.CareProviderKey as varchar) = cast (MJ.CareProviderKey as varchar)
left join 
           (
             SELECT [MSSPKey] ,[date_YearMonth] ,CareProviderKey
                 ,cast(sum([Measure_MemberInd]) as float)/sum([Measure_PopulationInd])
                              AttributedPatientsScore
             FROM cte2 
              where date_YearMonth = 20160101 and Is_Reported =1
             group by [MSSPKey],[date_YearMonth],CareProviderKey

             )G
      on    cast(G.MSSPKey as varchar) = cast (MJ.MSSPKey as varchar)
        and cast(G.date_YearMonth as varchar) = cast(MJ.date_YearMonth as varchar)
              and cast(G.CareProviderKey as varchar) = cast (MJ.CareProviderKey as varchar)
left join 
                     (
                     SELECT [MSSPKey],[Points],[Precentile],[LowLimitPrecent],[HighLimitPrecent]
                   ,case
                                    when [Precentile] = 0.9 then 1
                                         else  lead([LowLimitPrecent],1)over(order by [MSSPKey] ) 
                                  end as lead
            FROM [dbmSemanticAnalytics].[Dim].[MsspPoints]
                     )P
                     on P.MSSPKey = MJ.MSSPKey
                     and (case  when  DM.ImpN = 2 then 1-(cast(C.[Measure_MemberInd] as float)/C.[Measure_MemberInd]) else (cast(C.[Measure_MemberInd] as float)/C.[Measure_PopulationInd])end) >= P.LowLimitPrecent
                  and (case  when  DM.ImpN = 2 then 1-(cast(C.[Measure_MemberInd] as float)/C.[Measure_MemberInd]) else (cast(C.[Measure_MemberInd] as float)/C.[Measure_PopulationInd])end)  <=  P.HighLimitPrecent
left join 
                     (
                     SELECT [MSSPKey] ,max([LowLimitPrecent])mssp_target
                FROM [dbmSemanticAnalytics].[Dim].[MsspPoints]
                group by MSSPKey
                     )F
                     on  cast(F.MSSPKey as varchar) = cast (MJ.MSSPKey as varchar)


where D.[DateKey] =20150201-- cast( datepart(yyyy,getdate())as varchar)+'0101'
      and DM.MSSPKey = 5
         and MJ.CareProviderKey <> 'A'
              and MJ.OrganizationKey = 'A'
       --and comb.CareProviderKey = 'A'
order by CP.FullName