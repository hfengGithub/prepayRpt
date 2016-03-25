qryAggregateForwardSettleCommitmentsdaily1
INSERT INTO tblForwardCommitmentPalmsSourcedaily ( ProductCode, RemittanceTypeID, DeliveryYear, Wac, DeliveryMonth, WASettleDay, ScheduleType, NxtPmtBase, Portfolio, CUSIP, Owam, [Sub Account Type], [Account Type], [Account Class], H1, H2, Notional, Mult, Factor, [Add Accrued?], PV, Swap, Coup, Age, Wam, Swam, [P/O], OAS, P, Settle, Repo, NxtPmt, PP, PPConst, PPMult, PPSens, Lag, Lock, PPFq, NxtPP, NxtRst1, PrepWac, PrepCoup, FA1, Const1, Mult1, Rate1, RF1, Floor1, Cap1, PF1, PC1, AB1, NxtRst2, BOOK, ClientName, WAPrice, NumberofCommitments, Agency, [Entry Date] )
SELECT qryFundedandUnfundedDCsbyPFIdaily.ProductCode, qryFundedandUnfundedDCsbyPFIdaily.RemittanceTypeID, qryFundedandUnfundedDCsbyPFIdaily.DeliveryYear, CStr((CInt([NoteRate]*200)/200)*100) AS Wac, qryFundedandUnfundedDCsbyPFIdaily.DeliveryMonth, CInt(Sum([UnfundedAmountP]*[DeliveryDay])/Sum([UnfundedAmountP])) AS WASettleDay, IIf(Left([ProductCode],2)="GL","GL",IIf([RemittanceTypeID]=1,"SS",IIf([RemittanceTypeID]=2,"AA"," "))) AS [Schedule Type], IIf([WASettleDay]<18,DateSerial(Year(CDate([Settle])),Month(CDate([Settle]))+1,Day(CDate([Settle]))),DateSerial(Year(CDate([Settle])),Month(CDate([Settle]))+2,Day(CDate([Settle])))) AS NxtPmtBase, "Hedging" AS Portfolio, [Schedule Type] & Right([DeliveryYear],4) & IIf([DeliveryMonth]<10,"0" & CStr([DeliveryMonth]),CStr([DeliveryMonth])) & Mid([ProductCode],3,2) & [WAC]*1000 & "FH" AS CUSIP, Mid([ProductCode],3,2)*12 AS Owam, qryFundedandUnfundedDCsbyPFIdaily.ProductCode AS [Sub Account Type], CStr((CInt([NoteRate]*200)/200)*100) AS [Account Type], CStr([DeliveryYear]) AS [Account Class], CStr([WAPrice]) AS H1, CStr([WASettleDay]) AS H2, CStr(Sum([UnfundedAmountP])) AS Notional, "1" AS Mult, "1" AS Factor, "0" AS [Add Accrued?], "Mid" AS PV, "Mid" AS Swap, CStr(CDbl([Wac])-(Last([ServicingFee])+Last([CEFee])+Last([ExcessServicingFee]))*100) AS Coup, "0" AS Age, [OWAM] AS Wam, IIf([OWAM]=180,160,IIf([OWAM]=360,335,IIf([OWAM]=240,220,""))) AS Swam, "OAS" AS [P/O], 0 AS OAS, (Sum([Price]*[UnfundedAmountP]))/(Sum([UnfundedAmountP])) AS P, IIf([DeliveryMonth]<10,"0" & CStr([DeliveryMonth]),CStr([DeliveryMonth])) & "/" & IIf([WASettleDay]<10,"0" & CStr([WASettleDay]),CStr([WASettleDay])) & "/" & CStr([DeliveryYear]) AS Settle, DLookUp("[RepoRate]","[tblPALMSRepo]") AS Repo, IIf(Month([NxtPmtBase])<10,"0" & CStr(Month([NxtPmtBase])),CStr(Month([NxtPmtBase]))) & "/18/" & CStr(Year([NxtPmtBase])) AS NxtPmt, "PA" AS PP, "0" AS PPConst, "1" AS PPMult, "1" AS PPSens, "0" AS Lag, "0" AS Lock, "12" AS PPFq, IIf(Month([NxtPmtBase])<10,"0" & CStr(Month([NxtPmtBase])),CStr(Month([NxtPmtBase]))) & "/18/" & CStr(Year([NxtPmtBase])) AS NxtPP, IIf(Month([NxtPmtBase])<10,"0" & CStr(Month([NxtPmtBase])),CStr(Month([NxtPmtBase]))) & "/18/" & CStr(Year([NxtPmtBase])) AS NxtRst1, [Wac] AS PrepWac, [Coup] AS PrepCoup, "F" AS FA1, "0" AS Const1, "0" AS Mult1, "3L" AS Rate1, "12" AS RF1, "None" AS Floor1, "None" AS Cap1, "None" AS PF1, "None" AS PC1, "Bond" AS AB1, [NxtRst1] AS NxtRst2, CStr(Sum([UnfundedAmountP])) AS BOOK, "Hedging" AS ClientName, 0 AS WAPrice, Count(qryFundedandUnfundedDCsbyPFIdaily.NoteRate) AS NumberofCommitments, qryFundedandUnfundedDCsbyPFIdaily.Agency, qryFundedandUnfundedDCsbyPFIdaily.EntryDate
FROM qryFundedandUnfundedDCsbyPFIdaily
GROUP BY qryFundedandUnfundedDCsbyPFIdaily.ProductCode, qryFundedandUnfundedDCsbyPFIdaily.RemittanceTypeID, qryFundedandUnfundedDCsbyPFIdaily.DeliveryYear, CStr((CInt([NoteRate]*200)/200)*100), qryFundedandUnfundedDCsbyPFIdaily.DeliveryMonth, 0, qryFundedandUnfundedDCsbyPFIdaily.Agency, qryFundedandUnfundedDCsbyPFIdaily.EntryDate, qryFundedandUnfundedDCsbyPFIdaily.Agency
HAVING (((CStr(Sum([UnfundedAmountP])))>0));



