USE [dbmSemanticAnalyticsSTG]
GO
EXEC dbo.OpenHHR



  select 
  PF.id_Encounter [id_Admission],
          PF.id_Patient,
		  PF.AdmissionDateEnc,
		  PC.Current_ClaimID [Original_ClaimID],
		  PF.Flag_Claims,
		 isnull( PC.EncounterCodeKey ,-1) [attrib_Claim_Code_Key]
  from [Persist].[ClaimRevenueCenter] PC
  LEFT JOIN [dbmSemanticAnalyticsSTG].[Persist].[FactEncounters] PF
    ON PC.id_Patient = PF.id_Patient  and pc.ID_Claims=pf.ID_Claims
	--AND CONVERT(date,[dbo].[DecryptHR](PC.Claim_From_DateENC)) = CONVERT(date,[dbo].[DecryptHR](PF.AdmissionDateEnc)) 
	where claimsdomaintype='EncounterOutpatient' 
	and flag_claims = 1
		-- and PF.Type = 'AMB'
		  
	order by 1




