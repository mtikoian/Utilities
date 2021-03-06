SELECT 
case when COUNT(*)=0 then '0'
else 'Duplicates in AdminCodes'
end as Duplicates_cnt
FROM (
	select count(*) as counter
	from [dbmSemanticAnalytics].[Dim].[AdminCodes]
	group by DimName,  Local_Code,  Local_CodeSystem
	having count(*)>1
	 ) CodesTable

UNION 

SELECT
case when COUNT(*)=0 then '0'
else 'Duplicates in ConditionsInHierarchy'
end as Duplicates_cnt
FROM (
	select count(*) as counter
	from [dbmSemanticAnalytics].[Factless].[ConditionsInHierarchy]
	group by FK, NodeFK, DimName
    having count(*)>1
	 ) LinkesTable
	 
UNION 

SELECT
case when COUNT(*)=0 then '0'
else 'Duplicates in MedicationsInHierarchy'
end as Duplicates_cnt
FROM (
	select count(*) as counter
	from [dbmSemanticAnalytics].[Factless].[MedicationsInHierarchy]
	group by  [MedicationSubClassCode], [MedicationCode]
    having count(*)>1
	 ) LinkesTable


	