qryAggregateForwardSettleCommitments
INSERT INTO tblForwardCommitmentPalmsSource ( ProductCode, RemittanceTypeID, DeliveryYear, Wac, DeliveryMonth, WASettleDay, ScheduleType, ScheduleType2, Delay, Portfolio, CUSIP, CusipHedged, Owam, [Sub Account Type], [Account Type], [Account Class], H1, H2, Notional, Mult, Factor, [Add Accrued?], PV, Swap, Age, Wam, Swam, [P/O], OAS, P, Settle, Repo, NxtPmt, PP, PPConst, PPMult, PPSens, Lag, Lock, PPCRShift, PPFq, NxtPP, NxtRst1, PrepWac, Coup, CoupOld, PrepCoup, FA1, Const1, Mult1, Rate1, RF1, Floor1, Cap1, PF1, PC1, AB1, NxtRst2, BOOK, ClientName, AggNotional, WAPrice, NumberofCommitments, Agency )
SELECT [qryFundedandUnfundedDCsbyPFI Unhedged].ProductCode, [qryFundedandUnfundedDCsbyPFI Unhedged].RemittanceTypeID, [qryFundedandUnfundedDCsbyPFI Unhedged].DeliveryYear, CStr((CInt([NoteRate]*200)/200)*100) AS Wac, [qryFundedandUnfundedDCsbyPFI Unhedged].DeliveryMonth, CInt(Sum(Abs([UnfundedAmountP])*[DeliveryDay])/Sum(Abs([UnfundedAmountP]))) AS WASettleDay, [qryFundedandUnfundedDCsbyPFI Unhedged].[Schedule Type], [qryFundedandUnfundedDCsbyPFI Unhedged].[Schedule Type], Last([qryFundedandUnfundedDCsbyPFI Unhedged].Delay) AS LastOfDelay, "MPFForward" AS Portfolio, [Schedule Type] & Right([DeliveryYear],4) & IIf([DeliveryMonth]<10,"0" & CStr([DeliveryMonth]),CStr([DeliveryMonth])) & Mid([ProductCode],3,2) & CDbl([Wac])*1000 AS CUSIP, [Schedule Type] & Right([DeliveryYear],4) & IIf([DeliveryMonth]<10,"0" & CStr([DeliveryMonth]),CStr([DeliveryMonth])) & Mid([ProductCode],3,2) & CDbl([Wac])*1000 AS CUSIPHedged, Mid([ProductCode],3,2)*12 AS Owam, [qryFundedandUnfundedDCsbyPFI Unhedged].ProductCode AS [Sub Account Type], CStr((CInt([NoteRate]*200)/200)*100) AS [Account Type], CStr([DeliveryYear]) AS [Account Class], CStr([WAPrice]) AS H1, CStr([WASettleDay]) AS H2, CStr(Sum([UnfundedAmountP])) AS Notional, "1" AS Mult, "1" AS Factor, "1" AS [Add Accrued?], "Mid" AS PV, "Mid" AS Swap, "1" AS Age, [OWAM]-1 AS Wam, IIf([OWAM]=180,160,IIf([OWAM]=360,335,IIf([OWAM]=240,220,""))) AS Swam, "OAS" AS [P/O], 0 AS OAS, Sum([deliveryamount]*[price])/Sum([deliveryamount]) AS P, IIf([DeliveryMonth]<10,"0" & CStr([DeliveryMonth]),CStr([DeliveryMonth])) & "/" & IIf([WASettleDay]<10,"0" & CStr([WASettleDay]),CStr([WASettleDay])) & "/" & CStr([DeliveryYear]) AS Settle, DLookUp("[RepoRate]","[tblPALMSRepo]") AS Repo, NextDateFwd([DeliveryYear],[DeliveryMonth],[WASettleDay],[Schedule Type]) AS NxtPmt, "AFT" AS PP, "0" AS PPConst, Last([qryFundedandUnfundedDCsbyPFI Unhedged].PPMult) AS LastOfPPMult, "1" AS PPSens, "0" AS Lag, "0" AS Lock, 0 AS PPCRShift, "12" AS PPFq, [NxtPmt] AS NxtPP, [NxtPmt] AS NxtRst1, [Wac] AS PrepWac, IIf(Left(Last([qryFundedandUnfundedDCsbyPFI Unhedged].[ProductCode]),2)="GL",CStr(CDbl([Wac])-0.46),IIf([qryFundedandUnfundedDCsbyPFI Unhedged].[ProductCode]="FX15",CStr(CDbl([Wac])-0.35),CStr(CDbl([Wac])-0.39))) AS Coup, IIf(Left(Last([qryFundedandUnfundedDCsbyPFI Unhedged].[ProductCode]),2)="GL",CStr(CDbl([Wac])-(Last([ServicingFee])+Last([CEFee])+Last([ExcessServicingFee]))*100),CStr(CDbl([Wac])-0.39)) AS CoupOld, IIf(Left(Last([qryFundedandUnfundedDCsbyPFI Unhedged].[ProductCode]),2)="GL",CStr(CDbl([Wac])-0.46),IIf([qryFundedandUnfundedDCsbyPFI Unhedged].[ProductCode]="FX15",CStr(CDbl([Wac])-0.35),CStr(CDbl([Wac])-0.39))) AS PrepCoup, "F" AS FA1, "0" AS Const1, "0" AS Mult1, "3L" AS Rate1, "12" AS RF1, "None" AS Floor1, "None" AS Cap1, "None" AS PF1, "None" AS PC1, "Bond" AS AB1, [NxtRst1] AS NxtRst2, CStr(Sum([UnfundedAmountP])) AS BOOK, "MPFForward" AS ClientName, Sum([qryFundedandUnfundedDCsbyPFI Unhedged].UnfundedAmountP) AS AggNotional, 0 AS WAPrice, Count([qryFundedandUnfundedDCsbyPFI Unhedged].NoteRate) AS NumberofCommitments, [qryFundedandUnfundedDCsbyPFI Unhedged].Agency
FROM [qryFundedandUnfundedDCsbyPFI Unhedged]
GROUP BY [qryFundedandUnfundedDCsbyPFI Unhedged].ProductCode, [qryFundedandUnfundedDCsbyPFI Unhedged].RemittanceTypeID, [qryFundedandUnfundedDCsbyPFI Unhedged].DeliveryYear, CStr((CInt([NoteRate]*200)/200)*100), [qryFundedandUnfundedDCsbyPFI Unhedged].DeliveryMonth, [qryFundedandUnfundedDCsbyPFI Unhedged].[Schedule Type], [qryFundedandUnfundedDCsbyPFI Unhedged].[Schedule Type], [qryFundedandUnfundedDCsbyPFI Unhedged].Agency
HAVING (((CStr(Sum([UnfundedAmountP])))>0));

