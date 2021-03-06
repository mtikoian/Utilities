USE [dbmSemanticAnalyticsSTG]
GO
EXEC dbo.OpenHHR



  select distinct 
   PF.id_Encounter [id_Admission],
          PF.id_Patient,
		  PF.AdmissionDateEnc,
		  PC.Current_ClaimID [Original_ClaimID],
		  PF.Flag_Claims,
		  PC.EncounterCodeKey [attrib_Claim_Code_Key]

  from [Persist].[ClaimRevenueCenter] PC
  Left join [Persist].ClaimsHeader CH
   ON PC.Current_ClaimID = CH.Current_ClaimID and PC.HIC_Number_Bnf = CH.Bnf_HIC_Number
  LEFT JOIN [dbmSemanticAnalyticsSTG].[Persist].[FactEncounters] PF
    ON PC.id_Patient = PF.id_Patient  and pf.ID_Claims=pc.ID_Claims
	--AND CONVERT(date,[dbo].[DecryptHR](PC.Claim_From_DateENC)) = CONVERT(date,[dbo].[DecryptHR](PF.AdmissionDateEnc)) 
	where  ClaimsDomainType='EncounterInpatients' and Flag_Claims=1
	order by 1

