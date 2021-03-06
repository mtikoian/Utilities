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
	  ,level3Id
  FROM [dbmSemanticAnalytics].[Fact].[MSSP_Services_Final]  F left join dim.Organizations O
         on F.OrganizationKey = O.OrganizationKey
		 group by  [MSSPKey],[date_YearMonth],level3Id
)
,
cte2 as
(
SELECT [Id_Patient]
      ,[MSSPKey]
      ,[date_YearMonth]
      ,[Measure_PopulationInd]
      ,[Measure_MemberInd]
      ,[CareProviderKey]
      ,O.[OrganizationKey],
	  level3Id
      ,[Sys_partitonDate]
      ,[Is_Reported]
  FROM [dbmSemanticAnalytics].[Fact].[MSSP_Services_Final]  F left join dim.Organizations O
         on F.OrganizationKey = O.OrganizationKey
)
-----------------------------------------------------------------------------------------------------------
select top 1 
      cast (DM.MeasureName as varchar(40))MeasureName
         ,o.level3 Organization
         ,MJ.vector_L3
         ,MJ.CareProviderKey
       --  ,MJ.OrganizationKey
         ,case 
         when DM.ImpN <> 2 then cast(C.[Measure_MemberInd] as float)/C.[Measure_PopulationInd] 
              else 1- cast(C.[Measure_MemberInd] as float)/C.[Measure_PopulationInd]  end MeasureScore
           ,case 
         when DM.ImpN <> 2 then cast(E.[Measure_MemberInd] as float)/E.[Measure_PopulationInd]  
              else 1- cast(E.[Measure_MemberInd] as float)/E.[Measure_PopulationInd]   end PrevMeasureScore
          ,C.[Measure_MemberInd]
       ,C.[Measure_PopulationInd]
         ,cast ( DM.ImpN as varchar(3))ImpN
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
         ,case when DM.ImpN <> 2 then ceiling((C.[Measure_PopulationInd]*P.lead)-	C.[Measure_MemberInd])
		            else ceiling(C.[Measure_MemberInd]-(C.[Measure_PopulationInd]*(1-P.lead))) end  gap 
		 ,E.Measure_PopulationInd PrevDenominator
     from  dim.MSSP DM
left join [dbmSemanticAnalytics].[Fact].[Mssp_Junc_Dim] MJ
                on   cast (DM.MSSPKey as varchar) = Mj.MSSPKey
left join [dim].Dates D
                on MJ.date_YearMonth = D.DateKey
left join  [dbmSemanticAnalytics].Dim.Organizations o
                on substring(MJ.vector_L3,CHARINDEX('-',MJ.vector_L3),CHARINDEX ('_',substring(MJ.vector_L3,CHARINDEX('-',MJ.vector_L3)+1,20))) = cast(O.level3Id as varchar)
left join cte1 C       
      on    C.Measure_PopulationInd <>0 
              and cast(C.MSSPKey as varchar) = cast (MJ.MSSPKey as varchar)
              and cast(C.date_YearMonth as varchar) = cast(MJ.date_YearMonth as varchar)
              and  cast(C.level3Id as varchar) = substring(MJ.vector_L3,CHARINDEX('-',MJ.vector_L3),CHARINDEX ('_',substring(MJ.vector_L3,CHARINDEX('-',MJ.vector_L3)+1,20)))
left join 
           (
           SELECT [MSSPKey] ,[date_YearMonth] ,level3Id
                ,[Measure_PopulationInd]
                 ,[Measure_MemberInd]
             FROM cte1 
                      where date_YearMonth = cast( datepart(yyyy,getdate()) -1 as varchar)+'0101'
             )E
              on  cast(E.MSSPKey as varchar) = cast (MJ.MSSPKey as varchar)
              and cast(E.date_YearMonth +10000 as varchar) = cast(MJ.date_YearMonth as varchar)
              and cast(E.level3Id as varchar) = substring(MJ.vector_L3,CHARINDEX('-',MJ.vector_L3),CHARINDEX ('_',substring(MJ.vector_L3,CHARINDEX('-',MJ.vector_L3)+1,20)))
left join 
           (
             SELECT [MSSPKey] ,[date_YearMonth] ,level3Id
                 ,cast(sum([Measure_MemberInd]) as float)/sum([Measure_PopulationInd])
                              AttributedPatientsScore
             FROM cte2 
              where date_YearMonth = 20160101 and Is_Reported =1
             group by [MSSPKey],[date_YearMonth],level3Id

             )G
      on    cast(G.MSSPKey as varchar) = cast (MJ.MSSPKey as varchar)
        and cast(G.date_YearMonth as varchar) = cast(MJ.date_YearMonth as varchar)
              and cast(G.level3Id as varchar) =  substring(MJ.vector_L3,CHARINDEX('-',MJ.vector_L3),CHARINDEX ('_',substring(MJ.vector_L3,CHARINDEX('-',MJ.vector_L3)+1,20)))
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


where D.[DateKey] = 20150401 --cast( datepart(yyyy,getdate())as varchar)+'0101'
      and DM.MSSPKey = 5
         and MJ.CareProviderKey = 'A'
              and MJ.OrganizationKey <> 'A'
       --and comb.CareProviderKey = 'A'
order by o.level3Id