qryFundedandUnfundedDCsbyPFI Unhedged
SELECT ForwardSettleDCs.*, [MPF Hedges].DeliveryCommitmentNumber AS DCNHedged, [MPF Hedges].HedgeID
FROM ForwardSettleDCs LEFT JOIN [MPF Hedges] ON ForwardSettleDCs.DeliveryCommitmentNumber = [MPF Hedges].DeliveryCommitmentNumber
WHERE ((([MPF Hedges].HedgeID) Is Null));



qryAggregateHedgedForwardSettleCommitments
INSERT INTO tblForwardCommitmentPalmsSource ( ProductCode, RemittanceTypeID, DeliveryYear, Wac, Coup, CoupOld, DeliveryMonth, WASettleDay, ScheduleType, ScheduleType2, Delay, Portfolio, CUSIP, CusipHedged, Owam, [Sub Account Type], [Account Type], [Account Class], H1, H2, Notional, Mult, Factor, [Add Accrued?], PV, Swap, Age, Wam, Swam, [P/O], OAS, P, Settle, Repo, NxtPmt, PP, PPConst, PPMult, PPSens, Lag, Lock, PPCRShift, PPFq, NxtPP, NxtRst1, PrepWac, PrepCoup, FA1, Const1, Mult1, Rate1, RF1, Floor1, Cap1, PF1, PC1, AB1, NxtRst2, BOOK, ClientName, AggNotional, WAPrice, NumberofCommitments, Agency )
SELECT [qryFundedandUnfundedDCsbyPFI Hedged].ProductCode, [qryFundedandUnfundedDCsbyPFI Hedged].RemittanceTypeID, [qryFundedandUnfundedDCsbyPFI Hedged].DeliveryYear, CStr((CInt([NoteRate]*200)/200)*100) AS Wac, IIf(Left(Last([qryFundedandUnfundedDCsbyPFI Hedged].[ProductCode]),2)="GL",CStr(CDbl([Wac])-0.46),IIf([qryFundedandUnfundedDCsbyPFI Hedged].[ProductCode]="FX15",CStr(CDbl([Wac])-0.35),CStr(CDbl([Wac])-0.39))) AS Coup, IIf(Left(Last([qryFundedandUnfundedDCsbyPFI Hedged].[ProductCode]),2)="GL",CStr(CDbl([Wac])-(Last([ServicingFee])+Last([CEFee])+Last([ExcessServicingFee]))*100),CStr(CDbl([Wac])-0.39)) AS CoupOld, [qryFundedandUnfundedDCsbyPFI Hedged].DeliveryMonth, CInt(Sum(Abs([UnfundedAmountP])*[DeliveryDay])/Sum(Abs([UnfundedAmountP]))) AS WASettleDay, [qryFundedandUnfundedDCsbyPFI Hedged].[Schedule Type], [qryFundedandUnfundedDCsbyPFI Hedged].[Schedule Type], Last([qryFundedandUnfundedDCsbyPFI Hedged].Delay) AS LastOfDelay, "MPFForward" AS Portfolio, Last(("DC" & [owam] & [Account Type])) AS CUSIP, "DC" & IIf([SwapHedgeID] Is Null,"00",Right([SwapHedgeID],2)) & [Schedule Type] & Right([DeliveryYear],4) & Mid([ProductCode],3,2) & [WAC]*1000 AS CUSIPHedged, Mid([ProductCode],3,2)*12 AS Owam, [qryFundedandUnfundedDCsbyPFI Hedged].ProductCode AS [Sub Account Type], CStr((CInt([NoteRate]*200)/200)*100) AS [Account Type], CStr([DeliveryYear]) AS [Account Class], [Schedule Type] & Right([DeliveryYear],4) & IIf([DeliveryMonth]<10,"0" & CStr([DeliveryMonth]),CStr([DeliveryMonth])) & Mid([ProductCode],3,2) & [WAC]*1000 AS H1, CStr([WASettleDay]) AS H2, CStr(Sum([UnfundedAmountP])) AS Notional, "1" AS Mult, "1" AS Factor, "1" AS [Add Accrued?], "Mid" AS PV, "Mid" AS Swap, "1" AS Age, [OWAM]-1 AS Wam, IIf([OWAM]=180,160,IIf([OWAM]=360,335,IIf([OWAM]=240,220,""))) AS Swam, "Price" AS [P/O], 0 AS OAS, Sum([deliveryamount]*[price])/Sum([deliveryamount]) AS P, IIf([DeliveryMonth]<10,"0" & CStr([DeliveryMonth]),CStr([DeliveryMonth])) & "/" & IIf([WASettleDay]<10,"0" & CStr([WASettleDay]),CStr([WASettleDay])) & "/" & CStr([DeliveryYear]) AS Settle, DLookUp("[RepoRate]","[tblPALMSRepo]") AS Repo, NextDateFwd([DeliveryYear],[DeliveryMonth],[WASettleDay],[Schedule Type]) AS NxtPmt, "AFT" AS PP, "0" AS PPConst, Last([qryFundedandUnfundedDCsbyPFI Hedged].PPMult) AS LastOfPPMult, "1" AS PPSens, "0" AS Lag, "0" AS Lock, 0 AS PPCRShift, "12" AS PPFq, [NxtPmt] AS NxtPP, [NxtPmt] AS NxtRst1, [Wac] AS PrepWac, IIf(Left(Last([qryFundedandUnfundedDCsbyPFI Hedged].[ProductCode]),2)="GL",CStr(CDbl([Wac])-0.46),IIf([qryFundedandUnfundedDCsbyPFI Hedged].[ProductCode]="FX15",CStr(CDbl([Wac])-0.35),CStr(CDbl([Wac])-0.39))) AS PrepCoup, "F" AS FA1, "0" AS Const1, "0" AS Mult1, "3L" AS Rate1, "12" AS RF1, "None" AS Floor1, "None" AS Cap1, "None" AS PF1, "None" AS PC1, "Bond" AS AB1, [NxtRst1] AS NxtRst2, CStr(Sum([UnfundedAmountP])) AS BOOK, Last([qryFundedandUnfundedDCsbyPFI Hedged].HedgeID) AS ClientName, Sum([qryFundedandUnfundedDCsbyPFI Hedged].UnfundedAmountP) AS AggNotional, 0 AS WAPrice, Count([qryFundedandUnfundedDCsbyPFI Hedged].NoteRate) AS NumberofCommitments, [qryFundedandUnfundedDCsbyPFI Hedged].Agency
FROM [qryFundedandUnfundedDCsbyPFI Hedged]
GROUP BY [qryFundedandUnfundedDCsbyPFI Hedged].ProductCode, [qryFundedandUnfundedDCsbyPFI Hedged].RemittanceTypeID, [qryFundedandUnfundedDCsbyPFI Hedged].DeliveryYear, CStr((CInt([NoteRate]*200)/200)*100), [qryFundedandUnfundedDCsbyPFI Hedged].DeliveryMonth, [qryFundedandUnfundedDCsbyPFI Hedged].[Schedule Type], [qryFundedandUnfundedDCsbyPFI Hedged].[Schedule Type], [qryFundedandUnfundedDCsbyPFI Hedged].Agency, [qryFundedandUnfundedDCsbyPFI Hedged].PurchaseGroup, [qryFundedandUnfundedDCsbyPFI Hedged].Agency, [qryFundedandUnfundedDCsbyPFI Hedged].SwapHedgeID
HAVING (((CStr(Sum([UnfundedAmountP])))>0));

