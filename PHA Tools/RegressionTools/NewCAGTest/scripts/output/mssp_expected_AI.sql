SELECT DNUM.Id_patient, 
       DNUM.Msspkey, 
       DNUM.[Year], 
       DNUM.[Dmeasure_indicatorind]         [Measure_PopulationInd], 
       Isnull(NUM.Nmeasure_indicatorind, 0) [Measure_MemberInd]
FROM 
--Denom 
(SELECT DISTINCT Id_patient, 
                 Msspkey, 
                months.[Year], 
                 Denominator, 
                 1          AS [Dmeasure_IndicatorInd], 
                 Startmonth date_YearMonth, 
                 Monthname 
 FROM   (SELECT I.Flagnew, 
                I.Fromdate, 
                I.Id_patient, 
                I.To_date, 
                I.[Fromdate] / 10000 [year], 
                D.[Typeid]           denominator, 
                Msspkey 
         FROM   Dbmsemanticanalytics.[Fact].[Activeindicator] I 
                INNER JOIN [Dim].[Activeindicators] D 
                        ON I.Indicatorid = D.Indicatorid 
                INNER JOIN Dim.Mssp 
                        ON D.Typeid = Mssp.Denominator 
         WHERE  EXISTS (SELECT TOP (1) 1 
						FROM   dbmsemanticanalytics.tmp.indicatorworking M
                        WHERE  M.Indicatorid = I.Indicatorid and M.indicatorid >= 39    
                                AND I.Id_patient = M.Id_patient 
                                AND I.[Fromdate] / 10000 = left(M.[FromDate_Min],4)	   
							   ))T1 
        INNER JOIN Dim.Months MONTHS 
                ON Months.Startmonth BETWEEN Fromdate AND To_date )DNUM 
LEFT OUTER JOIN ( 
                --Num 
                SELECT DISTINCT Id_patient, 
                                Msspkey, 
                               months.[Year], 
                                Numerator, 
                                1          AS [Nmeasure_IndicatorInd], 
                                Startmonth date_YearMonth--, MonthName 
                 FROM   (SELECT I.Flagnew, 
                                I.Fromdate, 
                                I.Id_patient, 
                                I.To_date, 
                                I.[Fromdate] / 10000 [year], 
                                D.[Typeid]           numerator, 
                                Msspkey 
                         FROM   Dbmsemanticanalytics.[Fact].[Activeindicator] I 
                                INNER JOIN [Dim].[Activeindicators] D 
                                        ON I.Indicatorid = D.Indicatorid 
                                INNER JOIN Dim.Mssp 
                                        ON D.Typeid = Mssp.Numerator 
                         WHERE  EXISTS (SELECT TOP (1) 1 
                                        FROM   dbmsemanticanalytics.tmp.indicatorworking M
                                        WHERE  M.Indicatorid = I.Indicatorid and M.indicatorid >= 39    
                                               AND I.Id_patient = M.Id_patient 
                                               AND I.[Fromdate] / 10000 = left(M.[FromDate_Min],4))
												   )T1 
                        INNER JOIN Dim.Months MONTHS 
                                ON Months.Startmonth BETWEEN 
                                   Fromdate AND To_date
								    ) NUM 
             ON DNUM.Id_patient = NUM.Id_patient 
                AND DNUM.Msspkey = NUM.Msspkey 
                AND DNUM.Date_yearmonth = NUM.Date_yearmonth
order by 1