	SET ANSI_WARNINGS OFF 

SET NOCOUNT ON 
	

SELECT          cast([dbmSemanticAnalytics].[Dim].[DTRGroups].DTRGroupDesc  as varchar(15)) as DTR_Group,  cast(isnull(SUM(re.measure_ReadmissionInd) , 0) as int) AS readmission_rate_in__dtr_numerator

, ((SELECT     count( *)
FROM            [dbmSemanticAnalytics].[Fact].[Readmissions] AS re1 INNER JOIN
                         [dbmSemanticAnalytics].[Dim].[Organizations] ON re1.org_RelatedProvider_IndexAdm = [dbmSemanticAnalytics].[Dim].[Organizations].OrganizationKey
WHERE        (re1.sys_PartitionDate <
                             (SELECT        YEAR(GETDATE()) * 100 + MONTH(GETDATE()) AS Expr1)) AND ([dbmSemanticAnalytics].[Dim].[Organizations].level3Id <> - 1))) AS  readmission_rate_in_dtr_denominator


 ,CASE 
		WHEN (select sum(re2.mesure_IndexAdmissionInd) 


from [dbmSemanticAnalytics].[Fact].[Readmissions] re2) > 0
			THEN CAST(CAST(isnull(SUM(re.measure_ReadmissionInd) , 0) AS NUMERIC) / CAST((SELECT     count( *)
FROM            [dbmSemanticAnalytics].[Fact].[Readmissions] AS re1 INNER JOIN
                         [dbmSemanticAnalytics].[Dim].[Organizations] ON re1.org_RelatedProvider_IndexAdm = [dbmSemanticAnalytics].[Dim].[Organizations].OrganizationKey
WHERE        (re1.sys_PartitionDate <
                             (SELECT        YEAR(GETDATE()) * 100 + MONTH(GETDATE()) AS Expr1)) AND ([dbmSemanticAnalytics].[Dim].[Organizations].level3Id <> - 1)) AS NUMERIC) AS DECIMAL(5, 2)) 
		ELSE NULL
		END AS readmission_rate_in_dtr_score


FROM            [dbmSemanticAnalytics].[Dim].[DTRGroups] INNER JOIN
                         [dbmSemanticAnalytics].[Dim].[DTR] ON [dbmSemanticAnalytics].[Dim].[DTRGroups].DTRGroupKey = [dbmSemanticAnalytics].[Dim].[DTR].DTRGroupKey LEFT OUTER JOIN
                        (SELECT      *
FROM            [dbmSemanticAnalytics].[Fact].[Readmissions] AS re1 INNER JOIN
                         [dbmSemanticAnalytics].[Dim].[Organizations] ON re1.org_RelatedProvider_IndexAdm = [dbmSemanticAnalytics].[Dim].[Organizations].OrganizationKey
WHERE        (re1.sys_PartitionDate <
                             (SELECT        YEAR(GETDATE()) * 100 + MONTH(GETDATE()) AS Expr1)) AND re1.sys_PartitionDate is not null and  ([dbmSemanticAnalytics].[Dim].[Organizations].level3Id <> - 1))  AS re ON [dbmSemanticAnalytics].[Dim].[DTR].DTRKey = re.range_TimeBetweenAdmissions


GROUP BY [dbmSemanticAnalytics].[Dim].[DTRGroups].DTRGroupDesc

order by [dbmSemanticAnalytics].[Dim].[DTRGroups].DTRGroupDesc