qryFundedandUnfundedDCsbyPFI Hedged
SELECT ForwardSettleDCs.*, [MPF Hedges].DeliveryCommitmentNumber AS DCNHedged, [MPF Hedges].PurchaseGroup, [MPF Hedges].HedgeID, [MPF Hedges].SwapHedgeID
FROM ForwardSettleDCs LEFT JOIN [MPF Hedges] ON ForwardSettleDCs.DeliveryCommitmentNumber = [MPF Hedges].DeliveryCommitmentNumber
WHERE ((([MPF Hedges].HedgeID) Is Not Null));



qryUpdatePricesIntblSecuritiesPalmsSource
UPDATE tblSecuritiesPalmsSource INNER JOIN tblFinalPriceSheet ON tblSecuritiesPalmsSource.CUSIP = tblFinalPriceSheet.Cusip SET tblSecuritiesPalmsSource.AggPrice = [New Price]
WHERE (((tblSecuritiesPalmsSource.H1)="Seasoned"));


qryUpdateMPFForwardPrices
UPDATE ForwardSettleDCs, qryMPFForwardPrice SET ForwardSettleDCs.Price = [qryMPFForwardPrice]![Price]
WHERE (((qryMPFForwardPrice.Date)=CDate([ForwardSettleDCs].[DeliveryDate])) AND ((CStr([NoteRate]))=[qryMPFForwardPrice].[Rate]) AND ((qryMPFForwardPrice.Rate)=CStr([ForwardSettleDCs].[NoteRate])) AND ((ForwardSettleDCs.[Schedule Type])=[ProdType]) AND ((ForwardSettleDCs.ProductCode)=[CatType]));


