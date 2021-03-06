/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
      [id_Patient]
      ,[org_Assigned]
      ,[provider_Performer]
      ,[attrib_ClaimPrimaryPayerCode]
      ,[attrib_ClaimTypeCode]
      ,[attrib_ClaimActClinicalCode]
      ,[attrib_HCPCS_Code]
      ,[attrib_Medication]
      --,[date_Claim_From_Date]
     -- ,[date_Claim_Thru_Date]
      ,[date_Claim_From_DateENC]
      ,[date_Claim_Thru_DateENC]
      ,[measure_DispenseQuantityNum]
      ,[Original_ClaimID]
      ,[ClaimSource]
      --,[Bookmark]
     -- ,[Timestamp]
      ,[Attrib_BillingProviderName]
      ,[Attrib_BillingProviderTaxonomy]
      ,[Attrib_PatientRelationshipToPersonInsured]
      ,[Attrib_AttendingProviderName]
      ,[Attrib_AttendingProviderTaxonomy]
      ,[Procedure_Performed_DateEnc]
      ,[Medication_Claim_Line_Service_Unit_Quantity]
  FROM [dbmSemanticAnalytics].[Fact].[ClaimsClinicalData]

  where id_patient not like 173 ---------need to remove this condition 
  

  order by 1,12,5,6,8,9,3,4


