--use [dbmsemanticanalytics].

with ac as
(
	select * from [dbmSemanticAnalytics].dim.AdminCodes
)

, data as
(
	select id_Patient, 'ABM' fact, p.date_Visit d, p.attrib_EncounterType code
	from 	[dbmSemanticAnalytics].fact.AmbulatoryVisits p
	
	union

		select id_Patient, 'claim_GV' fact, p.date_Claim d, p.attrib_Claim code
		from [dbmSemanticAnalytics].fact.Claims p
			inner join ac ac
			on p.attrib_Claim = ac.admincodekey

		where ac.Baseline_Code in ('99201','99202','99203','99204','99205','99212','99213','99214','99215','99341','99342','99343','99344','99345','99347','99348','99349','99350','99385','99386','99387','99395','99396','99397','G0438','G0439')
			and ac.Baseline_CodeSystemName in ('CPT-4','HCPCS')

		union

			
		select id_Patient, 'Immunization_pn', p.date_Start, p.attrib_ImmunizationCode
		from [dbmSemanticAnalytics].[Fact].[Immunizations] p
			inner join ac ac
			on p.attrib_ImmunizationCode = ac.AdminCodeKey
		where ac.Baseline_Code in ('33') 
		and ac.Baseline_CodeSystemName = 'CVX'

		union

		select id_Patient, 'procedure_pn', p.date_Start, p.attrib_Procedure
		from [dbmSemanticAnalytics].fact.procedures p
			inner join ac ac
			on p.attrib_Procedure = ac.AdminCodeKey
		where ac.Baseline_Code in ('12866006','394678003','473165003','310578008') 
		and ac.Baseline_CodeSystemName = 'SNOMED-CT'

		union

		select id_Patient, 'condition_pn', p.date_ConditionStart, p.attrib_ConditionCode
		from [dbmSemanticAnalytics].fact.Conditions p
			inner join ac ac
			on p.attrib_ConditionCode = ac.AdminCodeKey
		where ac.Baseline_Code in ('12866006','394678003','473165003','310578008') 
		and ac.Baseline_CodeSystemName = 'SNOMED-CT'

		union

		select id_Patient, 'claim_pn', p.date_Claim, p.attrib_Claim
		from [dbmSemanticAnalytics].fact.Claims p
		inner join ac ac
		on p.attrib_Claim = ac.admincodekey
		where ac.Baseline_Code in ('90732_C4')
		and ac.Baseline_CodeSystemName = 'CPT-4'
		
		
		--select a.id_Patient, a.attrib_ImmunizationCode code
		--from [dbmsemanticanalytics].[Fact].[Immunizations] a
		--union
		--select a.id_Patient, a.attrib_Procedure
		--from [dbmsemanticanalytics].[Fact].[Procedures] a
		--union 
		--select a.id_Patient, a.attrib_ConditionCode
		--from [dbmsemanticanalytics].[Fact].Conditions a
		--union
		--select a.id_Patient, a.attrib_Claim
		--from [dbmsemanticanalytics].fact.Claims a
)

--select * from data

select distinct a.Id_Patient, d.code, max(a.FromDate) maxdate
from [dbmsemanticanalytics].fact.ActiveIndicator a
	inner join data d
	on a.Id_Patient = d.id_Patient 
where a.IndicatorId >= 39
	and a.IndicatorId < = 44
group by a.Id_Patient, d.code
order by 1,2,3 asc

--select * from  [dbmsemanticanalytics].fact.ActiveIndicator a
--where a.IndicatorId >= 39
--	and a.IndicatorId < = 44