qryMPFForwardPrice
SELECT MPFForwardPrice.CatType, MPFForwardPrice.ProdType, MPFForwardPrice.Year, MPFForwardPrice.Date, MPFForwardPrice.[MBS Coupon], IIf([MPF Rate] Is Null,Null,CStr([MPF Rate]/100)) AS Rate, MPFForwardPrice.Day, MPFForwardPrice.Price
FROM MPFForwardPrice
WHERE (((MPFForwardPrice.CatType) Is Not Null) AND ((MPFForwardPrice.ProdType) Is Not Null) AND ((MPFForwardPrice.Year) Is Not Null) AND ((MPFForwardPrice.Date) Is Not Null) AND ((MPFForwardPrice.[MBS Coupon]) Is Not Null) AND ((IIf([MPF Rate] Is Null,Null,CStr([MPF Rate]/100))) Is Not Null) AND ((MPFForwardPrice.Price) Is Not Null));


qryLoanCusip (Old Hua)
SELECT LoanNumber, CusipHedged as Cusip, ScheduleType, OriginationYear, AccountType, PassThruRate, Wac, Coup, WAM, Age, ChicagoParticipation*CurrentLoanBalance as cBal, OriginalAmount, ChicagoParticipation, settle as asOfDate
FROM qryHedgedPalmsDataSource
UNION SELECT LoanNumber, Cusip, ScheduleType, OriginationYear, AccountType, PassThruRate, Wac, Coup, WAM, Age, ChicagoParticipation*CurrentLoanBalance as cBal, OriginalAmount, ChicagoParticipation, settle as asOfDate
FROM qryUnhedgedPalmsDataSource;

