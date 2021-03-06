select  t1.id_patient ,t1.msspkey,cast(replace(m,'YYYY',t1.[Year])as int) date_YearMonth, 
	      1 as Measure_PopulationInd,case when  (N.Id_Patient) is null then 0 else 1 end as Measure_MemberInd
 from
  (select 'YYYY0101' as m,1 n
union 
select 'YYYY0201' as m,2
union
select 'YYYY0301' as m,3
union 
select 'YYYY0401' as m,4
union
select 'YYYY0501' as m,5
union 
select 'YYYY0601' as m,6
union
select 'YYYY0701' as m,7
union 
select 'YYYY0801' as m,8
union
select 'YYYY0901' as m,9
union 
select 'YYYY1001' as m,10
union
select 'YYYY1101' as m,11
union 
select 'YYYY1201' as m,12) months
 join  (select id_patient , msspkey,[year] ,Denominator,
	
      1 as[measure_IndicatorInd],
	min(FromDate) fromdate
,min(to_date)to_date from
(	select msspkey, Denominator,AI.IndicatorId IndicatorId, 
	id_patient ,[FromDate]  ,[To_Date]
      ,[measure_IndicatorInd],[FlagNew],[year] from dim.mssp
	inner join [dbmSemanticAnalytics].[Dim].[ActiveIndicators] AI
	on TypeId=Denominator
	and msspkey=1
	inner join (SELECT [Id_Patient]
     ,[IndicatorId]
      ,[FromDate]
      ,[To_Date]
      ,[measure_IndicatorInd]
      ,[FlagNew]
	  ,year(dbmSemanticAnalyticsstg.[dbo].[unConvert_Date]([FromDate]) )[year]
  from dbmSemanticAnalytics.[Fact].[ActiveIndicator]
) FAI
  on FAI.IndicatorId=AI.indicatorid) T
  group by  msspkey,Denominator,id_patient,[year]) t1
  on months.n>=cast(SUBSTRING(CAST(FromDate AS NVARCHAR(8)), 5, 2)as int)
  left join 
  (select A.Id_Patient, msspkey,[year] ,Numerator,
	 1 as[measure_IndicatorInd],
	min(FromDate) fromdate
,min(to_date)to_date from
(	select msspkey, Numerator,AI.IndicatorId IndicatorId, 
	id_patient ,[FromDate]  ,[To_Date]
      ,[measure_IndicatorInd],[FlagNew],[year] from dim.mssp
	inner join [dbmSemanticAnalytics].[Dim].[ActiveIndicators] AI
	on TypeId=Numerator
	and msspkey=1
	inner join (SELECT [Id_Patient]
     ,[IndicatorId]
      ,[FromDate]
      ,[To_Date]
      ,[measure_IndicatorInd]
      ,[FlagNew]
	  ,year(dbmSemanticAnalyticsstg.[dbo].[unConvert_Date]([FromDate]) )[year]
  from dbmSemanticAnalytics.[Fact].[ActiveIndicator] A
  )FAI
  on FAI.IndicatorId=AI.indicatorid)a
    group by  msspkey,Numerator,id_patient,[year]) N
	on N.[year]=t1.[year]and t1.Id_Patient=N.Id_Patient
	and cast(replace(m,'YYYY',t1.[Year])as int)>=N.fromdate
  order by  1,3