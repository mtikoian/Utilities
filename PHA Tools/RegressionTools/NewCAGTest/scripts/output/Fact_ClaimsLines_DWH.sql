
USE [dbmSemanticAnalytics]
GO

SELECT --[id_Claim], 
       [Original_ClaimID]
      ,[Claim_Line_Number]
      ,[id_Patient]
      --,[org_Assigned]
      --,[provider_Performer]
      ,[Id_Program]
      ,[Line_From_DateENC]
      ,[Line_Thru_DateENC]
      ,[Claim_From_DateENC]
      ,[Claim_Thru_DateENC]
      ,isnull([attrib_Claim_Type_Code],-1)[attrib_Claim_Type_Code]
      ,ISNULL([attrib_Claim],-1)[attrib_Claim]
      --,[attrib_PatientAge]
      --,ISNULL([attrib_ClaimPrimaryPayerCode],-1)[attrib_ClaimPrimaryPayerCode]
      ,cast(ISnull(measure_ClaimLineChargeAmount,measure_ClaimLinePayerPaidAmount) as decimal(15,2)) [measure_Claim_Line_Amount]
	  ,[Attrib_BillingProviderName]
      ,[Attrib_BillingProviderTaxonomy]
      ,isnull(Attrib_PatientRelationshipToPersonInsured ,'Undefined') Attrib_PatientRelationshipToPersonInsured
      ,[Attrib_AttendingProviderName]
      ,[Attrib_AttendingProviderTaxonomy]
      ,[Attrib_RenderingProviderName]
	  ,[Attrib_RenderingProviderTaxonomy]
      ,[Attrib_SupervisingProviderName]
	  ,isnull([Attrib_FacilityProvider],'Undefined') [Attrib_FacilityProvider]
     ,[measure_ClaimChargeAmount] 
      ,[attrib_TypeOfFacility]  
      ,[attrib_PlaceOfService] 
      ,[attrib_ClaimFrequencyType]
      ,[date_AdmissionDate]
      --,[attrib_AdmissionType]
      ,[date_DischargeDate]
      ,--[attrib_RevenueCodeDescription]---------------
      [measure_ClaimLineChargeAmount]
      ,[measure_ClaimPayerPaidAmount]
     -- ,[Claim_Admission_DateENC]
     -- ,[Claim_Discharge_DateENC]
      ,[attrib_PatientStatus]
      ,[Line_Service_Unit_Quantity]
      ,coalesce([MeasurementUnit], 'Undefined') [MeasurementUnit]
      ,[attrib_ClaimsFormatType]
      
  FROM [dbmSemanticAnalytics].[Fact].[ClaimsLines]
  where attrib_Claim not in (29347)
  ORDER BY 1,2,12,10,3