qryLoanSize (Hua)
SELECT Cusip, Sum(OriginalAmount/1000*cBal)/Sum(cBal) AS WAloanSize, asOfDate, Sum(cBal) AS curBal
FROM qryLoanCusip
GROUP BY Cusip, asOfDate;

qryFwdLoanSize (Hua)
SELECT CUSIP, IIF(ProductCode="FX30", 179, IIF(productCode="FX15", 132, IIF(productCode="FX20", 143, IIF(productCode="GL30", 144, 130)))) as WALoanSize
FROM tblForwardCommitmentPalmsSource;

qryLoanCusip (Hua)
SELECT "MPF" AS Portfolio, 
   IIf(Left([ProductCode],2)="MS","MS",IIf(Left([ProductCode],2)="GL","GL",IIf([RemittanceTypeID]=1,"SS",IIf([RemittanceTypeID]=3,"MA","AA")))) AS ScheduleType, 
   IIf([PortfolioIndicator]="BATCH",Year([OriginalLoanClosingDate]),Year([LoanRecordCreationDate])) AS OriginationYear, 
   l.LoanNumber,
   Right([ProductCode],2) AS AccountType, 
   (CInt([InterestRate]*200)/200)*100 AS PassThruRate, 
   IIF (h.LoanNumber IS NULL, [ScheduleType] & [OriginationYear] & [AccountType] & ([PassThruRate]*100), 
      "DC" & IIF([SwapHedgeID] is Null, "00", Right([SwapHedgeID], 2)) & [ScheduleType] & Right([AccountClass],4) & [AccountType] & [PassThruRate]) AS Cusip,
   [OriginationYear] AS AccountClass, [MPFBalance]*[ChicagoParticipation] AS Notional, 
   IIf([CurrentLoanBalance]=0,[OriginalAmount]/[OriginalAmount],[CurrentLoanBalance]/[OriginalAmount]) AS Factor, 
   (CInt([InterestRate]*100000)/100000)*100 AS Wac, 
   (CInt([Coupon]*100000)/100000)*100 AS Coup, 
   CInt(NPer(([InterestRate]/12),([PIAmount]*-1),[CurrentLoanBalance])) AS WAM, 
   Age, 
   IIf([AccountType]=15,160,IIf([AccountType]=20,220,IIf([AccountType]=30,335,""))) AS Swam, 
   EntryDate AS Settle, 
   IIf([ScheduleType]="GL","GNMA",IIf([ScheduleType]="MS","GNMA","FNMA")) AS Agency, 
   IIf([ScheduleType]="MS",18,IIf([ScheduleType]="GL",18,IIf([ScheduleType]="MA",2,IIf([ScheduleType]="AA",48,IIf([ScheduleType]="SS",18,18))))) AS Delay, 
   CurrentLoanBalance*ChicagoParticipation AS cBal, 
   OriginalAmount, ChicagoParticipation
