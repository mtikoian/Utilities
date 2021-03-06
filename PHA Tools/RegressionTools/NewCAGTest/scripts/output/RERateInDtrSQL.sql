	SET ANSI_WARNINGS OFF 

SET NOCOUNT ON 
	
SELECT       cast([dbmSemanticAnalytics].[Dim].[DTRGroups].DTRGroupDesc  as varchar(15)) as DTR_Group , isnull(SUM(re.measure_ReadmissionInd) , 0)  AS readmission_rate_in__dtr_numerator

, (select sum(re2.mesure_IndexAdmissionInd) 

from ( select * from  [dbmSemanticAnalytics].[Fact].[Readmissions] as re1  where   re1.sys_PartitionDate < (select year(getdate()) *100 + month(getdate()))) re2) AS  readmission_rate_in_dtr_denominator


 ,CASE 
		WHEN (select sum(re2.mesure_IndexAdmissionInd) 


from [dbmSemanticAnalytics].[Fact].[Readmissions] re2) > 0
			THEN CAST(CAST(isnull(SUM(re.measure_ReadmissionInd) , 0) AS NUMERIC) / CAST((select sum(re2.mesure_IndexAdmissionInd) 


from ( select * from  [dbmSemanticAnalytics].[Fact].[Readmissions] as re1  where   re1.sys_PartitionDate < (select year(getdate()) *100 + month(getdate()))) re2)  AS NUMERIC) AS DECIMAL(5, 2))
		ELSE NULL
		END AS readmission_rate_in_dtr_score


FROM            [dbmSemanticAnalytics].[Dim].[DTRGroups] INNER JOIN
                         [dbmSemanticAnalytics].[Dim].[DTR] ON [dbmSemanticAnalytics].[Dim].[DTRGroups].DTRGroupKey = [dbmSemanticAnalytics].[Dim].[DTR].DTRGroupKey LEFT OUTER JOIN
                         (select * from [dbmSemanticAnalytics].[Fact].[Readmissions] where sys_PartitionDate is not null ) AS re ON [dbmSemanticAnalytics].[Dim].[DTR].DTRKey = re.range_TimeBetweenAdmissions
						
GROUP BY [dbmSemanticAnalytics].[Dim].[DTRGroups].DTRGroupDesc