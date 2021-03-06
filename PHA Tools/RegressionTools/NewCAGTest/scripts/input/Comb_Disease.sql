USE [dbmSemanticAnalytics]
GO


delete  [Dim].[Comb_Diseases] where comb_id = 98 and Disease_name = 'Alzheimer’s'
GO
delete  [Dim].[Comb_Diseases] where comb_id = 98 and Disease_name = 'Autism' 
GO
delete  [Dim].[Comb_Diseases] where comb_id = 98 and Disease_name = 'Cancer' 
GO
delete  [Dim].[Comb_Diseases] where comb_id = 234 and Disease_name = 'Alzheimer’s' 
GO
delete  [Dim].[Comb_Diseases] where comb_id = 234 and Disease_name = 'Asthma' 
GO
delete  [Dim].[Comb_Diseases] where comb_id = 234 and Disease_name = 'Autism' 
GO
delete  [Dim].[Comb_Diseases] where comb_id = 234 and Disease_name = 'Cancer' 
GO
delete  [Dim].[Comb_Diseases] where comb_id = 234 and Disease_name = 'CKD' 
GO
delete  [Dim].[Comb_Diseases] where comb_id = 256 and Disease_name = 'COPD' 
GO
delete  [Dim].[Comb_Diseases] where comb_id = 56164 and Disease_name = 'Arthritis' 
GO
delete  [Dim].[Comb_Diseases] where comb_id = 56164 and Disease_name = 'Autism' 
GO
delete  [Dim].[Comb_Diseases] where comb_id = 56164 and Disease_name = 'Cancer' 
GO
delete  [Dim].[Comb_Diseases] where comb_id = 56164 and Disease_name = 'COPD' 
GO
delete  [Dim].[Comb_Diseases] where comb_id = 56164 and Disease_name = 'Depression' 
GO
delete  [Dim].[Comb_Diseases] where comb_id = 56164 and Disease_name = 'Heart Failure' 
GO
delete  [Dim].[Comb_Diseases] where comb_id = 56164 and Disease_name = 'Hyperlipidemia' 
GO
delete  [Dim].[Comb_Diseases] where comb_id = 56164 and Disease_name = 'IHD' 
GO
delete  [Dim].[Comb_Diseases] where comb_id = 56164 and Disease_name = 'Osteoporosis' 
GO


INSERT [Dim].[Comb_Diseases] ([Comb_id], [Disease_name]) VALUES (98, N'Alzheimer’s')
GO
INSERT [Dim].[Comb_Diseases] ([Comb_id], [Disease_name]) VALUES (98, N'Autism')
GO
INSERT [Dim].[Comb_Diseases] ([Comb_id], [Disease_name]) VALUES (98, N'Cancer')
GO
INSERT [Dim].[Comb_Diseases] ([Comb_id], [Disease_name]) VALUES (234, N'Alzheimer’s')
GO
INSERT [Dim].[Comb_Diseases] ([Comb_id], [Disease_name]) VALUES (234, N'Asthma')
GO
INSERT [Dim].[Comb_Diseases] ([Comb_id], [Disease_name]) VALUES (234, N'Autism')
GO
INSERT [Dim].[Comb_Diseases] ([Comb_id], [Disease_name]) VALUES (234, N'Cancer')
GO
INSERT [Dim].[Comb_Diseases] ([Comb_id], [Disease_name]) VALUES (234, N'CKD')
GO
INSERT [Dim].[Comb_Diseases] ([Comb_id], [Disease_name]) VALUES (256, N'COPD')
GO
INSERT [Dim].[Comb_Diseases] ([Comb_id], [Disease_name]) VALUES (56164, N'Arthritis')
GO
INSERT [Dim].[Comb_Diseases] ([Comb_id], [Disease_name]) VALUES (56164, N'Autism')
GO
INSERT [Dim].[Comb_Diseases] ([Comb_id], [Disease_name]) VALUES (56164, N'Cancer')
GO
INSERT [Dim].[Comb_Diseases] ([Comb_id], [Disease_name]) VALUES (56164, N'COPD')
GO
INSERT [Dim].[Comb_Diseases] ([Comb_id], [Disease_name]) VALUES (56164, N'Depression')
GO
INSERT [Dim].[Comb_Diseases] ([Comb_id], [Disease_name]) VALUES (56164, N'Heart Failure')
GO
INSERT [Dim].[Comb_Diseases] ([Comb_id], [Disease_name]) VALUES (56164, N'Hyperlipidemia')
GO
INSERT [Dim].[Comb_Diseases] ([Comb_id], [Disease_name]) VALUES (56164, N'IHD')
GO
INSERT [Dim].[Comb_Diseases] ([Comb_id], [Disease_name]) VALUES (56164, N'Osteoporosis')
GO