FROM tblMPFLoansAggregateSource AS l LEFT JOIN [MPF Hedges] AS h ON l.LoanNumber = h.LoanNumber



------==============================================
qryPalmsDataSource:
SELECT "MPF" AS Portfolio, 
   IIf(Left([ProductCode],2)="MS","MS",IIf(Left([ProductCode],2)="GL","GL",IIf([RemittanceTypeID]=1,"SS",IIf([RemittanceTypeID]=3,"MA","AA")))) AS ScheduleType, 
   True AS [Active?], 
   IIf([PortfolioIndicator]="BATCH",Year([OriginalLoanClosingDate]),Year([LoanRecordCreationDate])) AS OriginationYear, 
   LoanRecordCreationDate, LoanNumber, DeliveryCommitmentNumber, 
   IIf([PortfolioIndicator]="BATCH",IIf(Month([OriginalLoanClosingDate])>9,Month([OriginalLoanClosingDate]),"0" & Month([OriginalLoanClosingDate])),IIf(Month([LoanRecordCreationDate])>9,Month([LoanRecordCreationDate]),"0" & Month([LoanRecordCreationDate]))) AS OriginationMonth, 
   Right([ProductCode],2) AS AccountType, 
   (CInt([InterestRate]*200)/200)*100 AS PassThruRate, 
   [ScheduleType] & [OriginationYear] & [AccountType] & ([PassThruRate]*100) AS CUSIP, 
   [OriginationYear] AS AccountClass, [MPFBalance]*[ChicagoParticipation] AS Notional, 
   1 AS Mult, 
   IIf([CurrentLoanBalance]=0,[OriginalAmount]/[OriginalAmount],[CurrentLoanBalance]/[OriginalAmount]) AS Factor, 
   "1" AS [Add Accrued?], "Mid" AS PV, "Mid" AS Swap, 
   (CInt([InterestRate]*100000)/100000)*100 AS Wac, 
   (CInt([Coupon]*100000)/100000)*100 AS Coup, 
   [Wac]-[Coup] AS Diff, 
   CInt(NPer(([InterestRate]/12),([PIAmount]*-1),[CurrentLoanBalance])) AS WAM, 
   Age, 
   IIf([AccountType]=15,160,IIf([AccountType]=20,220,IIf([AccountType]=30,335,""))) AS Swam, 
   tblPALMSRepo.RepoRate AS Repo, 
   EntryDate AS Settle, 
   NextDate([Settle],[ScheduleType]) AS NxtPmt, "0" AS PPConst, "1" AS PPMult, "1" AS PPSense, "0" AS Lag, "0" AS Lock, "12" AS PPFq, [NxtPmt] AS NxtPP, 
   NextDate([Settle],[ScheduleType]) AS NxtRst1, 
   [Wac] AS PrepWac, [Coup] AS PrepCoup, "Fixed" AS FA, "0" AS Const2, 1 AS Mult1, 0 AS Mult2, "3L" AS Rate, "12" AS RF, -1000000000 AS Floor, 1000000000 AS Cap, 
   1 AS PF, 1000000000 AS PF1, 1000000000 AS PF2, 1000000000 AS PC, "Bond" AS AB, [NxtRst1] AS NxtRst2, 0 AS LookBack2, 0 AS LookBackRate, 
   EntryDate AS WamDate, "CPR" AS PPUnits, 0 AS PPCRShift, 0 AS RcvCurrEscr, 0 AS PayCurrEscr, "StraightLine" AS AmortMethod, "MPFProgram" AS ClientName, 
   PrepaymentInterestRate, 
   CurrentLoanBalance AS AcctBalance, 
   IIf([ScheduleType]="GL","GNMA",IIf([ScheduleType]="MS","GNMA","FNMA")) AS Agency, 
   IIf([ScheduleType]="MS",18,IIf([ScheduleType]="GL",18,IIf([ScheduleType]="MA",2,IIf([ScheduleType]="AA",48,IIf([ScheduleType]="SS",18,18))))) AS Delay, 
   NumberOfMonths AS OWAM, 0 AS Ballon, 1 AS IF, 0 AS Const1, 0 AS [Int Coup Mult], 1 AS [PP Coup Mult], -10000000000 AS [Sum Floor], 
   10000000000 AS [Sum Cap], "None" AS [Servicing Model], "None" AS [Loss Model], 0 AS [Sched Cap?], 
   CurrentLoanBalance, OriginalAmount, ChicagoParticipation, LoanRecordCreationDate
