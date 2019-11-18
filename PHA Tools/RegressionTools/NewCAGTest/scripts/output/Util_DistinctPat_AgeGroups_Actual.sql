SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
if  exists(select * from sys.servers where name = N'FDX_3')
EXEC sp_dropserver 'FDX_3', 'droplogins'


EXEC sp_addlinkedserver
     @server='FDX_3',   /* local SQL name given to the 
                                 linked server */
     @srvproduct='',          /* not used */
     @provider='MSOLAP',      /* OLE DB provider */
    @datasrc='$(OlapServer)',   /* analysis server name (machine name)   */
   --@datasrc='dbm8-data111\inst03',   /* @datasrc='$(OlapServer)'   analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */
Go 


EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

--select * from openquery(FDX_3, ' SELECT NON EMPTY { [Measures].[PatientProviderCount] } ON COLUMNS, NON EMPTY { ([Date].[Month Year].[Month Year].ALLMEMBERS ) } DIMENSION PROPERTIES MEMBER_CAPTION ON ROWS FROM [CPM]')
select --cast("[Util Measures].[Measure ID].[Measure ID].[MEMBER_CAPTION]" as varchar(20)) as Measure_Name,
cast("[Util Dims].[Dims_Hier].[Description].[MEMBER_CAPTION]" as varchar(20)) as AgeGroupDesc,
"[Measures].[Result]" as Result 


--select * 
from openquery(FDX_3, '  SELECT NON EMPTY { [Measures].[Result] } ON COLUMNS, NON EMPTY {    filter ([Util Dims].[Dims_Hier].[Description].ALLMEMBERS , [Util Dims].[Dim Name]  is  [Util Dims].[Dim Name].&[Age Groups]  )   }  ON ROWS FROM [Utilization]   where  [Util Measures].[Mes Name].&[Patient count]')
  --order by "[Measures].[key]"  desc

EXEC sp_dropserver 'FDX_3', 'droplogins'