/*inserting temporary data into AdminCodes for MSSP Tests*/

IF NOT EXISTS(SELECT top(1) 1 FROM [dbmSemanticAnalytics].[Dim].[AdminCodes]  where [AdminCodeKey] in (700000,700001,700002,700003,700004,700005,700006,700007,700008,700009,700010,700011,700012,700013,700014,700015,700016,700017,700018,700019,700020))
BEGIN
SET IDENTITY_INSERT  [dbmSemanticAnalytics].[Dim].[AdminCodes] ON

  insert into [dbmSemanticAnalytics].[Dim].[AdminCodes] ([DimName]
      ,[AdminCodeKey]
      ,[AdminCodeDesc]
      ,[Local_Code]
      ,[Local_CodeSystem]
      ,[Baseline_Code]
      ,[Besline_CodeSystem]
      ,[BaselineKey]
      ,[Bookmark]
      ,[Timestamp]
      ,[Baseline_CodeSystemName])
 values ('claims',700000,'Obstetrics','OBS','2.16.840.1.113883.5.4','90732','2.16.840.1.113883.6.96',700000,700000,getdate(),'CPT-4'),
 ('Procedures',700001,'Home','HH','2.16.840.1.113883.5.4','12866006','2.16.840.1.113883.6.97',700001,700001,getdate(),'SNOMED-CT'),
 ('Procedures',700002,'health','FLD','2.16.840.1.113883.5.4','394678003','2.16.840.1.113883.6.98',700002,700002,getdate(),'SNOMED-CT'),
 ('Procedures',700003,'field','GENRL','2.16.840.1.113883.5.4','473165003','2.16.840.1.113883.6.99',700003,700003,getdate(),'SNOMED-CT'),
 ('Procedures',700004,'General','PHYRHB','2.16.840.1.113883.5.4','310578008','2.16.840.1.113883.6.100',700004,700004,getdate(),'SNOMED-CT'),
 ('claims',700005,'Physical','PED','2.16.840.1.113883.5.4','99201','2.16.840.1.113883.6.101',700005,700005,getdate(),'CPT-4'),
 ('claims',700006,'Rehab','MED','2.16.840.1.113883.5.4','99202','2.16.840.1.113883.6.102',700006,700006,getdate(),'CPT-4'),
 ('claims',700007,'Pediatrics','AMB','2.16.840.1.113883.5.4','99203','2.16.840.1.113883.6.103',700007,700007,getdate(),'CPT-4'),
 ('claims',700008,'Medical','ALC','2.16.840.1.113883.5.4','99204','2.16.840.1.113883.6.104',700008,700008,getdate(),'CPT-4'),
 ('claims',700009,'Ambulatory','DNTL','2.16.840.1.113883.5.4','99205','2.16.840.1.113883.6.105',700009,700009,getdate(),'CPT-4'),
 ('claims',700010,'Alternative','CARD','2.16.840.1.113883.5.4','99212','2.16.840.1.113883.6.106',700010,700010,getdate(),'CPT-4'),
 ('claims',700011,'Level','PHAR','2.16.840.1.113883.5.4','99213','2.16.840.1.113883.6.107',700011,700011,getdate(),'CPT-4'),
 ('claims',700012,'of','DRGRHB','2.16.840.1.113883.5.4','99214','2.16.840.1.113883.6.108',700012,700012,getdate(),'CPT-4'),
 ('claims',700013,'Care','CHR','2.16.840.1.113883.5.4','99215','2.16.840.1.113883.6.109',700013,700013,getdate(),'CPT-4'),
 ('claims',700014,'Dental','PALL','2.16.840.1.113883.5.4','99341','2.16.840.1.113883.6.110',700014,700014,getdate(),'CPT-4'),
 ('Procedures',700015,'Cardiology','ONC','2.16.840.1.113883.5.4','12843005','2.16.840.1.113883.6.111',700015,700015,getdate(),'SNOMED-CT'),
 ('Procedures',700016,'Pharmaceutical','NONAC','2.16.840.1.113883.5.4','18170008','2.16.840.1.113883.6.112',700016,700016,getdate(),'SNOMED-CT'),
 ('Procedures',700017,'Drug','ACUTE','2.16.840.1.113883.5.4','185349003','2.16.840.1.113883.6.113',700017,700017,getdate(),'SNOMED-CT'),
 ('Procedures',700018,'Rehab','VR','2.16.840.1.113883.5.4','185463005','2.16.840.1.113883.6.114',700018,700018,getdate(),'SNOMED-CT'),
 ('Procedures',700019,'Chronic','PSYCH','2.16.840.1.113883.5.4','185465003','2.16.840.1.113883.6.115',700019,700019,getdate(),'SNOMED-CT'),
 ('Procedures',700020,'Palliative','SURG','2.16.840.1.113883.5.4','19681004','2.16.840.1.113883.6.116',700020,700020,getdate(),'SNOMED-CT')

SET IDENTITY_INSERT  [dbmSemanticAnalytics].[Dim].[AdminCodes] OFF
END