FROM tblMPFLoansAggregateSource, tblPALMSRepo
ORDER BY LoanNumber;


qryHedgedPalmsDataSource:
SELECT qryPalmsDataSource.*, 
   [MPF Hedges].DeliveryCommitmentNumber AS DeliveryCommitmentNumber, 
   CStr([qryPalmsDataSource].[DeliveryCommitmentNumber]) AS DCNText, 
   "DC" & IIF([SwapHedgeID] is Null, "00", Right([SwapHedgeID], 2)) & [ScheduleType] & Right([AccountClass],4) & [AccountType] & [PassThruRate] AS CusipHedged, 
   [MPF Hedges].PurchaseGroup, 
   [MPF Hedges].HedgeID
FROM qryPalmsDataSource LEFT JOIN [MPF Hedges] ON qryPalmsDataSource.LoanNumber = [MPF Hedges].LoanNumber
WHERE ((([MPF Hedges].HedgeID) Is Not Null));


---------- scratch:
'--SELECT "MPF" AS Portfolio, 
'--   IIf(Left([ProductCode],2)="MS","MS",IIf(Left([ProductCode],2)="GL","GL",IIf([RemittanceTypeID]=1,"SS",IIf([RemittanceTypeID]=3,"MA","AA")))) AS ScheduleType, 
'--   IIf([PortfolioIndicator]="BATCH",Year([OriginalLoanClosingDate]),Year([LoanRecordCreationDate])) AS OriginationYear, 
'--   LoanNumber,
'--   Right([ProductCode],2) AS AccountType, 
'--   (CInt([InterestRate]*200)/200)*100 AS PassThruRate, 
'--   [ScheduleType] & [OriginationYear] & [AccountType] & ([PassThruRate]*100) AS CUSIP, 
'--   [OriginationYear] AS AccountClass, [MPFBalance]*[ChicagoParticipation] AS Notional, 
'--   IIf([CurrentLoanBalance]=0,[OriginalAmount]/[OriginalAmount],[CurrentLoanBalance]/[OriginalAmount]) AS Factor, 
'--   (CInt([InterestRate]*100000)/100000)*100 AS Wac, 
'--   (CInt([Coupon]*100000)/100000)*100 AS Coup, 
'--   [Wac]-[Coup] AS Diff, 
'--   CInt(NPer(([InterestRate]/12),([PIAmount]*-1),[CurrentLoanBalance])) AS WAM, 
'--   Age, 
'--   IIf([AccountType]=15,160,IIf([AccountType]=20,220,IIf([AccountType]=30,335,""))) AS Swam, 
'--   EntryDate AS Settle, 
'--   PrepaymentInterestRate, 
'--   IIf([ScheduleType]="GL","GNMA",IIf([ScheduleType]="MS","GNMA","FNMA")) AS Agency, 
'--   IIf([ScheduleType]="MS",18,IIf([ScheduleType]="GL",18,IIf([ScheduleType]="MA",2,IIf([ScheduleType]="AA",48,IIf([ScheduleType]="SS",18,18))))) AS Delay, 
'--   CurrentLoanBalance, OriginalAmount, ChicagoParticipation, LoanRecordCreationDate
'--FROM tblMPFLoansAggregateSource
'--ORDER BY LoanNumber;


