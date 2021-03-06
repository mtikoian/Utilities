--USE [dbmSemanticAnalytics]
--GO

IF NOT EXISTS(SELECT TOP(1) 1 FROM [dbmSemanticAnalytics].[Factless].[PatientRelationsFromTo] where id_Patient in(161,163) )
BEGIN
Insert into [dbmSemanticAnalytics].[Factless].[PatientRelationsFromTo] ([id_Patient],[provider_Related],[org_RelatedProvider],[date__from_Relationship],[date_To_Relationship],[attrib_PatientAge],[Severity_Score],[comb_prog])
     VALUES (161,51,22,20121203,20301231,4,1,-1),(163,48,43,20140205,20301231,6,1,-1)
END
--GO