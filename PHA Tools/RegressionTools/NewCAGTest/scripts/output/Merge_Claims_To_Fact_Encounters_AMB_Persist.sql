  USE [dbmSemanticAnalyticsSTG]
GO
EXEC dbo.OpenHHR



  select  
PF.id_Encounter ,
      PF.id_Patient,
	 PF.AdmissionDateEnc,
		  PC.Current_ClaimID [Original_ClaimID],
		  PF.Flag_Claims,
		  PC.EncounterCodeKey [attrib_Claim_Code_Key]

  from [Persist].[ClaimRevenueCenter] PC
  LEFT JOIN [dbmSemanticAnalyticsSTG].[Persist].[FactEncounters] PF
    ON PC.id_Patient = PF.id_Patient  
	AND CONVERT(date,[dbo].[DecryptHR](PC.Claim_From_DateENC)) = CONVERT(date,[dbo].[DecryptHR](PC.Claim_From_DateENC)) and  pf.ID_Claims=pc.ID_Claims
	where  PC.ClaimsDomainType = 'EncounterOutpatient' 
	and	 PF.Type = 'AMB' and flag_claims = 0 
	order by 1



