
DECLARE @startDate INT,
		@endDate INT
SELECT @startDate = cast(Left(cast(DATEADD(yy,-2,getdate())as date),4)+ Left(Right(cast(DATEADD(mm,-1,getdate())as date),5),2)as int)
SELECT @endDate   = cast(Left(cast(DATEADD(mm,-1,getdate())as date),4)+Left(Right(cast(DATEADD(mm,-1,getdate())as date),5),2)as int)

select M.date_YearMonth,isnull(pr.org_RelatedProvider,-1)  Practice ,count (distinct m.id_Patient) SumOfPatients
from Fact.Metrics_CQM_Full M
left join [dbmSemanticAnalyticsSTG].Config.MetricsDefinitions CMD on M.MetricKey = CMD.MetricKey
 left JOIN Factless.PatientRelationsFromTo AS pr ON M.id_Patient = pr.id_Patient  AND M.date_YearMonth * 100 + 1 BETWEEN pr.date__from_Relationship AND pr.date_To_Relationship
 where M.date_YearMonth >= @startDate and  M.date_YearMonth <= @endDate
 group by M.date_YearMonth, pr.org_RelatedProvider
 order by 1,2