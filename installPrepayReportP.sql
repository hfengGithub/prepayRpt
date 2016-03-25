USE prepayRpt
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fn_YearMonthDayToDate]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fn_YearMonthDayToDate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_Report_C]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_Report_C]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_calcPremium]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_calcPremium]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_collectCurData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_collectCurData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_errHandler]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_errHandler]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_init]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_init]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_loadCurrent]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_loadCurrent]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_loadMonthlyReport]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_loadMonthlyReport]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_loadPoolData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_loadPoolData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_makeForecast]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_makeForecast]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_prelimReport]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_prelimReport]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_rankCurServicer]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_rankCurServicer]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_setCPR]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_setCPR]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_setCPRothers]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_setCPRothers]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_setChgoFactor]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_setChgoFactor]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_setCurPoolData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_setCurPoolData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_setPortfolioFactor]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_setPortfolioFactor]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_setStat]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_setStat]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_setTop20A]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_setTop20A]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_setTop20B]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_setTop20B]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_UV_CprelimReport]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[rpt_UV_CprelimReport]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_UV_pPrelimReport]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[rpt_UV_pPrelimReport]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_CPRCDR_byWAC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rpt_CPRCDR_byWAC]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_FHLBtotal]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rpt_FHLBtotal]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_LoanAdjustment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rpt_LoanAdjustment]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_MonthlyReportC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rpt_MonthlyReportC]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_MonthlyReportC_Pivot]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rpt_MonthlyReportC_Pivot]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_MonthlyReportC_Pivotdiff]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rpt_MonthlyReportC_Pivotdiff]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_MonthlyReportCpools]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rpt_MonthlyReportCpools]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_MonthlyReportCterm]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rpt_MonthlyReportCterm]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_MonthlyReportCtermyr]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rpt_MonthlyReportCtermyr]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_Reference]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rpt_Reference]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_etlLog]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rpt_etlLog]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_master]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rpt_master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_monRptHist]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rpt_monRptHist]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_monthlyReport]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rpt_monthlyReport]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_poolData]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rpt_poolData]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_prelimReport]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rpt_prelimReport]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_servicer]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rpt_servicer]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_servicerPool]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rpt_servicerPool]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_top20A]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rpt_top20A]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_top20Ahist]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rpt_top20Ahist]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_top20B]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rpt_top20B]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_top20Bhist]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[rpt_top20Bhist]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO




CREATE FUNCTION dbo.fn_YearMonthDayToDate
(
	@intYear 	INTEGER,
	@intMonth	INTEGER,
	@intDay		INTEGER
)
RETURNS DATETIME
AS
BEGIN
	DECLARE @vchDateString VARCHAR(25),
					@dtm	DATETIME

	SET @vchDateString = CAST(@intYear AS VARCHAR(5)) + '.' + CAST(@intMonth AS VARCHAR(3)) + '.' + CAST(@intDay AS VARCHAR(3))
	SET @dtm = CONVERT(VARCHAR(25),@vchDateString,102)

	RETURN @dtm

END





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE TABLE [dbo].[rpt_CPRCDR_byWAC] (
	[cprcdr_WACRange] [decimal](19, 7) NULL ,
	[cprcdr_AGENCY] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cprcdr_OrigTerm] [int] NULL ,
	[cprcdr_OrigYear] [int] NULL ,
	[cprcdr_Waclow] [decimal](19, 7) NULL ,
	[cprcdr_Wachigh] [decimal](19, 7) NULL ,
	[cprcdr_asofdate] [int] NULL ,
	[cprcdr_Cpr1] [decimal](19, 7) NULL ,
	[cprcdr_Cpr3] [decimal](19, 7) NULL ,
	[cprcdr_Cpr6] [decimal](19, 7) NULL ,
	[cprcdr_Cpr12] [decimal](19, 7) NULL ,
	[cprcdr_Cpr24] [decimal](19, 7) NULL ,
	[cprcdr_CprLife] [decimal](19, 7) NULL ,
	[cprcdr_OBal] [decimal](19, 7) NULL ,
	[cprcdr_CBal] [decimal](19, 7) NULL ,
	[cprcdr_npool] [int] NULL ,
	[cprcdr_Factor] [decimal](19, 7) NULL ,
	[cprcdr_Coupon] [decimal](19, 7) NULL ,
	[cprcdr_Wac] [decimal](19, 7) NULL ,
	[cprcdr_Wam] [int] NULL ,
	[cprcdr_Age] [int] NULL ,
	[cprcdr_OLnsz] [decimal](19, 7) NULL ,
	[cprcdr_CLnsz] [decimal](19, 7) NULL ,
	[cprcdr_wtolnsz] [decimal](19, 7) NULL ,
	[cprcdr_wtclnsz] [decimal](19, 7) NULL ,
	[cprcdr_ONLoans] [int] NULL ,
	[cprcdr_CNLoans] [decimal](19, 7) NULL ,
	[cprcdr_OSato] [decimal](19, 7) NULL ,
	[cprcdr_CSato] [decimal](19, 7) NULL ,
	[cprcdr_oltv] [decimal](19, 7) NULL ,
	[cprcdr_cltv] [decimal](19, 7) NULL ,
	[cprcdr_fico] [decimal](19, 7) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[rpt_FHLBtotal] (
	[ft_LastestDate] [datetime] NULL ,
	[ft_FHLBtCurBal] [decimal](19, 7) NULL ,
	[ft_RptTotalBalC] [decimal](19, 7) NULL ,
	[ft_RptTotalBalS] [decimal](19, 7) NULL ,
	[ft_OrangeSheet] [decimal](19, 7) NULL ,
	[ft_OrangeSheetDiff] [decimal](19, 7) NULL ,
	[ft_OrangeSheetSys] [decimal](19, 7) NULL ,
	[ft_OrangeSheetSysDiff] [decimal](19, 7) NULL ,
	[ft_AcctMPFNotional] [decimal](19, 7) NULL ,
	[ft_AcctAgentFee] [decimal](19, 7) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[rpt_LoanAdjustment] (
	[la_loanNumber] [bigint] NOT NULL ,
	[la_asOfDate] [datetime] NOT NULL ,
	[la_adjustment] [decimal](19, 7) NULL ,
	[la_nonChAgentFee] [decimal](19, 7) NULL ,
	[la_rptType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[rpt_MonthlyReportC] (
	[C_rptType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[C_LoanProgram] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[C_ServicerName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[C_SumOrigBal] [decimal](19, 7) NULL ,
	[C_SumCurrentBal] [decimal](19, 7) NULL ,
	[C_showRank] [decimal](19, 7) NULL ,
	[C_FactorCalc] [decimal](19, 7) NULL ,
	[C_WALA] [decimal](19, 7) NULL ,
	[C_GrossCoupon] [decimal](19, 7) NULL ,
	[C_SumprevBal] [decimal](19, 7) NULL ,
	[C_Sumbal3monbefore] [decimal](19, 7) NULL ,
	[C_CPR1Month] [decimal](19, 7) NULL ,
	[C_FNCPR1month] [decimal](19, 7) NULL ,
	[C_FHCPR1month] [decimal](19, 7) NULL ,
	[C_GNCPR1month] [decimal](19, 7) NULL ,
	[C_FNchgCPR1] [decimal](19, 7) NULL ,
	[C_FNperchgCPR1] [decimal](19, 7) NULL ,
	[C_FHchgCPR1] [decimal](19, 7) NULL ,
	[C_FHperchgCPR1] [decimal](19, 7) NULL ,
	[C_GNchgCPR1] [decimal](19, 7) NULL ,
	[C_GNPerchgCPR1] [decimal](19, 7) NULL ,
	[C_CPR3Month] [decimal](19, 7) NULL ,
	[C_FNchgCPR3] [decimal](19, 7) NULL ,
	[C_FNperchgCPR3] [decimal](19, 7) NULL ,
	[C_FHchgCPR3] [decimal](19, 7) NULL ,
	[C_FHperchgCPR3] [decimal](19, 7) NULL ,
	[C_GNchgCPR3] [decimal](19, 7) NULL ,
	[C_GNPerchgCPR3] [decimal](19, 7) NULL ,
	[C_CPR12Month] [decimal](19, 7) NULL ,
	[C_FNchgCPR12] [decimal](19, 7) NULL ,
	[C_FNPerchgCPR12] [decimal](19, 7) NULL ,
	[C_FHchgCPR12] [decimal](19, 7) NULL ,
	[C_FHperchgCPR12] [decimal](19, 7) NULL ,
	[C_GNchgCPR12] [decimal](19, 7) NULL ,
	[C_GNPerchgCPR12] [decimal](19, 7) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[rpt_MonthlyReportC_Pivot] (
	[Cpivot_rptType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Cpivot_OrigYear] [smallint] NULL ,
	[Cpivot_FN30_1moPerc] [decimal](19, 7) NULL ,
	[Cpivot_FN20_1moPerc] [decimal](19, 7) NULL ,
	[Cpivot_FN15_1moPerc] [decimal](19, 7) NULL ,
	[Cpivot_GN30_1moPerc] [decimal](19, 7) NULL ,
	[Cpivot_FN30_3moPerc] [decimal](19, 7) NULL ,
	[Cpivot_FN20_3moPerc] [decimal](19, 7) NULL ,
	[Cpivot_FN15_3moPerc] [decimal](19, 7) NULL ,
	[Cpivot_GN30_3moPerc] [decimal](19, 7) NULL ,
	[Cpivot_FN30_12moPerc] [decimal](19, 7) NULL ,
	[Cpivot_FN20_12moPerc] [decimal](19, 7) NULL ,
	[Cpivot_FN15_12moPerc] [decimal](19, 7) NULL ,
	[Cpivot_GN30_12moPerc] [decimal](19, 7) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[rpt_MonthlyReportC_Pivotdiff] (
	[Cpvtdiff_rptType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Cpvtdiff_OrigYear] [smallint] NULL ,
	[Cpvtdiff_FN30_1mochg] [decimal](19, 7) NULL ,
	[Cpvtdiff_FN20_1mochg] [decimal](19, 7) NULL ,
	[Cpvtdiff_FN15_1mochg] [decimal](19, 7) NULL ,
	[Cpvtdiff_GN30_1mochg] [decimal](19, 7) NULL ,
	[Cpvtdiff_FN30_3mochg] [decimal](19, 7) NULL ,
	[Cpvtdiff_FN20_3mochg] [decimal](19, 7) NULL ,
	[Cpvtdiff_FN15_3mochg] [decimal](19, 7) NULL ,
	[Cpvtdiff_GN30_3mochg] [decimal](19, 7) NULL ,
	[Cpvtdiff_FN30_12mochg] [decimal](19, 7) NULL ,
	[Cpvtdiff_FN20_12mochg] [decimal](19, 7) NULL ,
	[Cpvtdiff_FN15_12mochg] [decimal](19, 7) NULL ,
	[Cpvtdiff_GN30_12mochg] [decimal](19, 7) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[rpt_MonthlyReportCpools] (
	[Cpools_rptType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Cpools_agency] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Cpools_ServicerName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Cpools_OrigTerm] [smallint] NOT NULL ,
	[Cpools_WALA] [smallint] NULL ,
	[Cpools_LoanProgram] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Cpools_GrossCoupon] [decimal](19, 7) NOT NULL ,
	[Cpools_GrossCouponInt] [decimal](19, 7) NOT NULL ,
	[Cpools_OrigYear] [smallint] NOT NULL ,
	[Cpools_OrigBal] [decimal](19, 7) NULL ,
	[Cpools_CurrentBal] [decimal](19, 7) NULL ,
	[Cpools_Factorcalc] [decimal](19, 7) NULL ,
	[Cpools_prevBal] [decimal](19, 7) NULL ,
	[Cpools_bal3monbefore] [decimal](19, 7) NULL ,
	[Cpools_bal12monbefore] [decimal](19, 7) NULL ,
	[Cpools_ShowRank] [int] NULL ,
	[Cpools_CPR1month] [decimal](19, 7) NULL ,
	[Cpools_CPR3month] [decimal](19, 7) NULL ,
	[Cpools_CPR12month] [decimal](19, 7) NULL ,
	[FNCPR1month] [decimal](19, 7) NULL ,
	[FHCPR1month] [decimal](19, 7) NULL ,
	[GNCPR1month] [decimal](19, 7) NULL ,
	[FNCPR3month] [decimal](19, 7) NULL ,
	[FHCPR3month] [decimal](19, 7) NULL ,
	[GNCPR3month] [decimal](19, 7) NULL ,
	[FNCPR12month] [decimal](19, 7) NULL ,
	[FHCPR12month] [decimal](19, 7) NULL ,
	[GNCPR12month] [decimal](19, 7) NULL ,
	[GNchgCPR1] [decimal](19, 7) NULL ,
	[GNPerchgCPR1] [decimal](19, 7) NULL ,
	[FNchgCPR1] [decimal](19, 7) NULL ,
	[FNPerchgCPR1] [decimal](19, 7) NULL ,
	[FHchgCPR1] [decimal](19, 7) NULL ,
	[FHPerchgCPR1] [decimal](19, 7) NULL ,
	[GNchgCPR3] [decimal](19, 7) NULL ,
	[GNPerchgCPR3] [decimal](19, 7) NULL ,
	[FNchgCPR3] [decimal](19, 7) NULL ,
	[FNPerchgCPR3] [decimal](19, 7) NULL ,
	[FHchgCPR3] [decimal](19, 7) NULL ,
	[FHPerchgCPR3] [decimal](19, 7) NULL ,
	[GNchgCPR12] [decimal](19, 7) NULL ,
	[GNPerchgCPR12] [decimal](19, 7) NULL ,
	[FNchgCPR12] [decimal](19, 7) NULL ,
	[FNPerchgCPR12] [decimal](19, 7) NULL ,
	[FHchgCPR12] [decimal](19, 7) NULL ,
	[FHPerchgCPR12] [decimal](19, 7) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[rpt_MonthlyReportCterm] (
	[Cterm_rptType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Cterm_LoanProgram] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Cterm_OrigTerm] [smallint] NULL ,
	[Cterm_ServicerName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Cterm_SumOrigBal] [decimal](19, 7) NULL ,
	[Cterm_SumPrevBal] [decimal](19, 7) NULL ,
	[Cterm_SumCurrentBal] [decimal](19, 7) NULL ,
	[Cterm_showRank] [decimal](19, 7) NULL ,
	[Cterm_FactorCalc] [decimal](19, 7) NULL ,
	[Cterm_WALA] [decimal](19, 7) NULL ,
	[Cterm_GrossCoupon] [decimal](19, 7) NULL ,
	[Cterm_CPR1Month] [decimal](19, 7) NULL ,
	[Cterm_FNCPR1month] [decimal](19, 7) NULL ,
	[Cterm_FHCPR1month] [decimal](19, 7) NULL ,
	[Cterm_GNCPR1month] [decimal](19, 7) NULL ,
	[Cterm_FNchgCPR1] [decimal](19, 7) NULL ,
	[Cterm_FNperchgCPR1] [decimal](19, 7) NULL ,
	[Cterm_FHchgCPR1] [decimal](19, 7) NULL ,
	[Cterm_FHperchgCPR1] [decimal](19, 7) NULL ,
	[Cterm_GNchgCPR1] [decimal](19, 7) NULL ,
	[Cterm_GNPerchgCPR1] [decimal](19, 7) NULL ,
	[Cterm_CPR3Month] [decimal](19, 7) NULL ,
	[Cterm_FNchgCPR3] [decimal](19, 7) NULL ,
	[Cterm_FNperchgCPR3] [decimal](19, 7) NULL ,
	[Cterm_FHchgCPR3] [decimal](19, 7) NULL ,
	[Cterm_FHperchgCPR3] [decimal](19, 7) NULL ,
	[Cterm_GNchgCPR3] [decimal](19, 7) NULL ,
	[Cterm_GNPerchgCPR3] [decimal](19, 7) NULL ,
	[Cterm_CPR12Month] [decimal](19, 7) NULL ,
	[Cterm_FNchgCPR12] [decimal](19, 7) NULL ,
	[Cterm_FNPerchgCPR12] [decimal](19, 7) NULL ,
	[Cterm_FHchgCPR12] [decimal](19, 7) NULL ,
	[Cterm_FHperchgCPR12] [decimal](19, 7) NULL ,
	[Cterm_GNchgCPR12] [decimal](19, 7) NULL ,
	[Cterm_GNPerchgCPR12] [decimal](19, 7) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[rpt_MonthlyReportCtermyr] (
	[Ctermyr_rptType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Ctermyr_LoanProgram] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Ctermyr_OrigTerm] [smallint] NULL ,
	[Ctermyr_OrigYear] [smallint] NULL ,
	[Ctermyr_ServicerName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Ctermyr_SumOrigBal] [decimal](19, 7) NULL ,
	[Ctermyr_SumCurrentBal] [decimal](19, 7) NULL ,
	[Ctermyr_showRank] [decimal](19, 7) NULL ,
	[Ctermyr_FactorCalc] [decimal](19, 7) NULL ,
	[Ctermyr_WALA] [decimal](19, 7) NULL ,
	[Ctermyr_GrossCoupon] [decimal](19, 7) NULL ,
	[Ctermyr_SumPrevBal] [decimal](19, 7) NULL ,
	[Ctermyr_Sumbal3monbefore] [decimal](19, 7) NULL ,
	[Ctermyr_CPR1Month] [decimal](19, 7) NULL ,
	[Ctermyr_FNCPR1month] [decimal](19, 7) NULL ,
	[Ctermyr_FHCPR1month] [decimal](19, 7) NULL ,
	[Ctermyr_GNCPR1month] [decimal](19, 7) NULL ,
	[Ctermyr_FNchgCPR1] [decimal](19, 7) NULL ,
	[Ctermyr_FNperchgCPR1] [decimal](19, 7) NULL ,
	[Ctermyr_FHchgCPR1] [decimal](19, 7) NULL ,
	[Ctermyr_FHperchgCPR1] [decimal](19, 7) NULL ,
	[Ctermyr_GNchgCPR1] [decimal](19, 7) NULL ,
	[Ctermyr_GNPerchgCPR1] [decimal](19, 7) NULL ,
	[Ctermyr_CPR3Month] [decimal](19, 7) NULL ,
	[Ctermyr_FNchgCPR3] [decimal](19, 7) NULL ,
	[Ctermyr_FNperchgCPR3] [decimal](19, 7) NULL ,
	[Ctermyr_FHchgCPR3] [decimal](19, 7) NULL ,
	[Ctermyr_FHperchgCPR3] [decimal](19, 7) NULL ,
	[Ctermyr_GNchgCPR3] [decimal](19, 7) NULL ,
	[Ctermyr_GNPerchgCPR3] [decimal](19, 7) NULL ,
	[Ctermyr_CPR12Month] [decimal](19, 7) NULL ,
	[Ctermyr_FNchgCPR12] [decimal](19, 7) NULL ,
	[Ctermyr_FNPerchgCPR12] [decimal](19, 7) NULL ,
	[Ctermyr_FHchgCPR12] [decimal](19, 7) NULL ,
	[Ctermyr_FHperchgCPR12] [decimal](19, 7) NULL ,
	[Ctermyr_GNchgCPR12] [decimal](19, 7) NULL ,
	[Ctermyr_GNPerchgCPR12] [decimal](19, 7) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[rpt_Reference] (
	[refCode] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[refDescription] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[refValue] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

INSERT INTO rpt_Reference (refCode, refDescription, refValue)
VALUES ('STARTYEAR', 'Earliest origYear', 2000)
INSERT INTO rpt_Reference (refCode, refDescription, refValue)
VALUES ('WACSPREAD', 'Difference between highest & lowest WACs in 1 group', '0.5')
INSERT INTO rpt_Reference (refCode, refDescription, refValue)
VALUES ('WACMOVEDBY', 'Amount the WAClow is moved from regular interval', '0')
INSERT INTO rpt_Reference (refCode, refDescription, refValue)
VALUES ('RANKMPF', 'Rank for MPF', 1)
INSERT INTO rpt_Reference (refCode, refDescription, refValue)
VALUES ('RANKFIRST', 'First rank for PFIs', 101)
INSERT INTO rpt_Reference (refCode, refDescription, refValue)
VALUES ('RANKLAST', 'Last rank for PFIs', 120)
INSERT INTO rpt_Reference (refCode, refDescription, refValue)
VALUES ('RANKOTHER', 'Rank for "All Others"', 201)
INSERT INTO rpt_Reference (refCode, refDescription, refValue)
VALUES ('LATESTYEAR', 'MAX(YEAR(payDate))', 2005)
INSERT INTO rpt_Reference (refCode, refDescription, refValue)
VALUES ('LATESTMONTH', 'MONTH(MAX(payDate))', 2)
INSERT INTO rpt_Reference (refCode, refDescription, refValue)
VALUES ('1STRPTYEAR', 'First rptYear in rpt_poolData', 2004)

CREATE TABLE [dbo].[rpt_etlLog] (
	[process] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[logTime] [datetime] NOT NULL ,
	[message] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[rpt_master] (
	[ms_LoanProgram] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ms_OrigDate] [datetime] NOT NULL ,
	[ms_OrigTerm] [int] NOT NULL ,
	[ms_AmortTerm] [int] NULL ,
	[ms_OrigBal] [decimal](19, 7) NOT NULL ,
	[ms_OrigLTV] [decimal](19, 7) NULL ,
	[ms_curWAC] [decimal](19, 7) NULL ,
	[ms_CurNet] [decimal](19, 7) NOT NULL ,
	[ms_CurWALA] [int] NOT NULL ,
	[ms_CurWAM] [int] NOT NULL ,
	[ms_CurFactor] [decimal](19, 7) NOT NULL ,
	[ms_curBal] [decimal](19, 7) NOT NULL ,
	[ms_CurLTV] [decimal](19, 7) NULL ,
	[ms_LoanSize] [decimal](19, 7) NULL ,
	[ms_BorrowerFICO] [decimal](19, 7) NULL ,
	[ms_BorrowerIncome] [decimal](19, 7) NULL ,
	[ms_CoBorrowerIncome] [decimal](19, 7) NULL ,
	[ms_CoBorrowerFICO] [decimal](19, 7) NULL ,
	[ms_Servicer] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ms_ServicerNumber] [int] NULL ,
	[ms_GrossMargin] [decimal](19, 7) NULL ,
	[ms_ServicingFee] [decimal](19, 7) NULL ,
	[ms_LoanIDNumber] [bigint] NOT NULL ,
	[ms_PropertyTypeCode] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ms_OccupancyCode] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ms_GeoAreaCode] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ms_DocumentationType] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ms_LoanPurposeCode] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ms_AsOfDate] [datetime] NOT NULL ,
	[ms_ParticipationFactor] [decimal](19, 7) NULL ,
	[ms_state] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ms_RemittanceTypeId] [int] NULL ,
	[ms_monthlyPayment] [decimal](19, 7) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[rpt_monRptHist] (
	[mrh_agency] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mrh_ServicerNumber] [int] NULL ,
	[mrh_ServicerName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mrh_OrigTerm] [smallint] NOT NULL ,
	[mrh_LoanProgram] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[mrh_WACspread] [decimal](19, 7) NULL ,
	[mrh_GrossCoupon] [decimal](19, 7) NOT NULL ,
	[mrh_GrossCouponInt] [decimal](19, 7) NOT NULL ,
	[mrh_NetCoupon] [decimal](19, 7) NULL ,
	[mrh_OrigYear] [smallint] NOT NULL ,
	[mrh_FactorCalc] [decimal](19, 7) NULL ,
	[mrh_OrigBal] [decimal](19, 7) NULL ,
	[mrh_CurrentBal] [decimal](19, 7) NULL ,
	[mrh_WALA] [smallint] NULL ,
	[mrh_CPR1Month] [decimal](19, 7) NULL ,
	[mrh_CPR3Month] [decimal](19, 7) NULL ,
	[mrh_CPR6Month] [decimal](19, 7) NULL ,
	[mrh_CPR12Month] [decimal](19, 7) NULL ,
	[mrh_CPRLife] [decimal](19, 7) NULL ,
	[mrh_Source] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mrh_showRank] [int] NULL ,
	[mrh_rptType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mrh_bal3MonBefore] [decimal](19, 7) NULL ,
	[mrh_numLoans] [int] NULL ,
	[mrh_numLoans3MonBefore] [int] NULL ,
	[mrh_sumChgoPart] [decimal](19, 7) NULL ,
	[mrh_premium] [decimal](19, 7) NULL ,
	[mrh_discount] [decimal](19, 7) NULL ,
	[mrh_pdNet] [decimal](19, 7) NULL ,
	[mrh_prevLnsz] [decimal](19, 7) NULL ,
	[mrh_prevBal] [decimal](19, 7) NULL ,
	[mrh_bal12monBefore] [decimal](19, 7) NULL ,
	[mrh_cpr1p1] [decimal](19, 7) NULL ,
	[mrh_rptYearMonth] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[rpt_monthlyReport] (
	[mr_agency] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mr_ServicerNumber] [int] NULL ,
	[mr_ServicerName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mr_OrigTerm] [smallint] NOT NULL ,
	[mr_LoanProgram] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[mr_WACspread] [decimal](19, 7) NULL ,
	[mr_GrossCoupon] [decimal](19, 7) NOT NULL ,
	[mr_GrossCouponInt] [decimal](19, 7) NOT NULL ,
	[mr_NetCoupon] [decimal](19, 7) NULL ,
	[mr_OrigYear] [smallint] NOT NULL ,
	[mr_FactorCalc] [decimal](19, 7) NULL ,
	[mr_OrigBal] [decimal](19, 7) NULL ,
	[mr_CurrentBal] [decimal](19, 7) NULL ,
	[mr_WALA] [smallint] NULL ,
	[mr_CPR1Month] [decimal](19, 7) NULL ,
	[mr_CPR3Month] [decimal](19, 7) NULL ,
	[mr_CPR6Month] [decimal](19, 7) NULL ,
	[mr_CPR12Month] [decimal](19, 7) NULL ,
	[mr_CPRLife] [decimal](19, 7) NULL ,
	[mr_Source] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mr_showRank] [int] NULL ,
	[mr_rptType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mr_bal3MonBefore] [decimal](19, 7) NULL ,
	[mr_numLoans] [int] NULL ,
	[mr_numLoans3MonBefore] [int] NULL ,
	[mr_sumChgoPart] [decimal](19, 7) NULL ,
	[mr_premium] [decimal](19, 7) NULL ,
	[mr_discount] [decimal](19, 7) NULL ,
	[mr_pdNet] [decimal](19, 7) NULL ,
	[mr_prevLnsz] [decimal](19, 7) NULL ,
	[mr_prevBal] [decimal](19, 7) NULL ,
	[mr_bal12monBefore] [decimal](19, 7) NULL ,
	[mr_cpr1p1] [decimal](19, 7) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[rpt_poolData] (
	[pd_rptYear] [smallint] NOT NULL ,
	[pd_rptMonth] [smallint] NOT NULL ,
	[pd_ServicerNumber] [int] NOT NULL ,
	[pd_origYear] [smallint] NOT NULL ,
	[pd_origTerm] [smallint] NOT NULL ,
	[pd_loanProgram] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[pd_WACspread] [decimal](19, 7) NOT NULL ,
	[pd_WACLow] [decimal](19, 7) NOT NULL ,
	[pd_WAC] [decimal](19, 7) NOT NULL ,
	[pd_poolFactor] [decimal](19, 7) NULL ,
	[pd_origBal] [decimal](19, 7) NULL ,
	[pd_prevBal] [decimal](19, 7) NULL ,
	[pd_curBal] [decimal](19, 7) NULL ,
	[pd_WALA] [decimal](19, 7) NULL ,
	[pd_SMM] [decimal](19, 7) NULL ,
	[pd_CPR1month] [decimal](19, 7) NULL ,
	[pd_CPR3Month] [decimal](19, 7) NULL ,
	[pd_CPR6Month] [decimal](19, 7) NULL ,
	[pd_CPR1Year] [decimal](19, 7) NULL ,
	[pd_CPRLife] [decimal](19, 7) NULL ,
	[pd_adjYearMonth] [int] NOT NULL ,
	[pd_rptType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[pd_aveLoanSize] [decimal](19, 7) NULL ,
	[pd_numLoans] [int] NULL ,
	[pd_aveChgoPart] [decimal](19, 7) NULL ,
	[pd_sumChgoPart] [decimal](19, 7) NULL ,
	[pd_FICO] [decimal](19, 7) NULL ,
	[pd_LTV] [decimal](19, 7) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[rpt_prelimReport] (
	[prelim_ServicerNumber] [int] NULL ,
	[prelim_ServicerName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[prelim_OrigTerm] [smallint] NOT NULL ,
	[prelim_LoanProgram] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[prelim_OrigYear] [smallint] NOT NULL ,
	[prelim_WAClow] [decimal](19, 7) NOT NULL ,
	[prelim_GrossCoupon] [decimal](19, 7) NOT NULL ,
	[prelim_CPR1] [decimal](19, 7) NULL ,
	[prelim_estCPR1] [decimal](19, 7) NULL ,
	[prelim_estCurBal] [decimal](19, 7) NULL ,
	[prelim_CurBal] [decimal](19, 7) NULL ,
	[prelim_PreBal] [decimal](19, 7) NULL ,
	[prelim_WALA] [int] NULL ,
	[prelim_CPR1Month] [decimal](19, 7) NULL ,
	[prelim_CPR3Month] [decimal](19, 7) NULL ,
	[prelim_CPR6Month] [decimal](19, 7) NULL ,
	[prelim_Paydown] [decimal](19, 7) NULL ,
	[prelim_RptYearMonth] [int] NULL ,
	[prelim_SchPrincipal] [decimal](19, 7) NULL ,
	[prelim_PremiumPaydown] [decimal](19, 7) NULL ,
	[prelim_RptType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[prelim_Net] [decimal](19, 7) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[rpt_servicer] (
	[ServicerNumber] [int] NULL ,
	[ServicerName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[rpt_servicerPool] (
	[sp_rptYear] [smallint] NOT NULL ,
	[sp_rptMonth] [smallint] NOT NULL ,
	[sp_poolRank] [smallint] NOT NULL ,
	[sp_servicerNumber] [int] NOT NULL ,
	[sp_curBal] [decimal](19, 7) NULL ,
	[sp_rptType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[rpt_top20A] (
	[ta_nlFlag] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ta_Score] [decimal](19, 7) NULL ,
	[ta_meanComponent] [decimal](19, 7) NULL ,
	[ta_stdComponent] [decimal](19, 7) NULL ,
	[ta_stdFlag] [int] NULL ,
	[ta_lsFlag] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ta_servicerName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ta_cBal] [decimal](19, 7) NULL ,
	[ta_cRank] [int] NULL ,
	[ta_pctBal] [decimal](19, 7) NULL ,
	[ta_premium] [decimal](19, 7) NULL ,
	[ta_discount] [decimal](19, 7) NULL ,
	[ta_net] [decimal](19, 7) NULL ,
	[ta_pctPD] [decimal](19, 7) NULL ,
	[ta_rptType] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ta_pLnsz] [decimal](19, 7) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[rpt_top20Ahist] (
	[tah_summary] [decimal](19, 7) NULL ,
	[tah_fico] [decimal](19, 7) NULL ,
	[tah_LTV] [decimal](19, 7) NULL ,
	[tah_incHigh] [decimal](19, 7) NULL ,
	[tah_incLow] [decimal](19, 7) NULL ,
	[tah_geo] [decimal](19, 7) NULL ,
	[tah_loanSize] [decimal](19, 7) NULL ,
	[tah_servicerNumber] [int] NULL ,
	[tah_servicerName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[tah_cBal] [decimal](19, 7) NULL ,
	[tah_cRank] [int] NULL ,
	[tah_pctBal] [decimal](19, 7) NULL ,
	[tah_premium] [decimal](19, 7) NULL ,
	[tah_discount] [decimal](19, 7) NULL ,
	[tah_net] [decimal](19, 7) NULL ,
	[tah_pctPD] [decimal](19, 7) NULL ,
	[tah_rptType] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[tah_pLnsz] [decimal](19, 7) NULL ,
	[tah_rptYearMonth] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[rpt_top20B] (
	[tb_nlFlag] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[tb_Score] [decimal](19, 7) NULL ,
	[tb_meanComponent] [decimal](19, 7) NULL ,
	[tb_stdComponent] [decimal](19, 7) NULL ,
	[tb_stdFlag] [int] NULL ,
	[tb_lsFlag] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[tb_servicerName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[tb_cBalCh] [decimal](19, 7) NULL ,
	[tb_cRankCh] [int] NULL ,
	[tb_pctBalCh] [decimal](19, 7) NULL ,
	[tb_pctCumCh] [decimal](19, 7) NULL ,
	[tb_cBalSys] [decimal](19, 7) NULL ,
	[tb_cRankSys] [int] NULL ,
	[tb_pctBalSys] [decimal](19, 7) NULL ,
	[tb_pctCumSys] [decimal](19, 7) NULL ,
	[tb_rptType] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[tb_pLnszCh] [decimal](19, 7) NULL ,
	[tb_pLnszSys] [decimal](19, 7) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[rpt_top20Bhist] (
	[tbh_summary] [decimal](19, 7) NULL ,
	[tbh_fico] [decimal](19, 7) NULL ,
	[tbh_LTV] [decimal](19, 7) NULL ,
	[tbh_incHigh] [decimal](19, 7) NULL ,
	[tbh_incLow] [decimal](19, 7) NULL ,
	[tbh_geo] [decimal](19, 7) NULL ,
	[tbh_loanSize] [decimal](19, 7) NULL ,
	[tbh_servicerNumber] [int] NULL ,
	[tbh_servicerName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[tbh_cBalCh] [decimal](19, 7) NULL ,
	[tbh_cRankCh] [int] NULL ,
	[tbh_pctBalCh] [decimal](19, 7) NULL ,
	[tbh_pctCumCh] [decimal](19, 7) NULL ,
	[tbh_cBalSys] [decimal](19, 7) NULL ,
	[tbh_cRankSys] [int] NULL ,
	[tbh_pctBalSys] [decimal](19, 7) NULL ,
	[tbh_pctCumSys] [decimal](19, 7) NULL ,
	[tbh_rptType] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[tbh_pLnszCh] [decimal](19, 7) NULL ,
	[tbh_pLnszSys] [decimal](19, 7) NULL ,
	[tbh_rptYearMonth] [int] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[rpt_poolData] WITH NOCHECK ADD 
	CONSTRAINT [PK_rpt_poolData] PRIMARY KEY  CLUSTERED 
	(
		[pd_rptYear],
		[pd_rptMonth],
		[pd_ServicerNumber],
		[pd_origYear],
		[pd_origTerm],
		[pd_loanProgram],
		[pd_WACspread],
		[pd_WACLow],
		[pd_adjYearMonth],
		[pd_rptType]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[rpt_LoanAdjustment] ADD 
	CONSTRAINT [IX_rpt_LoanAdjustment] UNIQUE  NONCLUSTERED 
	(
		[la_loanNumber] DESC ,
		[la_rptType],
		[la_asOfDate] DESC 
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[rpt_master] ADD 
	CONSTRAINT [IX_rpt_masterLN] UNIQUE  NONCLUSTERED 
	(
		[ms_LoanIDNumber] DESC 
	)  ON [PRIMARY] 
GO

 CREATE  INDEX [IX_rpt_masterCB] ON [dbo].[rpt_master]([ms_LoanProgram], [ms_OrigTerm] DESC , [ms_OrigDate] DESC ) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE  VIEW rpt_UV_cPrelimReport AS
SELECT p.* 
FROM   dbo.rpt_prelimReport p, 
   (
   SELECT 
      prelim_OrigTerm,
      prelim_LoanProgram ,
      prelim_OrigYear ,
      prelim_WAClow,
      prelim_rptYearMonth
   FROM   dbo.rpt_prelimReport 
   WHERE  prelim_ServicerName='MPF'
   AND    prelim_rptType='C'
   AND    prelim_rptYearMonth=(SELECT MAX(prelim_rptYearMonth) FROM dbo.rpt_prelimReport WHERE prelim_rptType='C')
   ) AS v
WHERE  p.prelim_rptYearMonth=v.prelim_rptYearMonth
AND    p.prelim_rptType='C'
AND    p.prelim_OrigTerm=v.prelim_OrigTerm
AND    p.prelim_OrigYear=v.prelim_OrigYear
AND    p.prelim_WAClow=v.prelim_WAClow


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW rpt_UV_pPrelimReport AS
SELECT p.* 
FROM   dbo.rpt_prelimReport p, 
   (
   SELECT 
      prelim_OrigTerm,
      prelim_LoanProgram ,
      prelim_OrigYear ,
      prelim_WAClow,
      prelim_rptYearMonth
   FROM   dbo.rpt_prelimReport 
   WHERE  prelim_ServicerName='MPF'
   AND    prelim_rptType='P'
   AND    prelim_rptYearMonth=(SELECT MAX(prelim_rptYearMonth) FROM dbo.rpt_prelimReport WHERE prelim_rptType='P')
   ) AS v
WHERE  p.prelim_rptYearMonth=v.prelim_rptYearMonth
AND    p.prelim_rptType='P'
AND    p.prelim_OrigTerm=v.prelim_OrigTerm
AND    p.prelim_OrigYear=v.prelim_OrigYear
AND    p.prelim_WAClow=v.prelim_WAClow


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE Procedure usp_Report_C
	/* Param List */
AS

/******************************************************************************
**		File: 
**		Name: Stored_Procedure_Name
**		Desc: 
**
**		This template can be customized:
**              
**		Return values:
** 
**		Called by:   
**              
**		Parameters:
**		Input							Output
**     ----------							-----------
**
**		Auth: 
**		Date: 
*******************************************************************************
**		Change History
*******************************************************************************
**		Date:		Author:				Description:
**		04/05/04	AMR				    Produces MPF/ FH & FN CPR ratios
**    
*******************************************************************************/


   DECLARE @n_WACspread decimal(19, 7), @n_WACmovedBy decimal(19, 7)
   SET @n_WACspread=(SELECT  refValue FROM rpt_Reference WHERE refCode='WACSPREAD')


----Auxilary Tables


		
--	SELECT *, WALA FROM rpt_MonthlyReport WHERE wala >12 order by ServicerName, Cpools_LoanProgram, OrigTerm
-------------------------------------------------------
-- SQL Code for Report C starts here
	

--	TRUNCATE TABLE dbo.rpt_MonthlyReportC
	----------------------------------------------------------------
	-- CPR3month ratios


	TRUNCATE TABLE rpt_MonthlyReportCpools
	INSERT INTO rpt_MonthlyReportCpools
	SELECT 	mpf.mr_rptType AS Cpools_rptType, mpf.mr_agency AS Cpools_agency, mpf.mr_ServicerName AS Cpools_ServicerName,  mpf.mr_OrigTerm As Cpools_OrigTerm, mpf.mr_WALA AS Cpools_WALA,
		mpf.mr_LoanProgram AS Cpools_LoanProgram, mpf.mr_GrossCoupon AS Cpools_GrossCoupon , mpf.mr_GrossCouponInt AS Cpools_GrossCouponInt, 
		mpf.mr_OrigYear as Cpools_OrigYear, mpf.mr_OrigBal AS Cpools_OrigBal, mpf.mr_CurrentBal AS Cpools_CurrentBal, mpf.mr_Factorcalc AS Cpools_Factorcalc, mpf.mr_prevBal AS Cpools_prevBal, 
		mpf.mr_bal3monbefore AS Cpools_bal3monbefore, mpf.mr_bal12monbefore AS Cpools_bal12monbefore, mpf.mr_ShowRank AS Cpools_ShowRank ,
		mpf.mr_CPR1month AS Cpools_CPR1month, mpf3mo.mr_CPR3month AS Cpools_CPR3month,  mpf12mo.mr_CPR12month AS Cpools_CPR12month,  FN1mo.mr_CPR1month AS FNCPR1month,  
		FH1mo.mr_CPR1month AS FHCPR1month,  GN1mo.mr_CPR1month AS GNCPR1month,  FN3mo.mr_CPR3month AS FNCPR3month,  
		FH3mo.mr_CPR3month AS FHCPR3month,  GN3mo.mr_CPR3month AS GNCPR3month,  
		FN12mo.mr_CPR12month AS FNCPR12month,  FH12mo.mr_CPR12month AS FHCPR12month,  GN12mo.mr_CPR12month AS GNCPR12month,  
		mpf1mo.mr_CPR1month -  GN1mo.mr_CPR1month  AS GNchgCPR1,  mpf1mo.mr_CPR1month /  GN1mo.mr_CPR1month  AS GNPerchgCPR1,
		mpf1mo.mr_CPR1month -  FN1mo.mr_CPR1month  AS FNchgCPR1,  mpf1mo.mr_CPR1month /  FN1mo.mr_CPR1month    AS FNPerchgCPR1,
		mpf1mo.mr_CPR1month -  FH1mo.mr_CPR1month  AS FHchgCPR1,  mpf1mo.mr_CPR1month /  FH1mo.mr_CPR1month    AS FHPerchgCPR1,
		mpf3mo.mr_CPR3month -  GN3mo.mr_CPR3month  AS GNchgCPR3,  mpf3mo.mr_CPR3month /  GN3mo.mr_CPR3month  AS GNPerchgCPR3,
		mpf3mo.mr_CPR3month -  FN3mo.mr_CPR3month  AS FNchgCPR3,  mpf3mo.mr_CPR3month /  FN3mo.mr_CPR3month    AS FNPerchgCPR3,
		mpf3mo.mr_CPR3month -  FH3mo.mr_CPR3month  AS FHchgCPR3,  mpf3mo.mr_CPR3month /  FH3mo.mr_CPR3month    AS FHPerchgCPR3,
		mpf12mo.mr_CPR12month - GN12mo.mr_CPR12month AS GNchgCPR12, mpf12mo.mr_CPR12month / GN12mo.mr_CPR12month   AS GNPerchgCPR12,
		mpf12mo.mr_CPR12month - FN12mo.mr_CPR12month AS FNchgCPR12, mpf12mo.mr_CPR12month / FN12mo.mr_CPR12month   AS FNPerchgCPR12,
		mpf12mo.mr_CPR12month - FH12mo.mr_CPR12month AS FHchgCPR12, mpf12mo.mr_CPR12month / FH12mo.mr_CPR12month   AS FHPerchgCPR12
	FROM rpt_MonthlyReport MPF 
		LEFT OUTER JOIN 
	--  MPF1MO
		(SELECT mr_rptType, mr_agency, mr_ServicerName, mr_LoanProgram, mr_OrigTerm, 
			mr_OrigYear, mr_GrossCouponInt, mr_CPR1month
			--, Cpools_bal3monbefore
			FROM rpt_MonthlyReport
			WHERE rpt_MonthlyReport.mr_agency='MPF' and mr_prevBal >=5) AS MPF1mo
			ON  MPF1mo.mr_OrigTerm		= MPF.mr_OrigTerm 
			AND MPF1mo.mr_LoanProgram	= MPF.mr_LoanProgram
			AND MPF1mo.mr_OrigYear		= MPF.mr_OrigYear
			AND MPF1mo.mr_GrossCouponInt = MPF.mr_GrossCouponInt
			AND MPF1mo.mr_ServicerName		= MPF.mr_ServicerName
			AND MPF1mo.mr_rptType			= MPF.mr_rptType
		LEFT OUTER JOIN 
	--  MPF3MO
		(SELECT mr_rptType, mr_agency, mr_ServicerName, mr_LoanProgram, mr_OrigTerm, 
			mr_OrigYear, mr_GrossCouponInt, mr_CPR3month
			--, Cpools_bal3monbefore
			FROM rpt_MonthlyReport
			WHERE rpt_MonthlyReport.mr_agency='MPF' and mr_bal3monbefore >=5) AS MPF3mo
			ON  MPF3mo.mr_OrigTerm	= MPF.mr_OrigTerm 
			AND MPF3mo.mr_LoanProgram = MPF.mr_LoanProgram
			AND MPF3mo.mr_OrigYear = MPF.mr_OrigYear
			AND MPF3mo.mr_GrossCouponInt = MPF.mr_GrossCouponInt
			AND MPF3mo.mr_ServicerName = MPF.mr_ServicerName
			AND MPF3mo.mr_rptType = MPF.mr_rptType
		LEFT OUTER JOIN 
		--  MPF12MO
		(SELECT mr_rptType, mr_agency, mr_ServicerName, mr_LoanProgram, mr_OrigTerm, 
			mr_OrigYear, mr_GrossCouponInt, mr_CPR12month, mr_bal12monbefore
			FROM rpt_MonthlyReport
			WHERE rpt_MonthlyReport.mr_agency='MPF' AND mr_bal12MonBefore >=5) AS MPF12mo
			ON	MPF12mo.mr_OrigTerm	= MPF.mr_OrigTerm 
			AND MPF12mo.mr_LoanProgram = MPF.mr_LoanProgram
			AND MPF12mo.mr_OrigYear	= MPF.mr_OrigYear
			AND MPF12mo.mr_GrossCouponInt = MPF.mr_GrossCouponInt
			AND MPF12mo.mr_ServicerName	= MPF.mr_ServicerName
			AND MPF12mo.mr_rptType			= MPF.mr_rptType

		LEFT OUTER JOIN 
		-- GNMA II CPR-1 mo
		(SELECT mr_rptType, mr_agency, mr_ServicerName, mr_LoanProgram, mr_OrigTerm, 
			mr_OrigYear, mr_GrossCouponInt, mr_CPR1month
			FROM rpt_MonthlyReport
			WHERE rpt_MonthlyReport.mr_agency='GNMA II' AND mr_CPR1month >=1) AS GN1mo
			ON 
			    GN1mo.mr_OrigTerm	= MPF.mr_OrigTerm 
			AND GN1mo.mr_LoanProgram = MPF.mr_LoanProgram
			AND GN1mo.mr_OrigYear = MPF.mr_OrigYear
			AND GN1mo.mr_GrossCouponInt = MPF.mr_GrossCouponInt

		LEFT OUTER JOIN 
		-- GNMA II CPR-3 mo
		(SELECT mr_rptType, mr_agency, mr_ServicerName, mr_LoanProgram, mr_OrigTerm, 
			mr_OrigYear, mr_GrossCouponInt, mr_CPR3month
			FROM rpt_MonthlyReport
			WHERE rpt_MonthlyReport.mr_agency='GNMA II' AND mr_CPR3month >=1) AS GN3mo
			ON 
			    GN3mo.mr_OrigTerm		= MPF.mr_OrigTerm 
			AND GN3mo.mr_LoanProgram	= MPF.mr_LoanProgram
			AND GN3mo.mr_OrigYear		= MPF.mr_OrigYear
			AND GN3mo.mr_GrossCouponInt = MPF.mr_GrossCouponInt

		LEFT OUTER JOIN 
		-- GNMA II CPR-12mo
		(SELECT mr_rptType, mr_agency, mr_ServicerName, mr_LoanProgram, mr_OrigTerm, 
			mr_OrigYear, mr_GrossCouponInt, mr_CPR12month
			FROM rpt_MonthlyReport
			WHERE rpt_MonthlyReport.mr_agency='GNMA II' AND mr_CPR12month >=1) AS GN12mo
			ON 
			    GN12mo.mr_OrigTerm		= MPF.mr_OrigTerm 
			AND GN12mo.mr_LoanProgram	= MPF.mr_LoanProgram
			AND GN12mo.mr_OrigYear		= MPF.mr_OrigYear
			AND GN12mo.mr_GrossCouponInt	= MPF.mr_GrossCouponInt
			
		LEFT  OUTER JOIN 
		-- FNMA 1mo
		(SELECT mr_rptType, rpt_MonthlyReport.mr_agency, rpt_MonthlyReport.mr_ServicerName, rpt_MonthlyReport.mr_LoanProgram, rpt_MonthlyReport.mr_OrigTerm, 
			rpt_MonthlyReport.mr_OrigYear, rpt_MonthlyReport.mr_GrossCouponInt, rpt_MonthlyReport.mr_CPR1month 
			FROM rpt_MonthlyReport
			WHERE rpt_MonthlyReport.mr_agency='FNMA' AND mr_CPR3month >=1) AS FN1mo 
			ON 
			    FN1mo.mr_OrigTerm		= MPF.mr_OrigTerm
			AND FN1mo.mr_LoanProgram	= MPF.mr_LoanProgram
			AND FN1mo.mr_OrigYear		= MPF.mr_OrigYear
			AND FN1mo.mr_GrossCouponInt	= MPF.mr_GrossCouponInt
						
			LEFT  OUTER JOIN 

		-- FNMA 3mo
		(SELECT mr_rptType, rpt_MonthlyReport.mr_agency, rpt_MonthlyReport.mr_ServicerName, rpt_MonthlyReport.mr_LoanProgram, rpt_MonthlyReport.mr_OrigTerm, 
			rpt_MonthlyReport.mr_OrigYear, rpt_MonthlyReport.mr_GrossCouponInt, rpt_MonthlyReport.mr_CPR3month
			FROM rpt_MonthlyReport
			WHERE rpt_MonthlyReport.mr_agency='FNMA' AND mr_CPR3month >=1) AS FN3mo 
			ON 
			    FN3mo.mr_OrigTerm		= MPF.mr_OrigTerm
			AND FN3mo.mr_LoanProgram	= MPF.mr_LoanProgram
			AND FN3mo.mr_OrigYear		= MPF.mr_OrigYear
			AND FN3mo.mr_GrossCouponInt = MPF.mr_GrossCouponInt
						
			LEFT  OUTER JOIN 
		-- FNMA 12mo
		(SELECT mr_rptType, rpt_MonthlyReport.mr_agency, rpt_MonthlyReport.mr_ServicerName, rpt_MonthlyReport.mr_LoanProgram, rpt_MonthlyReport.mr_OrigTerm, 
			rpt_MonthlyReport.mr_OrigYear, rpt_MonthlyReport.mr_GrossCouponInt, rpt_MonthlyReport.mr_CPR12month
			FROM rpt_MonthlyReport
			WHERE rpt_MonthlyReport.mr_agency='FNMA' AND mr_CPR12month >=1) AS FN12mo
			ON 
			    FN12mo.mr_OrigTerm= MPF.mr_OrigTerm
			AND FN12mo.mr_LoanProgram = MPF.mr_LoanProgram
			AND FN12mo.mr_OrigYear = MPF.mr_OrigYear
			AND FN12mo.mr_GrossCouponInt = MPF.mr_GrossCouponInt

		LEFT OUTER JOIN 
		-- FHLMC 1mo
		(SELECT mr_rptType, rpt_MonthlyReport.mr_agency, rpt_MonthlyReport.mr_ServicerName, rpt_MonthlyReport.mr_LoanProgram, rpt_MonthlyReport.mr_OrigTerm, 
			rpt_MonthlyReport.mr_OrigYear, rpt_MonthlyReport.mr_GrossCouponInt, rpt_MonthlyReport.mr_CPR1month
			FROM rpt_MonthlyReport
			WHERE rpt_MonthlyReport.mr_agency='FHLMC' AND mr_CPR3month >=1) AS FH1mo
			ON 
			    FH1mo.mr_OrigTerm= MPF.mr_OrigTerm
			AND FH1mo.mr_LoanProgram = MPF.mr_LoanProgram
			AND FH1mo.mr_OrigYear = MPF.mr_OrigYear
			AND FH1mo.mr_GrossCouponInt = MPF.mr_GrossCouponInt
		
		LEFT OUTER JOIN 
		-- FHLMC 3mo
		(SELECT mr_rptType, rpt_MonthlyReport.mr_agency, rpt_MonthlyReport.mr_ServicerName, rpt_MonthlyReport.mr_LoanProgram, rpt_MonthlyReport.mr_OrigTerm, 
			rpt_MonthlyReport.mr_OrigYear, rpt_MonthlyReport.mr_GrossCouponInt, rpt_MonthlyReport.mr_CPR3month, rpt_MonthlyReport.mr_CPR12month
			FROM rpt_MonthlyReport
			WHERE rpt_MonthlyReport.mr_agency='FHLMC' AND mr_CPR3month >=1) AS FH3mo
			ON 
			    FH3mo.mr_OrigTerm= MPF.mr_OrigTerm
			AND FH3mo.mr_LoanProgram = MPF.mr_LoanProgram
			AND FH3mo.mr_OrigYear = MPF.mr_OrigYear
			AND FH3mo.mr_GrossCouponInt = MPF.mr_GrossCouponInt
						
		LEFT OUTER JOIN 
		-- FHLMC 12mo
		(SELECT mr_rptType, rpt_MonthlyReport.mr_agency, rpt_MonthlyReport.mr_ServicerName, rpt_MonthlyReport.mr_LoanProgram, rpt_MonthlyReport.mr_OrigTerm, 
			rpt_MonthlyReport.mr_OrigYear, rpt_MonthlyReport.mr_GrossCouponInt, rpt_MonthlyReport.mr_CPR3month, rpt_MonthlyReport.mr_CPR12month
			FROM rpt_MonthlyReport
			WHERE rpt_MonthlyReport.mr_agency='FHLMC' AND mr_CPR12month >=1) AS FH12mo ON 
			    FH12mo.mr_OrigTerm= MPF.mr_OrigTerm
			AND FH12mo.mr_LoanProgram = MPF.mr_LoanProgram
			AND FH12mo.mr_OrigYear = MPF.mr_OrigYear
			AND FH12mo.mr_GrossCouponInt = MPF.mr_GrossCouponInt
								
		WHERE mpf.mr_agency='MPF' AND mpf.mr_OrigTerm In (180, 240, 360) AND mpf.mr_WACspread=@n_WACspread
		

--------
----- 'FROM rpt_MonthlyReportCpools INTO dbo.rpt_MonthlyReportC'

-- Aggregations: GROUP BY  mpf.rptType,  MPF.mr_LoanProgram, MPF.mr_ServicerName
TRUNCATE TABLE dbo.rpt_MonthlyReportC
INSERT INTO 	dbo.rpt_MonthlyReportC
SELECT mpf.Cpools_rptType AS C_rptType, mpf.Cpools_LoanProgram AS C_LoanProgram, mpf.Cpools_ServicerName AS C_ServicerName, 
	mpf.SumOrigBal AS C_SumOrigBal,	mpf.SumCurrentBal AS C_SumCurrentBal, mpf.Cpools_showRank AS Cterm_showRank, 
	mpf.Cpools_FactorCalc AS C_FactorCalc, mpf.Cpools_WALA AS C_WALA, mpf.Cpools_GrossCoupon AS C_GrossCoupon, 
	SumprevBal AS C_SumprevBal, mpf.Sumbal3monbefore AS C_Sumbal3monbefore, C1mo.Cpools_CPR1Month AS C_CPR1Month, 
	C1mo.FNCPR1month AS C_FNCPR1month, C1mo.FHCPR1month AS C_FHCPR1month, C1mo.GNCPR1month AS C_GNCPR1month, 
	C1mo.FNchgCPR1 AS C_FNchgCPR1, C1mo.FNperchgCPR1 AS C_FNperchgCPR1, C1mo.FHchgCPR1 AS C_FHchgCPR1, C1mo.FHperchgCPR1 AS C_FHperchgCPR1, C1mo.GNchgCPR1 AS C_GNchgCPR1,
	GNPerchgCPR1 AS C_GNPerchgCPR1,	C3mo.Cpools_CPR3Month AS C_CPR3Month, C3mo.FNchgCPR3 AS C_FNchgCPR3, C3mo.FNperchgCPR3 AS C_FNperchgCPR3, C3mo.FHchgCPR3 AS C_FHchgCPR3, 
	C3mo.FHperchgCPR3 AS C_FHperchgCPR3, C3mo.GNchgCPR3 AS C_GNchgCPR3, GNPerchgCPR3 AS  C_GNPerchgCPR3 , CPR12Month AS C_CPR12Month, 
	FNchgCPR12 AS C_FNchgCPR12, FNPerchgCPR12 AS C_FNPerchgCPR12, C12mo.FHchgCPR12 AS C_FHchgCPR12, C12mo.FHperchgCPR12 AS C_FHperchgCPR12, 
	C12mo.GNchgCPR12 AS C_GNchgCPR12, C12mo.GNPerchgCPR12 AS C_GNPerchgCPR12 
	FROM 
	(
	SELECT 	Cpools_rptType, Cpools_LoanProgram, Cpools_ServicerName, 
	Sum(Cpools_OrigBal) 	AS SumOrigBal,
	Sum(Cpools_CurrentBal) AS SumCurrentBal,
	Sum(Cpools_prevBal) AS SumprevBal,
	Sum(Cpools_bal3monbefore) AS Sumbal3monbefore,
	Sum(Cpools_CurrentBal) AS Cpools_showRank,
	Sum(Cpools_CurrentBal) / Sum(Cpools_OrigBal) 	AS Cpools_FactorCalc,
	Sum(Cpools_CurrentBal*Cpools_WALA)/Sum(Cpools_CurrentBal) AS Cpools_WALA,	
	Sum(Cpools_CurrentBal*Cpools_GrossCoupon)/Sum(Cpools_CurrentBal) AS Cpools_GrossCoupon 
	FROM rpt_MonthlyReportCpools WHERE Cpools_CurrentBal>0
	GROUP BY  Cpools_rptType,  Cpools_LoanProgram, Cpools_ServicerName
	) AS MPF 
	
	LEFT OUTER JOIN 
	(
	SELECT 	Cpools_rptType, Cpools_LoanProgram, Cpools_ServicerName, 
	Sum(Cpools_prevBal*Cpools_CPR1Month)	/Sum(Cpools_prevBal) 		AS Cpools_CPR1Month, 
	Sum(Cpools_prevBal*FNCPR1month)	/Sum(Cpools_prevBal) 	AS FNCPR1month,
	Sum(Cpools_prevBal*FHCPR1month)	/Sum(Cpools_prevBal) 	AS FHCPR1month,
	Sum(Cpools_prevBal*GNCPR1month)	/Sum(Cpools_prevBal) 	AS GNCPR1month,
	Sum(Cpools_prevBal*FNchgCPR1)	/Sum(Cpools_prevBal) 		AS FNchgCPR1, 
	Sum(Cpools_prevBal*FNPerchgCPR1)  /Sum(Cpools_prevBal) 	AS FNPerchgCPR1, 
	Sum(Cpools_prevBal*FHchgCPR1)	/Sum(Cpools_prevBal) 		AS FHchgCPR1, 
	Sum(Cpools_prevBal*FHPerchgCPR1) 	/Sum(Cpools_prevBal) 	AS FHPerchgCPR1, 
	Sum(Cpools_prevBal*GNchgCPR1)	/Sum(Cpools_prevBal) 		AS GNchgCPR1, 
	Sum(Cpools_prevBal*GNPerchgCPR1)  /Sum(Cpools_prevBal) 	AS GNPerchgCPR1
	FROM rpt_MonthlyReportCpools
	WHERE Cpools_CPR1Month>=1 AND Cpools_prevBal >= 5
	 AND 
	(	(Cpools_LoanProgram='Conventional' AND FNCPR1month>=1 AND FHCPR1month >=1 ) 
	  OR    (Cpools_LoanProgram='Government'   AND GNCPR1month >=1 ))
	GROUP BY  Cpools_rptType,  Cpools_LoanProgram, Cpools_ServicerName
	) AS C1mo 
	ON		    
	 MPF.Cpools_rptType 	= C1mo.Cpools_rptType 
	AND MPF.Cpools_LoanProgram 	= C1mo.Cpools_LoanProgram
	AND MPF.Cpools_ServicerName 	= C1mo.Cpools_ServicerName  
--	AND MPF.Cpools_OrigTerm 	= C1mo.Cpools_OrigTerm  
--	AND MPF.mr_OrigYear 	= C1mo.mr_OrigYear
--	AND MPF.Cpools_GrossCouponInt  = C1mo.Cpools_GrossCouponInt  


	LEFT OUTER JOIN 
	
	
	(
	SELECT 	Cpools_rptType, Cpools_LoanProgram, Cpools_ServicerName, 
	Sum(Cpools_bal3monbefore*Cpools_CPR3Month)	/Sum(Cpools_bal3monbefore) 		AS Cpools_CPR3Month, 
	Sum(Cpools_bal3monbefore*FNchgCPR3)	/Sum(Cpools_bal3monbefore) 		AS FNchgCPR3, 
	Sum(Cpools_bal3monbefore*FNPerchgCPR3)  /Sum(Cpools_bal3monbefore) 	AS FNPerchgCPR3, 
	Sum(Cpools_bal3monbefore*FHchgCPR3)	/Sum(Cpools_bal3monbefore) 		AS FHchgCPR3, 
	Sum(Cpools_bal3monbefore*FHPerchgCPR3) 	/Sum(Cpools_bal3monbefore) 	AS FHPerchgCPR3, 
	Sum(Cpools_bal3monbefore*GNchgCPR3)	/Sum(Cpools_bal3monbefore) 		AS GNchgCPR3, 
	Sum(Cpools_bal3monbefore*GNPerchgCPR3) /Sum(Cpools_bal3monbefore) 	AS GNPerchgCPR3
	FROM rpt_MonthlyReportCpools
	WHERE Cpools_CPR3Month>=1 AND Cpools_bal3monbefore >= 5
	 AND 
	(	(Cpools_LoanProgram='Conventional' AND FNCPR3Month>=1 AND FHCPR3Month >=1 ) 
	  OR    (Cpools_LoanProgram='Government'  AND GNCPR3Month >=1 ))
	GROUP BY  Cpools_rptType,  Cpools_LoanProgram, Cpools_ServicerName
	) AS C3MO 
	ON		    
	 MPF.Cpools_rptType 	= C3mo.Cpools_rptType 
	AND MPF.Cpools_LoanProgram 	= C3mo.Cpools_LoanProgram
	AND MPF.Cpools_ServicerName 	= C3mo.Cpools_ServicerName  
--	AND MPF.Cpools_OrigTerm 	= C3mo.Cpools_OrigTerm  
--	AND MPF.mr_OrigYear 	= C3mo.mr_OrigYear
--	AND MPF.Cpools_GrossCouponInt  = C3mo.Cpools_GrossCouponInt  
	LEFT OUTER JOIN 
	(
	SELECT Cpools_rptType, Cpools_LoanProgram, Cpools_ServicerName, 
	Sum(Cpools_bal12monBefore*Cpools_CPR12month)   /Sum(Cpools_bal12monBefore) 	AS CPR12Month, 
	Sum(Cpools_bal12monBefore*FNchgCPR12)   /Sum(Cpools_bal12monBefore) 	AS FNchgCPR12, 
	Sum(Cpools_bal12monBefore*FNPerchgCPR12)/Sum(Cpools_bal12monBefore)		AS FNPerchgCPR12, 
	Sum(Cpools_bal12monBefore*FHchgCPR12)   /Sum(Cpools_bal12monBefore) 	AS FHchgCPR12, 
	Sum(Cpools_bal12monBefore*FHPerchgCPR12)/Sum(Cpools_bal12monBefore) 	AS FHPerchgCPR12, 
	Sum(Cpools_bal12monBefore*GNchgCPR12)   /Sum(Cpools_bal12monBefore) 	AS GNchgCPR12, 
	Sum(Cpools_bal12monBefore*GNPerchgCPR12)/Sum(Cpools_bal12monBefore) 	AS GNPerchgCPR12
	 FROM rpt_MonthlyReportCpools
	 WHERE Cpools_CPR12month>=1 AND Cpools_bal3monbefore >= 5
	AND 
	(	(Cpools_LoanProgram='Conventional' AND FNCPR12Month>=1 AND FHCPR12Month >=1 ) 
	  OR    (Cpools_LoanProgram='Government'   AND GNCPR12Month >=1 ))
	 GROUP BY  Cpools_rptType,  Cpools_LoanProgram, Cpools_ServicerName
	) AS C12MO 
	ON		    
	    MPF.Cpools_rptType 	= C12mo.Cpools_rptType 
	AND MPF.Cpools_LoanProgram 	= C12mo.Cpools_LoanProgram
	AND MPF.Cpools_ServicerName 	= C12mo.Cpools_ServicerName  
--	AND MPF.Cpools_OrigTerm 	= C12mo.Cpools_OrigTerm  
--	AND MPF.mr_OrigYear 	= C12mo.mr_OrigYear
--	AND MPF.Cpools_GrossCouponInt  = C12mo.Cpools_GrossCouponInt  
	ORDER BY mpf.Cpools_rptType,  MPF.Cpools_LoanProgram, MPF.Cpools_ServicerName


	--- 'update Cpools_showRank'
	Update 	dbo.rpt_MonthlyReportC
	Set 	C_showRank =
		Case 
		When C_ServicerName = 'All Others' Then 0
		ELSE C_showRank 
		END
-----------------------
-- Aggregations: GROUP BY  mpf.Cpools_rptType,  MPF.Cpools_LoanProgram, MPF.Cpools_ServicerName, mpf.Cpools_OrigTerm

TRUNCATE TABLE dbo.rpt_MonthlyReportCterm
INSERT INTO 	dbo.rpt_MonthlyReportCterm
SELECT mpf.Cpools_rptType AS Cterm_rptType, mpf.Cpools_LoanProgram AS Cterm_LoanProgram, mpf.Cpools_OrigTerm AS Cterm_OrigTerm, 
	mpf.Cpools_ServicerName AS Cterm_ServicerName, mpf.SumOrigBal AS Cterm_SumOrigBal, SumPrevBal AS Cterm_SumPrevBal, 
	mpf.SumCurrentBal AS Cterm_SumCurrentBal,mpf.Cpools_showRank AS Cterm_showRank,mpf.FactorCalc AS Cterm_FactorCalc, 
	mpf.Cpools_WALA AS Cterm_WALA, mpf.Cpools_GrossCoupon AS Cterm_GrossCoupon, 
--	C3mo.mr_c3MOCurBal, C12mo.mr_CurBal, 	
	C1mo.Cpools_CPR1Month AS Cterm_CPR1Month, C1mo.FNCPR1month AS Cterm_FNCPR1month, C1mo.FHCPR1month AS Cterm_FHCPR1month, C1mo.GNCPR1month AS Cterm_GNCPR1month, 
	C1mo.FNchgCPR1 AS Cterm_FNchgCPR1, C1mo.FNperchgCPR1 AS Cterm_FNperchgCPR1, C1mo.FHchgCPR1 AS Cterm_FHchgCPR1, C1mo.FHperchgCPR1 AS Cterm_FHperchgCPR1, C1mo.GNchgCPR1 AS Cterm_GNchgCPR1, 	
	GNPerchgCPR1 AS Cterm_GNPerchgCPR1,C3mo.Cpools_CPR3Month AS Cterm_CPR3Month, C3mo.FNchgCPR3 AS Cterm_FNchgCPR3, C3mo.FNperchgCPR3 AS Cterm_FNperchgCPR3, 
	C3mo.FHchgCPR3 AS Cterm_FHchgCPR3, C3mo.FHperchgCPR3 AS Cterm_FHperchgCPR3, C3mo.GNchgCPR3 AS Cterm_GNchgCPR3, GNPerchgCPR3 AS Cterm_GNPerchgCPR3 , 	
	CPR12Month AS Cterm_CPR12Month, FNchgCPR12 AS Cterm_FNchgCPR12, FNPerchgCPR12 AS Cterm_FNPerchgCPR12, C12mo.FHchgCPR12 AS Cterm_FHchgCPR12, 
	C12mo.FHperchgCPR12 AS Cterm_FHperchgCPR12 , C12mo.GNchgCPR12 AS Cterm_GNchgCPR12, C12mo.GNPerchgCPR12 AS Cterm_GNPerchgCPR12 
	FROM 
	(
	SELECT 	Cpools_rptType, Cpools_LoanProgram, Cpools_OrigTerm, Cpools_ServicerName, 
	Sum(Cpools_OrigBal) 	AS SumOrigBal,
	Sum(Cpools_CurrentBal) AS SumCurrentBal,
	Sum(Cpools_prevBal) AS SumPrevBal,
	Sum(Cpools_CurrentBal) AS Cpools_showRank,
	Sum(Cpools_CurrentBal) / Sum(Cpools_OrigBal) 	AS FactorCalc,
	Sum(Cpools_CurrentBal*Cpools_WALA)/Sum(Cpools_CurrentBal) AS Cpools_WALA,	
	Sum(Cpools_CurrentBal*Cpools_GrossCoupon)/Sum(Cpools_CurrentBal) AS Cpools_GrossCoupon 
	FROM rpt_MonthlyReportCpools WHERE Cpools_CurrentBal>0
	GROUP BY  Cpools_rptType,  Cpools_LoanProgram, Cpools_OrigTerm, Cpools_ServicerName
	) AS MPF 

	LEFT OUTER JOIN 
	(
	SELECT 	Cpools_rptType, Cpools_LoanProgram, Cpools_OrigTerm, Cpools_ServicerName, 
	Sum(Cpools_prevBal*Cpools_CPR1Month)	/Sum(Cpools_prevBal) 		AS Cpools_CPR1Month, 
	Sum(Cpools_prevBal*FNCPR1month)	/Sum(Cpools_prevBal) 	AS FNCPR1month,
	Sum(Cpools_prevBal*FHCPR1month)	/Sum(Cpools_prevBal) 	AS FHCPR1month,
	Sum(Cpools_prevBal*GNCPR1month)	/Sum(Cpools_prevBal) 	AS GNCPR1month,
	Sum(Cpools_prevBal*FNchgCPR1)	/Sum(Cpools_prevBal) 		AS FNchgCPR1, 
	Sum(Cpools_prevBal*FNPerchgCPR1)  /Sum(Cpools_prevBal) 	AS FNPerchgCPR1, 
	Sum(Cpools_prevBal*FHchgCPR1)	/Sum(Cpools_prevBal) 		AS FHchgCPR1, 
	Sum(Cpools_prevBal*FHPerchgCPR1) 	/Sum(Cpools_prevBal) 	AS FHPerchgCPR1, 
	Sum(Cpools_prevBal*GNchgCPR1)	/Sum(Cpools_prevBal) 		AS GNchgCPR1, 
	Sum(Cpools_prevBal*GNPerchgCPR1)  /Sum(Cpools_prevBal) 	AS GNPerchgCPR1

	FROM rpt_MonthlyReportCpools
	WHERE Cpools_CPR1Month>=1 
	 AND 
	(	(Cpools_LoanProgram='Conventional' AND FNCPR1Month>=1 AND FHCPR1Month >=1 ) 
	  OR    (Cpools_LoanProgram='Government'   AND GNCPR1Month >=1 ))
	GROUP BY  Cpools_rptType,  Cpools_LoanProgram, Cpools_OrigTerm, Cpools_ServicerName
	) AS C1mo 
	ON		    
	 MPF.Cpools_rptType 	= C1mo.Cpools_rptType 
	AND MPF.Cpools_LoanProgram 	= C1mo.Cpools_LoanProgram
	AND MPF.Cpools_ServicerName 	= C1mo.Cpools_ServicerName  
	AND MPF.Cpools_OrigTerm 	= C1mo.Cpools_OrigTerm  
--	AND MPF.mr_OrigYear 	= C1mo.mr_OrigYear
--	AND MPF.Cpools_GrossCouponInt  = C1mo.Cpools_GrossCouponInt  

	
	LEFT OUTER JOIN 
	(
	SELECT 	Cpools_rptType, Cpools_LoanProgram, Cpools_OrigTerm, Cpools_ServicerName, 
	Sum(Cpools_bal3monbefore*Cpools_CPR3Month)	/Sum(Cpools_bal3monbefore) 		AS Cpools_CPR3Month, 
	Sum(Cpools_bal3monbefore*FNchgCPR3)	/Sum(Cpools_bal3monbefore) 		AS FNchgCPR3, 
	Sum(Cpools_bal3monbefore*FNPerchgCPR3)  /Sum(Cpools_bal3monbefore) 	AS FNPerchgCPR3, 
	Sum(Cpools_bal3monbefore*FHchgCPR3)	/Sum(Cpools_bal3monbefore) 		AS FHchgCPR3, 
	Sum(Cpools_bal3monbefore*FHPerchgCPR3) 	/Sum(Cpools_bal3monbefore) 	AS FHPerchgCPR3, 
	Sum(Cpools_bal3monbefore*GNchgCPR3)	/Sum(Cpools_bal3monbefore) 		AS GNchgCPR3, 
	Sum(Cpools_bal3monbefore*GNPerchgCPR3)  /Sum(Cpools_bal3monbefore) 	AS GNPerchgCPR3

	FROM rpt_MonthlyReportCpools
	WHERE Cpools_CPR3Month>=1 
	 AND 
	(	(Cpools_LoanProgram='Conventional' AND FNCPR3Month>=1 AND FHCPR3Month >=1 ) 
	  OR    (Cpools_LoanProgram='Government'   AND GNCPR3Month >=1 ))
	GROUP BY  Cpools_rptType,  Cpools_LoanProgram, Cpools_OrigTerm, Cpools_ServicerName
	) AS C3MO 
	ON		    
	 MPF.Cpools_rptType 	= C3mo.Cpools_rptType 
	AND MPF.Cpools_LoanProgram 	= C3mo.Cpools_LoanProgram
	AND MPF.Cpools_ServicerName 	= C3mo.Cpools_ServicerName  
	AND MPF.Cpools_OrigTerm 	= C3mo.Cpools_OrigTerm  
--	AND MPF.mr_OrigYear 	= C3mo.mr_OrigYear
--	AND MPF.Cpools_GrossCouponInt  = C3mo.Cpools_GrossCouponInt  
	LEFT OUTER JOIN 
	(SELECT Cpools_rptType, Cpools_LoanProgram, Cpools_OrigTerm, Cpools_ServicerName, 
	Sum(Cpools_bal12monBefore*Cpools_CPR12month)   /Sum(Cpools_bal12monBefore) 	AS CPR12Month, 
	Sum(Cpools_bal12monBefore*FNchgCPR12)   /Sum(Cpools_bal12monBefore) 	AS FNchgCPR12, 
	Sum(Cpools_bal12monBefore*FNPerchgCPR12)/Sum(Cpools_bal12monBefore)		AS FNPerchgCPR12, 
	Sum(Cpools_bal12monBefore*FHchgCPR12)   /Sum(Cpools_bal12monBefore) 	AS FHchgCPR12, 
	Sum(Cpools_bal12monBefore*FHPerchgCPR12)/Sum(Cpools_bal12monBefore) 	AS FHPerchgCPR12, 
	Sum(Cpools_bal12monBefore*GNchgCPR12)   /Sum(Cpools_bal12monBefore) 	AS GNchgCPR12, 
	Sum(Cpools_bal12monBefore*GNPerchgCPR12)/Sum(Cpools_bal12monBefore) 	AS GNPerchgCPR12

	
	 FROM rpt_MonthlyReportCpools
	 WHERE Cpools_CPR12month>=1 
	AND 
	(	(Cpools_LoanProgram='Conventional' AND FNCPR12Month>=1 AND FHCPR12Month >=1 ) 
	  OR    (Cpools_LoanProgram='Government'   AND GNCPR12Month >=1 ))
	 GROUP BY  Cpools_rptType,  Cpools_LoanProgram, Cpools_OrigTerm, Cpools_ServicerName
	) AS C12MO 
	ON		    
	    MPF.Cpools_rptType 	= C12mo.Cpools_rptType 
	AND MPF.Cpools_LoanProgram 	= C12mo.Cpools_LoanProgram
	AND MPF.Cpools_ServicerName 	= C12mo.Cpools_ServicerName  
	AND MPF.Cpools_OrigTerm 	= C12mo.Cpools_OrigTerm  
--	AND MPF.mr_OrigYear 	= C12mo.mr_OrigYear
--	AND MPF.Cpools_GrossCouponInt  = C12mo.Cpools_GrossCouponInt  
	
	ORDER BY mpf.Cpools_rptType,  MPF.Cpools_LoanProgram, MPF.Cpools_OrigTerm, MPF.Cpools_ServicerName

	Update 	dbo.rpt_MonthlyReportCterm
	Set 	Cterm_showRank =
		Case 
		When Cterm_ServicerName = 'All Others' Then 0
		ELSE Cterm_showRank 
		END


-----------------------
-- Aggregations: GROUP BY  mpf.Cpools_rptType,  MPF.Cpools_LoanProgram, MPF.Cpools_ServicerName, mpf.Cpools_OrigTerm, mpf.mr_OrigYear

TRUNCATE TABLE dbo.rpt_MonthlyReportCtermyr
INSERT INTO 	dbo.rpt_MonthlyReportCtermyr
SELECT mpf.Cpools_rptType AS Ctermyr_rptType, mpf.Cpools_LoanProgram AS Ctermyr_LoanProgram, mpf.Cpools_OrigTerm AS Ctermyr_OrigTerm, 
	mpf.Cpools_OrigYear AS Ctermyr_OrigYear, mpf.Cpools_ServicerName AS Ctermyr_ServicerName, 
	mpf.SumOrigBal AS Ctermyr_SumOrigBal, mpf.SumCurrentBal AS Ctermyr_SumCurrentBal, mpf.Cpools_showRank AS Ctermyr_showRank, mpf.FactorCalc AS Ctermyr_FactorCalc, 
	mpf.Cpools_WALA AS Ctermyr_WALA, mpf.Cpools_GrossCoupon AS Ctermyr_GrossCoupon, 
	SumPrevBal AS Ctermyr_SumPrevBal, mpf.Sumbal3monbefore AS Ctermyr_Sumbal3monbefore,
--	C3mo.mr_c3MOCurBal, C12mo.mr_CurBal, 	
	C1mo.Cpools_CPR1Month AS Ctermyr_CPR1Month, C1mo.FNCPR1month AS Ctermyr_FNCPR1month, C1mo.FHCPR1month AS Ctermyr_FHCPR1month, C1mo.GNCPR1month AS Ctermyr_GNCPR1month,
	C1mo.FNchgCPR1 AS Ctermyr_FNchgCPR1, C1mo.FNperchgCPR1 AS Ctermyr_FNperchgCPR1, C1mo.FHchgCPR1 AS Ctermyr_FHchgCPR1, C1mo.FHperchgCPR1 AS Ctermyr_FHperchgCPR1, C1mo.GNchgCPR1 AS Ctermyr_GNchgCPR1, GNPerchgCPR1 AS Ctermyr_GNPerchgCPR1,
	C3mo.Cpools_CPR3Month AS Ctermyr_CPR3Month, C3mo.FNchgCPR3 AS Ctermyr_FNchgCPR3, C3mo.FNperchgCPR3 AS Ctermyr_FNperchgCPR3, C3mo.FHchgCPR3 AS Ctermyr_FHchgCPR3, C3mo.FHperchgCPR3 AS Ctermyr_FHperchgCPR3, C3mo.GNchgCPR3 AS Ctermyr_GNchgCPR3,
 	GNPerchgCPR3 AS Ctermyr_GNPerchgCPR3, CPR12Month AS Ctermyr_CPR12Month, FNchgCPR12 AS Ctermyr_FNchgCPR12 , FNPerchgCPR12 AS Ctermyr_FNPerchgCPR12 , 
	C12mo.FHchgCPR12 AS Ctermyr_FHchgCPR12 , C12mo.FHperchgCPR12 AS Ctermyr_FHperchgCPR12, C12mo.GNchgCPR12 AS Ctermyr_GNchgCPR12, C12mo.GNPerchgCPR12 AS Ctermyr_GNPerchgCPR12 
	FROM 
	(
	SELECT 	Cpools_rptType, Cpools_LoanProgram, Cpools_OrigTerm, Cpools_OrigYear, Cpools_ServicerName, 
	Sum(Cpools_OrigBal) 	AS SumOrigBal,
	Sum(Cpools_CurrentBal) AS SumCurrentBal,
	Sum(Cpools_prevBal) AS SumPrevBal,
	Sum(Cpools_bal3monbefore) AS Sumbal3monbefore,
	Sum(Cpools_CurrentBal) AS Cpools_showRank,
	Sum(Cpools_CurrentBal) / Sum(Cpools_OrigBal) 	AS FactorCalc,
	Sum(Cpools_CurrentBal*Cpools_WALA)/Sum(Cpools_CurrentBal) AS Cpools_WALA,	
	Sum(Cpools_CurrentBal*Cpools_GrossCoupon)/Sum(Cpools_CurrentBal) AS Cpools_GrossCoupon 
	FROM rpt_MonthlyReportCpools WHERE Cpools_CurrentBal>0
	GROUP BY  Cpools_rptType,  Cpools_LoanProgram, Cpools_OrigTerm, Cpools_OrigYear, Cpools_ServicerName
	) AS MPF 
	LEFT OUTER JOIN 
	(
	SELECT 	Cpools_rptType, Cpools_LoanProgram, Cpools_OrigTerm, Cpools_OrigYear, Cpools_ServicerName, 
	Sum(Cpools_prevBal*Cpools_CPR1Month)	/Sum(Cpools_prevBal) 		AS Cpools_CPR1Month, 
	Sum(Cpools_prevBal*FNCPR1month)	/Sum(Cpools_prevBal) 	AS FNCPR1month,
	Sum(Cpools_prevBal*FHCPR1month)	/Sum(Cpools_prevBal) 	AS FHCPR1month,
	Sum(Cpools_prevBal*GNCPR1month)	/Sum(Cpools_prevBal) 	AS GNCPR1month,
	Sum(Cpools_prevBal*FNchgCPR1)	/Sum(Cpools_prevBal) 		AS FNchgCPR1, 
	Sum(Cpools_prevBal*FNPerchgCPR1)  /Sum(Cpools_prevBal) 	AS FNPerchgCPR1, 
	Sum(Cpools_prevBal*FHchgCPR1)	/Sum(Cpools_prevBal) 		AS FHchgCPR1, 
	Sum(Cpools_prevBal*FHPerchgCPR1) 	/Sum(Cpools_prevBal) 	AS FHPerchgCPR1, 
	Sum(Cpools_prevBal*GNchgCPR1)	/Sum(Cpools_prevBal) 		AS GNchgCPR1, 
	Sum(Cpools_prevBal*GNPerchgCPR1)  /Sum(Cpools_prevBal) 	AS GNPerchgCPR1

	FROM rpt_MonthlyReportCpools
	WHERE Cpools_CPR1Month>=1 
	 AND 
	(	(Cpools_LoanProgram='Conventional' AND FNCPR1month>=1 AND FHCPR1month >=1 ) 
	  OR    (Cpools_LoanProgram='Government'   AND GNCPR1month >=1 ))
	GROUP BY  Cpools_rptType,  Cpools_LoanProgram, Cpools_OrigTerm, Cpools_OrigYear, Cpools_ServicerName
	) AS C1mo 
	ON		    
	 MPF.Cpools_rptType 	= C1mo.Cpools_rptType 
	AND MPF.Cpools_LoanProgram 	= C1mo.Cpools_LoanProgram
	AND MPF.Cpools_ServicerName 	= C1mo.Cpools_ServicerName  
	AND MPF.Cpools_OrigTerm 	= C1mo.Cpools_OrigTerm  
	AND MPF.Cpools_OrigYear 	= C1mo.Cpools_OrigYear
--	AND MPF.Cpools_GrossCouponInt  = C1mo.Cpools_GrossCouponInt  
	
	LEFT OUTER JOIN 
	(
	SELECT 	Cpools_rptType, Cpools_LoanProgram, Cpools_OrigTerm, Cpools_OrigYear, Cpools_ServicerName, 
	Sum(Cpools_bal3monbefore*Cpools_CPR3Month)	/Sum(Cpools_bal3monbefore) 		AS Cpools_CPR3Month, 
	Sum(Cpools_bal3monbefore*FNchgCPR3)	/Sum(Cpools_bal3monbefore) 		AS FNchgCPR3, 
	Sum(Cpools_bal3monbefore*FNPerchgCPR3)  /Sum(Cpools_bal3monbefore) 	AS FNPerchgCPR3, 
	Sum(Cpools_bal3monbefore*FHchgCPR3)	/Sum(Cpools_bal3monbefore) 		AS FHchgCPR3, 
	Sum(Cpools_bal3monbefore*FHPerchgCPR3) 	/Sum(Cpools_bal3monbefore) 	AS FHPerchgCPR3, 
	Sum(Cpools_bal3monbefore*GNchgCPR3)	/Sum(Cpools_bal3monbefore) 		AS GNchgCPR3, 
	Sum(Cpools_bal3monbefore*GNPerchgCPR3)  /Sum(Cpools_bal3monbefore) 	AS GNPerchgCPR3

	FROM rpt_MonthlyReportCpools
	WHERE Cpools_CPR3Month>=1 
	 AND 
	(	(Cpools_LoanProgram='Conventional' AND FNCPR3Month>=1 AND FHCPR3Month >=1 ) 
	  OR    (Cpools_LoanProgram='Government'   AND GNCPR3Month >=1 ))
	GROUP BY  Cpools_rptType,  Cpools_LoanProgram, Cpools_OrigTerm, Cpools_OrigYear, Cpools_ServicerName
	) AS C3MO 
	ON		    
	 MPF.Cpools_rptType 	= C3mo.Cpools_rptType 
	AND MPF.Cpools_LoanProgram 	= C3mo.Cpools_LoanProgram
	AND MPF.Cpools_ServicerName 	= C3mo.Cpools_ServicerName  
	AND MPF.Cpools_OrigTerm 	= C3mo.Cpools_OrigTerm  
	AND MPF.Cpools_OrigYear 	= C3mo.Cpools_OrigYear
--	AND MPF.Cpools_GrossCouponInt  = C3mo.Cpools_GrossCouponInt  
	LEFT OUTER JOIN 
	(SELECT Cpools_rptType, Cpools_LoanProgram, Cpools_OrigTerm, Cpools_OrigYear, Cpools_ServicerName, 
	Sum(Cpools_bal12monBefore*Cpools_CPR12month)   /Sum(Cpools_bal12monBefore) 	AS CPR12Month, 
	Sum(Cpools_bal12monBefore*FNchgCPR12)   /Sum(Cpools_bal12monBefore) 	AS FNchgCPR12, 
	Sum(Cpools_bal12monBefore*FNPerchgCPR12)/Sum(Cpools_bal12monBefore)		AS FNPerchgCPR12, 
	Sum(Cpools_bal12monBefore*FHchgCPR12)   /Sum(Cpools_bal12monBefore) 	AS FHchgCPR12, 
	Sum(Cpools_bal12monBefore*FHPerchgCPR12)/Sum(Cpools_bal12monBefore) 	AS FHPerchgCPR12, 
	Sum(Cpools_bal12monBefore*GNchgCPR12)   /Sum(Cpools_bal12monBefore) 	AS GNchgCPR12, 
	Sum(Cpools_bal12monBefore*GNPerchgCPR12)/Sum(Cpools_bal12monBefore) 	AS GNPerchgCPR12

	
	 FROM rpt_MonthlyReportCpools
	 WHERE Cpools_CPR12month>=1 
	AND 
	(	(Cpools_LoanProgram='Conventional' AND FNCPR12Month>=1 AND FHCPR12Month >=1 ) 
	  OR    (Cpools_LoanProgram='Government'   AND GNCPR12Month >=1 ))
	 GROUP BY  Cpools_rptType,  Cpools_LoanProgram, Cpools_OrigTerm, Cpools_OrigYear, Cpools_ServicerName
	) AS C12MO 
	ON		    
	   MPF.Cpools_rptType 	= C12mo.Cpools_rptType 
	AND MPF.Cpools_LoanProgram 	= C12mo.Cpools_LoanProgram
	AND MPF.Cpools_ServicerName 	= C12mo.Cpools_ServicerName  
	AND MPF.Cpools_OrigTerm 	= C12mo.Cpools_OrigTerm  
	AND MPF.Cpools_OrigYear 	= C12mo.Cpools_OrigYear
--	AND MPF.Cpools_GrossCouponInt  = C12mo.Cpools_GrossCouponInt  
	
	ORDER BY mpf.Cpools_rptType,  MPF.Cpools_LoanProgram, MPF.Cpools_OrigTerm, mpf.Cpools_OrigYear, mpf.Cpools_ServicerName



	Update 	dbo.rpt_MonthlyReportCtermyr
	Set 	Ctermyr_showRank =
		Case 
		When Ctermyr_ServicerName = 'All Others' Then 0
		ELSE Ctermyr_showRank 
		END


--- Create a Pivot table to be used as Cover for Report C

	TRUNCATE TABLE dbo.rpt_MonthlyReportC_Pivot
	INSERT INTO dbo.rpt_MonthlyReportC_Pivot
	SELECT Ctermyr_rptType AS Cpivot_rptType, Ctermyr_OrigYear AS Cpivot_OrigYear, 
	    SUM(CASE Ctermyr_OrigTerm WHEN 360 THEN Ctermyr_FNPerchgCPR1 ELSE Null END) AS Cpivot_FN30_1moPerc,
	    SUM(CASE Ctermyr_OrigTerm WHEN 240 thEN Ctermyr_FNPerchgCPR1 ELSE Null END) AS Cpivot_FN20_1moPerc,
	    SUM(CASE Ctermyr_OrigTerm WHEN 180 THEN Ctermyr_FNPerchgCPR1 ELSE Null END) AS Cpivot_FN15_1moPerc,
	    SUM(CASE Ctermyr_OrigTerm WHEN 360 THEN Ctermyr_GNPerchgCPR1 ELSE Null END) AS Cpivot_GN30_1moPerc,
	    SUM(CASE Ctermyr_OrigTerm WHEN 360 THEN Ctermyr_FNPerchgCPR3 ELSE Null END) AS Cpivot_FN30_3moPerc,
	    SUM(CASE Ctermyr_OrigTerm WHEN 240 thEN Ctermyr_FNPerchgCPR3 ELSE Null END) AS Cpivot_FN20_3moPerc,
	    SUM(CASE Ctermyr_OrigTerm WHEN 180 THEN Ctermyr_FNPerchgCPR3 ELSE Null END) AS Cpivot_FN15_3moPerc,
	    SUM(CASE Ctermyr_OrigTerm WHEN 360 THEN Ctermyr_GNPerchgCPR3 ELSE Null END) AS Cpivot_GN30_3moPerc,
	    SUM(CASE Ctermyr_OrigTerm WHEN 360 THEN Ctermyr_FNPerchgCPR12 ELSE Null END) AS Cpivot_FN30_12moPerc,
	    SUM(CASE Ctermyr_OrigTerm WHEN 240 thEN Ctermyr_FNPerchgCPR12 ELSE Null END) AS Cpivot_FN20_12moPerc,
	    SUM(CASE Ctermyr_OrigTerm WHEN 180 THEN Ctermyr_FNPerchgCPR12 ELSE Null END) AS Cpivot_FN15_12moPerc,
	    SUM(CASE Ctermyr_OrigTerm WHEN 360 THEN Ctermyr_GNPerchgCPR12 ELSE Null END) AS Cpivot_GN30_12moPerc
	FROM dbo.rpt_MonthlyReportCtermyr
	WHERE Ctermyr_ServicerName = 'MPF' and Ctermyr_OrigYear >=2000 and Ctermyr_rptType<>'P'
	GROUP BY Ctermyr_rptType, Ctermyr_OrigYear
	ORDER BY Ctermyr_rptType, Ctermyr_OrigYear

TRUNCATE TABLE dbo.rpt_MonthlyReportC_Pivotdiff
INSERT INTO dbo.rpt_MonthlyReportC_Pivotdiff
SELECT Ctermyr_rptType AS Cpvtdiff_rptType, Ctermyr_OrigYear AS Cpvtdiff_OrigYear,
    SUM(CASE Ctermyr_OrigTerm WHEN 360 THEN Ctermyr_FNchgCPR1 ELSE Null END) AS Cpvtdiff_FN30_1mochg,
    SUM(CASE Ctermyr_OrigTerm WHEN 240 thEN Ctermyr_FNchgCPR1 ELSE Null END) AS Cpvtdiff_FN20_1mochg,
    SUM(CASE Ctermyr_OrigTerm WHEN 180 THEN Ctermyr_FNchgCPR1 ELSE Null END) AS Cpvtdiff_FN15_1mochg,
    SUM(CASE Ctermyr_OrigTerm WHEN 360 THEN Ctermyr_GNchgCPR1 ELSE Null END) AS Cpvtdiff_GN30_1mochg,
    SUM(CASE Ctermyr_OrigTerm WHEN 360 THEN Ctermyr_FNchgCPR3 ELSE Null END) AS Cpvtdiff_FN30_3mochg,
    SUM(CASE Ctermyr_OrigTerm WHEN 240 thEN Ctermyr_FNchgCPR3 ELSE Null END) AS Cpvtdiff_FN20_3mochg,
    SUM(CASE Ctermyr_OrigTerm WHEN 180 THEN Ctermyr_FNchgCPR3 ELSE Null END) AS Cpvtdiff_FN15_3mochg,
    SUM(CASE Ctermyr_OrigTerm WHEN 360 THEN Ctermyr_GNchgCPR3 ELSE Null END) AS Cpvtdiff_GN30_3mochg,
    SUM(CASE Ctermyr_OrigTerm WHEN 360 THEN Ctermyr_FNchgCPR12 ELSE Null END) AS Cpvtdiff_FN30_12mochg,
    SUM(CASE Ctermyr_OrigTerm WHEN 240 thEN Ctermyr_FNchgCPR12 ELSE Null END) AS Cpvtdiff_FN20_12mochg,
    SUM(CASE Ctermyr_OrigTerm WHEN 180 THEN Ctermyr_FNchgCPR12 ELSE Null END) AS Cpvtdiff_FN15_12mochg,
    SUM(CASE Ctermyr_OrigTerm WHEN 360 THEN Ctermyr_GNchgCPR12 ELSE Null END) AS Cpvtdiff_GN30_12mochg
FROM dbo.rpt_MonthlyReportCtermyr
WHERE Ctermyr_ServicerName = 'MPF' and Ctermyr_OrigYear >=2000 and Ctermyr_rptType<>'P'
GROUP BY Ctermyr_rptType, Ctermyr_OrigYear
ORDER BY Ctermyr_rptType, Ctermyr_OrigYear






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE dbo.usp_calcPremium 
   @v_type VARCHAR(1)='C',
   @n_rptYear SMALLINT , 
   @n_rptMonth SMALLINT ,
   @v_setFactor VARCHAR(1)='Y'
AS
   DECLARE @n_status INT , @n_err INT, @n_WACspread decimal(19, 7), @n_WACmovedBy decimal(19, 7), @d_curDate DATETIME, @v_maxHedgeID VARCHAR(30)
       
   INSERT INTO rpt_etlLog (process, logTime,  message)
   VALUES ('usp_calcPremium', getdate(), 
      'Started with: '+@v_type+', '+CAST(@n_rptYear AS VARCHAR)+', '+CAST(@n_rptMonth AS VARCHAR)+', '+@v_setFactor )
   SET @n_WACspread=(SELECT  refValue FROM rpt_Reference WHERE refCode='WACSPREAD')
   SET @n_WACmovedBy=(SELECT  refValue FROM rpt_Reference WHERE refCode='WACMOVEDBY')
   SET @d_curDate=dbo.fn_yearMonthDayToDate(@n_rptYear, @n_rptMonth, 18)
   SELECT @v_maxHedgeID=MAX(lfs_hedgeID) FROM  dbo.uv_Loan_FAct_Sum WHERE lfs_hedgeID LIKE 'MPF0%'
--   SET @d_curDate=getDate()
   
--   DELETE rpt_loanAdjustment WHERE rptType=@v_type AND asOfDate=@d_curDate ----- FOR DEVELOPMENT ONLY
   DELETE rpt_loanAdjustment WHERE la_rptType=@v_type
   EXEC @n_status=usp_errHandler @@error, 'usp_calcPremium - DELETE rpt_loanAdjustment'
   IF @n_status<>0 RETURN @n_status

   IF (@v_setFactor='Y') 
   BEGIN
      IF (@v_type='P') 
      BEGIN
         EXEC usp_setPortfolioFactor
         EXEC @n_status=usp_errHandler @@error, 'usp_calcPremium: usp_setPortfolioFactor'
         IF @n_status<>0 RETURN @n_status
      END
      IF (@v_type='C') 
      BEGIN
         EXEC usp_setChgoFactor
         EXEC @n_status=usp_errHandler @@error, 'usp_calcPremium: usp_setChgoFactor'
         IF @n_status<>0 RETURN @n_status
      END
      IF (@v_type='S') 
      BEGIN
         UPDATE rpt_Master SET ms_participationFactor=1
         EXEC @n_status=usp_errHandler @@error, 'usp_calcPremium - ms_participationFactor=1'
         IF @n_status<>0 RETURN @n_status
      END
   END
   
------- 20040412
   INSERT INTO rpt_loanAdjustment (la_loanNumber, la_adjustment, la_asOfDate, la_rptType)
   SELECT v_all.agt_loanNumber, v_all.amt+CASE WHEN @v_type='S' THEN 0 ELSE ISNULL(port.amt,0) END,  -- 20041025 for System, agentFee only
      @d_curDate, @v_type
   FROM   
      (       ---- 20041208 New portifolio 29
      SELECT lfs_LoanNumber, lfs_SumOfFHLBCDailyAssetPL+lfs_SumOfPaydownAdjustment AS amt 
      FROM   dbo.uv_Loan_FAct_Sum as f
      WHERE  lfs_hedgeID=@v_maxHedgeID      
      AND    EXISTS (SELECT 1 FROM uv_portfolioLoan WHERE PL_loanNumber=f.lfs_loanNumber)    --- 20041020
      ) AS port RIGHT OUTER JOIN 
      (
      SELECT a.agt_loanNumber,       -- 20041025 for System count agentFee only 
         amt=m.ms_participationFactor*a.agt_totalUnAmortizedAgentFee+CASE WHEN @v_type='S' THEN 0 ELSE ISNULL(B.strip,0) END 
      FROM   rpt_Master m, dbo.uv_agentFee a LEFT OUTER JOIN (
         SELECT hai_loanNumber, sum(hai_unamortizedNet) strip
         FROM   dbo.uv_haus_amortization_info
         WHERE  hai_AmortType IN ('X', 'H') 
         GROUP by hai_loanNumber) b ON b.hai_loanNumber=a.agt_loanNumber
      WHERE  m.ms_loanIDnumber=a.agt_loanNUmber
      AND    m.ms_participationFactor>0
      ) AS v_all
   ON port.lfs_loanNumber=v_all.agt_loanNumber                   
   EXEC @n_status=usp_errHandler @@error, 'usp_calcPremium - Load rpt_loanAdjustment'
   IF @n_status<>0 RETURN @n_status
   
   UPDATE rpt_monthlyReport 
   SET    mr_discount=0, mr_premium=0
   FROM   rpt_monthlyReport r, rpt_servicer s
   WHERE  s.servicerName NOT IN ('FNMA', 'FHLMC', 'GNMA II')
   AND    r.mr_servicerNumber=s.servicerNumber
   AND    r.mr_rptType=@v_type
   AND    r.mr_WACspread=@n_WACspread
   
   --- calculate the premium
   UPDATE rpt
   SET    mr_premium=v_PD.premium/1000000
   FROM   rpt_monthlyReport rpt, (
      SELECT YEAR(m.ms_OrigDate) origYear, m.ms_origTerm, p1.sp_servicerNumber, m.ms_loanProgram, 
             SUM(ISNULL(adj.la_adjustment,0)) premium,
             -@n_WACmovedBy+FLOOR(ROUND((@n_WACmovedBy+m.ms_curWAC)/@n_WACspread, 5))*@n_WACspread as WAClow --- 20040429
      FROM   rpt_servicerPool p, rpt_servicerPool p1, rpt_Master m, rpt_loanAdjustment adj
      WHERE  adj.la_loanNumber=m.ms_loanIDnumber
      AND    adj.la_adjustment>=0
      AND    adj.la_asOfDate=@d_curDate
      AND    adj.la_rptType=@v_type
      AND    p.sp_servicerNumber=m.ms_servicerNumber               
      AND    p.sp_rptYear=@n_rptYear
      AND    p.sp_rptMonth=@n_rptMonth
      AND    p.sp_rptType=@v_type
      AND    p1.sp_rptYear=p.sp_rptYear
      AND    p1.sp_rptMonth=p.sp_rptMonth
      AND    p1.sp_rptType=p.sp_rptType
      AND    p1.sp_poolRank=p.sp_poolRank
      AND    p1.sp_servicerNumber=(
         SELECT MIN(sp_servicerNumber) FROM rpt_servicerPool 
         WHERE  sp_rptYear=p1.sp_rptYear AND sp_rptMonth=p1.sp_rptMonth 
         AND    sp_rptType=p1.sp_rptType
         AND    sp_poolRank=p1.sp_poolRank)
      GROUP BY YEAR(m.ms_OrigDate), m.ms_origTerm, p1.sp_servicerNumber, m.ms_loanProgram, 
         -@n_WACmovedBy+FLOOR(ROUND((@n_WACmovedBy+m.ms_curWAC)/@n_WACspread, 5))*@n_WACspread
   ) AS v_PD
   WHERE  rpt.mr_origYear=v_PD.origYear
   AND    rpt.mr_origTerm=v_PD.ms_origTerm
   AND    rpt.mr_loanProgram=v_PD.ms_loanProgram
   AND    rpt.mr_grossCouponInt=v_PD.WACLow
   AND    rpt.mr_rptType=@v_type
   AND    rpt.mr_servicerNumber=v_PD.sp_servicerNumber               
   AND    rpt.mr_WACspread=@n_WACspread
   EXEC @n_status=usp_errHandler @@error, 'usp_calcPremium - Compute mr_premium'
   IF @n_status<>0 RETURN @n_status

   --- calculate the  discount
   UPDATE rpt
   SET    mr_discount=v_PD.discount/1000000
   FROM   rpt_monthlyReport rpt, (
      SELECT YEAR(m.ms_OrigDate) origYear, m.ms_origTerm, p1.sp_servicerNumber, m.ms_loanProgram, 
             SUM(ISNULL(adj.la_adjustment,0)) discount,
             -@n_WACmovedBy+FLOOR(ROUND((@n_WACmovedBy+m.ms_curWAC)/@n_WACspread, 5))*@n_WACspread as WAClow --- 20040429
      FROM   rpt_servicerPool p, rpt_servicerPool p1, rpt_Master m, rpt_loanAdjustment adj
      WHERE  adj.la_loanNumber=m.ms_loanIDnumber
      AND    adj.la_adjustment<0
      AND    adj.la_asOfDate=@d_curDate
      AND    adj.la_rptType=@v_type
      AND    p.sp_servicerNumber=m.ms_servicerNumber               
      AND    p.sp_rptYear=@n_rptYear
      AND    p.sp_rptMonth=@n_rptMonth
      AND    p.sp_rptType=@v_type
      AND    p1.sp_rptYear=p.sp_rptYear
      AND    p1.sp_rptMonth=p.sp_rptMonth
      AND    p1.sp_rptType=p.sp_rptType
      AND    p1.sp_poolRank=p.sp_poolRank
      AND    p1.sp_servicerNumber=(
         SELECT MIN(sp_servicerNumber) FROM rpt_servicerPool 
         WHERE  sp_rptYear=p1.sp_rptYear AND sp_rptMonth=p1.sp_rptMonth 
         AND    sp_rptType=p1.sp_rptType
         AND    sp_poolRank=p1.sp_poolRank)
      GROUP BY YEAR(m.ms_OrigDate), m.ms_origTerm, p1.sp_servicerNumber, m.ms_loanProgram, 
         -@n_WACmovedBy+FLOOR(ROUND((@n_WACmovedBy+m.ms_curWAC)/@n_WACspread, 5))*@n_WACspread
   ) AS v_PD
   WHERE  rpt.mr_origYear=v_PD.origYear
   AND    rpt.mr_origTerm=v_PD.ms_origTerm
   AND    rpt.mr_loanProgram=v_PD.ms_loanProgram
   AND    rpt.mr_grossCouponInt=v_PD.WACLow
   AND    rpt.mr_rptType=@v_type
   AND    rpt.mr_servicerNumber=v_PD.sp_servicerNumber               
   AND    rpt.mr_WACspread=@n_WACspread
   EXEC @n_status=usp_errHandler @@error, 'usp_calcPremium - Compute mr_discount'
   IF @n_status<>0 RETURN @n_status
   
   ----- Calculate premium/discount for MPF
   UPDATE rpt SET mr_discount=a.discount, mr_premium=a.premium
   FROM   rpt_monthlyReport rpt, 
      (
      SELECT mr_origYear, mr_origTerm, mr_loanProgram, mr_grossCouponInt, 
         SUM(mr_premium) premium, SUM(mr_discount) discount
      FROM   rpt_monthlyReport
      WHERE  mr_servicerNumber<>1000
      AND    mr_rptType=@v_type
      AND    mr_WACspread=@n_WACspread
      GROUP BY mr_origYear, mr_origTerm, mr_loanProgram, mr_grossCouponInt 
      ) AS A
   WHERE  rpt.mr_servicerNumber=1000
   AND    rpt.mr_origYear=a.mr_origYear
   AND    rpt.mr_origTerm=a.mr_origTerm
   AND    rpt.mr_loanProgram=a.mr_loanProgram
   AND    rpt.mr_grossCouponInt=a.mr_grossCouponInt
   AND    rpt.mr_rptType=@v_type
   AND    rpt.mr_WACspread=@n_WACspread
   EXEC @n_status=usp_errHandler @@error, 'usp_calcPremium - Set premium/discount for MPF'
   IF @n_status<>0 RETURN @n_status
   
   UPDATE rpt_monthlyReport
   SET    mr_pdNet=mr_discount+mr_premium
   WHERE  mr_agency='MPF'
   EXEC @n_status=usp_errHandler @@error, 'usp_calcPremium - Set mr_pdNet'
   IF @n_status<>0 RETURN @n_status

-- SELECT mr_servicerNumber, mr_servicerName, sum(mr_currentBal) cBal, 
--    SUM(mr_premium) premium, SUM(mr_discount) discount, SUM(mr_premium)+SUM(mr_discount) net
-- FROM   rpt_monthlyReport
-- WHERE  mr_rptType=@v_type
-- AND    mr_servicerNumber not in (1000, 1001, 1002, 1004)
-- GROUP BY mr_servicerNumber , mr_servicerName
-- ORDER BY SUM(mr_currentBal) desc





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE usp_collectCurData
   @v_type CHAR, 
   @v_agencyData VARCHAR(1),
   @n_year SMALLINT, 
   @n_month SMALLINT,
   @n_WACspread decimal(5,4)=NULL 
AS
   DECLARE @n_status INT, @n_err INT, @n_SNumOther INT, @n_SNumMPF INT, @n_top SMALLINT
   DECLARE @n_rptYear SMALLINT, @n_rptMonth SMALLINT, @n_1stRptYear SMALLINT
   
   INSERT INTO rpt_etlLog (process, logTime,  message) VALUES ('usp_collectCurData', getdate(), 
      'Started with: '+@v_type+', '+@v_agencyData+', '+CAST(@n_year AS VARCHAR)+', '+CAST(@n_month AS VARCHAR)+', '+
      ISNULL(CAST(@n_WACspread AS VARCHAR),' ') )

--   SET @n_SNumMPF=(SELECT servicerNumber FROM rpt_servicer WHERE servicerName='MPF')
--   SET @n_SNumOther=(SELECT servicerNumber FROM rpt_servicer WHERE servicerName='All Others')
   SELECT @n_1stRptYear=r1.refValue, @n_top=rLast.refValue
   FROM   rpt_reference r1, rpt_reference rLast
   WHERE  r1.refCode='1STRPTYEAR'
   AND    rLast.refCode='RANKLAST'
      
   IF (@n_WACspread IS NULL)         ----- Load for reports A, B, C
   BEGIN
      -- Set ranks for PFI's
      EXEC @n_status=usp_rankCurServicer @v_type, @n_year, @n_month
      SET @n_err=@@error
      IF @n_status<>0 RETURN @n_status
      EXEC @n_status=usp_errHandler @n_err, 'usp_collectCurData: usp_rankCurServicer'
      IF @n_status<>0 RETURN @n_status
   END

   -- Load poolData
   EXEC @n_status=usp_loadPoolData @v_type, @n_year, @n_month
   SET @n_err=@@error
   IF @n_status<>0 RETURN @n_status
   EXEC @n_status=usp_errHandler @n_err, 'usp_collectCurData: usp_loadPoolData'
   IF @n_status<>0 RETURN @n_status
   
   EXEC @n_status=usp_setCurPoolData @v_type, @n_year, @n_month
   SET @n_err=@@error
   IF @n_status<>0 RETURN @n_status
   EXEC @n_status=usp_errHandler @n_err, 'usp_collectCurData: usp_setCurPoolData'
   IF @n_status<>0 RETURN @n_status

   -- setCPR

   EXEC @n_status=usp_setCPR @v_type, @n_year, @n_month
   SET @n_err=@@error
   IF @n_status<>0 RETURN @n_status
   EXEC @n_status=usp_errHandler @n_err, 'usp_collectCurData: usp_setCPR'
   IF @n_status<>0 RETURN @n_status
   
   -- Load rpt_monthlyReport
   EXEC @n_status=usp_loadMonthlyReport @v_type, @v_agencyData, @n_year, @n_month
   SET @n_err=@@error
   IF @n_status<>0 RETURN @n_status
   EXEC @n_status=usp_errHandler @n_err, 'usp_collectCurData: usp_loadMonthlyReport'
   IF @n_status<>0 RETURN @n_status

   -- INSERT INTO rpt_etlLog (process, logTime,  message)
   -- VALUES ('usp_collectCurData', getdate(), 'Ended')





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE usp_errHandler (@n_error INT, @v_proc VARCHAR(100))
AS
   DECLARE @v_msg VARCHAR(100)
   SET @v_msg='Ended Successfully'
   IF @n_error<>0 
   BEGIN
      IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
      SET @v_msg='Error: '+CAST(@n_error AS VARCHAR)
   END
   INSERT INTO rpt_etlLog (process, logTime,  message)
   VALUES (@v_proc, getdate(), @v_msg)
   RETURN @n_error   



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE dbo.usp_init
   @n_WACspread decimal(5,4)=NULL,
   @n_WACmovedBy decimal(5,4)=NULL 
AS
   DECLARE @n_rptYear smallint, @n_rptMonth smallint
   DECLARE @n_status INT
   
   INSERT INTO rpt_etlLog (process, logTime,  message) VALUES ('usp_init', getdate(),
      'Started with: '+ISNULL(CAST(@n_WACspread AS VARCHAR),' ')+', '+ISNULL(CAST(@n_WACmovedBy AS VARCHAR),' ') )

   IF @n_WACspread IS NULL           -- Load the reports default @n_WACspread=.5
   BEGIN
      TRUNCATE TABLE dbo.rpt_FHLBtotal
      TRUNCATE TABLE rpt_Master      
      TRUNCATE TABLE rpt_servicer   
      TRUNCATE TABLE rpt_FHLBtotal   
         
      EXEC @n_status=usp_errHandler @@error, 'usp_init: TRUNCATE tables'
      IF @n_status<>0 RETURN @n_status

      -- init rpt_FHLBtotal
      INSERT INTO rpt_FHLBtotal(ft_LastestDate)
      SELECT MAX(payDate) FROM fhlb.dbo.fhlbHistory
      UPDATE t
      SET    ft_FHLBtCurBal=(
         (
         Select Sum(ScheduleEndPrincipalBal) FROM FHLB.dbo.FHLBHistory 
         WHERE  Paydate=t.ft_LastestDate
         )
         +
         (
         Select Sum(OrigLoanAmount) FROM FHLB.dbo.FHLBMaster fm 
         WHERE  fm.LoanNumber Not In (Select fh.LoanNumber FROM FHLB.dbo.FHLBHistory fh)
         ) )/1000000
      FROM   rpt_FHLBtotal t
      EXEC @n_status=usp_errHandler @@error, 'usp_init - Init rpt_FHLBtotal'
      IF @n_status<>0 RETURN @n_status
      
      SELECT @n_rptYear=YEAR(ft_LastestDate), @n_rptMonth=MONTH(ft_LastestDate) FROM dbo.rpt_FHLBtotal
      SET @n_WACspread=0.5
      SET @n_WACmovedBy=0.25
      
      INSERT INTO rpt_servicer
      SELECT *  
      FROM   fhlb.dbo.fhlbServicerLookup
      EXEC @n_status=usp_errHandler @@error, 'usp_init - INSERT INTO rpt_servicer'
      IF @n_status<>0 RETURN @n_status
      
      INSERT INTO rpt_servicer VALUES(1000, 'MPF')
      INSERT INTO rpt_servicer VALUES(1001, 'FHLMC')
      INSERT INTO rpt_servicer VALUES(1002, 'FNMA')
      INSERT INTO rpt_servicer VALUES(1003, 'All Others')
      INSERT INTO rpt_servicer VALUES(1004, 'GNMA II')
      

      INSERT INTO rpt_Master (
         ms_LoanProgram ,
         ms_OrigDate ,
         ms_OrigTerm ,
         ms_AmortTerm ,
         ms_OrigBal ,
         ms_OrigLTV ,
         ms_curWAC,
         ms_CurNet ,
         ms_CurWALA ,
         ms_CurWAM ,
         ms_CurFactor ,
         ms_curBal,
         ms_CurLTV ,
         ms_LoanSize ,
         ms_BorrowerFICO ,
         ms_BorrowerIncome ,
         ms_CoBorrowerIncome ,
         ms_CoBorrowerFICO ,
         ms_Servicer ,
         ms_ServicerNumber ,
         ms_GrossMargin ,
         ms_ServicingFee ,
         ms_LoanIDNumber ,
         ms_PropertyTypeCode ,
         ms_OccupancyCode ,
         ms_GeoAreaCode ,
         ms_DocumentationType ,
         ms_LoanPurposeCode ,
         ms_AsOfDate ,
         ms_participationFactor,
         ms_state,
         ms_RemittanceTypeId)
      select 
         m.LoanProgram ,
         m.OrigDate ,
         m.OrigTerm ,
         m.AmortTerm ,
         m.OrigBal ,
         m.OrigLTV ,
         curWAC=100*fm.InterestRate,
         m.CurNet ,
         m.CurWALA ,
         m.CurWAM ,
         m.CurFactor ,
         curBal=CASE WHEN  m.CurBal=0 AND m.curWAC=0 THEN m.OrigBal ELSE m.curBal END,
         m.CurLTV ,
         m.LoanSize ,
         m.BorrowerFICO ,
         m.BorrowerIncome ,
         m.CoBorrowerIncome ,
         m.CoBorrowerFICO ,
         m.Servicer ,
         m.ServicerNumber ,
         m.GrossMargin ,
         m.ServicingFee ,
         m.LoanIDNumber ,
         m.PropertyTypeCode ,
         m.OccupancyCode ,
         m.GeoAreaCode ,
         fm.DocumentationType ,
         m.LoanPurposeCode ,
         m.AsOfDate ,
         p.mdl_chicagoParticipation,
         m.state,
         fm.RemittanceTypeId
      from  aft.dbo.aftMaster m, uv_MA_DC_loan p, fhlb.dbo.fhlbMaster fm
      where p.mdl_loanNumber=m.loanIdNumber
      and   m.loanIDnumber=fm.loanNumber

      EXEC @n_status=usp_errHandler @@error, 'usp_init-INSERT INTO rpt_master'
      IF @n_status<>0 RETURN @n_status
      
      UPDATE rpt_reference SET refValue=@n_rptYear WHERE refCode='LATESTYEAR'
      UPDATE rpt_reference SET refValue=@n_rptMonth WHERE refCode='LATESTMONTH'
   END
   
   UPDATE rpt_reference SET refValue=@n_WACspread WHERE refCode='WACSPREAD'
   UPDATE rpt_reference SET refValue=@n_WACmovedBy WHERE refCode='WACMOVEDBY'
   
   -- INSERT INTO rpt_etlLog (process, logTime,  message) VALUES ('usp_init', getdate(), 'Ended.')
   




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE dbo.usp_loadCurrent
   @v_type VARCHAR(1)='A', 
   @v_agencyData VARCHAR(1)='Y',
   @n_year SMALLINT=NULL, 
   @n_month SMALLINT=NULL 
AS
   DECLARE @n_status INT, @n_err INT, @n_WACspread decimal(5,4), @v_msg VARCHAR(60)

   TRUNCATE TABLE rpt_etlLog

   INSERT INTO rpt_etlLog (process, logTime,  message)
   VALUES ('usp_loadCurrent', getdate(), 'Started with param: '+@v_type+', '+@v_agencyData+', '+
      ISNULL(CAST(@n_year AS VARCHAR),' ')+', '+ISNULL(CAST(@n_month AS VARCHAR),' '))


   --- Load Chicago only
   -- IF (@v_type<>'C') 
   -- BEGIN
   --    INSERT INTO rpt_etlLog (process, logTime,  message)
   --    VALUES ('usp_loadCurrent', getdate(), 
   --       'Stopped with param: '+@v_type+', '+@v_agencyData+', '+CAST(@n_year AS VARCHAR)+', '+CAST(@n_month AS VARCHAR))
   --    RETURN 1
   -- END
   
   EXEC @n_status=usp_init
   SET @n_err=@@error
   IF @n_status<>0 RETURN @n_status
   EXEC @n_status=usp_errHandler @n_err, 'usp_loadCurrent: usp_init'
   IF @n_status<>0 RETURN @n_status
   
   SELECT @n_year=r1.refValue, @n_month=r2.refValue , @n_WACspread=r3.refValue
   FROM   rpt_reference r1, rpt_reference r2, rpt_reference r3
   WHERE  r1.refCode='LATESTYEAR'
   AND    r2.refCode='LATESTMONTH'
   AND    r3.refCode='WACSPREAD'
   
   IF (@v_type='P') 
   BEGIN
      EXEC usp_setPortfolioFactor
      EXEC @n_status=usp_errHandler @@error, 'usp_loadCurrent: usp_setPortfolioFactor'
      IF @n_status<>0 RETURN @n_status
   END
   IF (@v_type='C') 
   BEGIN
      EXEC usp_setChgoFactor
      EXEC @n_status=usp_errHandler @@error, 'usp_loadCurrent: usp_setChgoFactor'
      IF @n_status<>0 RETURN @n_status
   END
   IF (@v_type='S') 
   BEGIN
      UPDATE rpt_Master SET ms_participationFactor=1
      EXEC @n_status=usp_errHandler @@error, 'usp_loadCurrent - ms_participationFactor=1'
      IF @n_status<>0 RETURN @n_status
   END
   
   -- Load all types
   IF (@v_type='A')
      BEGIN
         -- DELETE rpt_servicerPool WHERE rptYear=@n_year AND rptMonth=@n_month
         TRUNCATE TABLE rpt_servicerPool      --- RELOAD rpt_servicerPool 20050204
         TRUNCATE TABLE rpt_poolData          --- RELOAD rpt_poolData 20050204
         TRUNCATE TABLE rpt_monthlyReport
         EXEC @n_status=usp_errHandler @@error, 'usp_loadCurrent: truncate tables'
                  
         EXEC @n_status=usp_collectCurData 'C', 'Y', @n_year, @n_month
         SET @n_err=@@error
         IF @n_status<>0 RETURN @n_status
         EXEC @n_status=usp_errHandler @n_err, 'usp_loadCurrent: usp_collectCurData C'
         IF @n_status<>0 RETURN @n_status
         
--         UPDATE rpt_Master SET ms_participationFactor=1
--         EXEC @n_status=usp_collectCurData 'S', 'N', @n_year, @n_month
--         IF (@@ERROR<>0 OR @n_status<>0) RETURN 1
--         
         EXEC usp_setPortfoliofactor
         EXEC @n_status=usp_errHandler @@error, 'usp_loadCurrent: usp_setPortfoliofactor'
         IF @n_status<>0 RETURN @n_status
         
         EXEC @n_status=usp_collectCurData 'P', 'N', @n_year, @n_month
         SET @n_err=@@error
         IF @n_status<>0 RETURN @n_status
         EXEC @n_status=usp_errHandler @n_err, 'usp_loadCurrent: usp_collectCurData P'
         IF @n_status<>0 RETURN @n_status
      END
   ELSE
      BEGIN
         -- collect Chicago participation or system data only
         -- TRUNCATE TABLE rpt_servicerPool  
         SET @v_msg='usp_loadCurrent: usp_collectCurData '+@v_type
         EXEC @n_status=usp_collectCurData @v_type, @v_agencyData, @n_year, @n_month
         SET @n_err=@@error
         IF @n_status<>0 RETURN @n_status
         EXEC @n_status=usp_errHandler @n_err, @v_msg
         IF @n_status<>0 RETURN @n_status
      END

   SET @v_msg='usp_loadCurrent: usp_setStat '+@v_type
   EXEC @n_status=usp_setStat @v_type, @n_year, @n_month, 'N' 
   SET @n_err=@@error
   IF @n_status<>0 RETURN @n_status
   EXEC @n_status=usp_errHandler @n_err, @v_msg
   IF @n_status<>0 RETURN @n_status

   INSERT INTO rpt_monRptHist SELECT *, 100*@n_year+@n_month FROM rpt_monthlyReport WHERE mr_WacSpread=@n_WACspread

   SET @v_msg='usp_loadCurrent: usp_setTop20B '+@v_type
   EXEC @n_status=usp_setTop20B @n_year, @n_month
   SET @n_err=@@error
   IF @n_status<>0 RETURN @n_status
   EXEC @n_status=usp_errHandler @n_err, @v_msg
   IF @n_status<>0 RETURN @n_status
   
   SET @v_msg='usp_loadCurrent: usp_setTop20A '+@v_type
   EXEC @n_status=usp_setTop20A @n_year, @n_month
   SET @n_err=@@error
   IF @n_status<>0 RETURN @n_status
   EXEC @n_status=usp_errHandler @n_err, @v_msg
   IF @n_status<>0 RETURN @n_status

   INSERT INTO rpt_etlLog (process, logTime,  message) VALUES ('usp_report_C', getdate(), 'Started')
   EXEC usp_report_C
   EXEC @n_status=usp_errHandler @@error, 'usp_loadCurrent: usp_report_C '
   IF @n_status<>0 RETURN @n_status
--   
--   INSERT INTO rpt_etlLog (process, logTime,  message) VALUES ('usp_setIncentive', getdate(), 'Started')
--   EXEC dbo.usp_setIncentive
--   INSERT INTO rpt_etlLog (process, logTime,  message) VALUES ('usp_setIncentive', getdate(), 'Ended')
--
--   INSERT INTO rpt_etlLog (process, logTime,  message) VALUES ('usp_setTopScore', getdate(), 'Started')
--   EXEC dbo.usp_setTopScore @n_year, @n_month
--   INSERT INTO rpt_etlLog (process, logTime,  message) VALUES ('usp_setTopScore', getdate(), 'Ended')
--   
--   INSERT INTO rpt_etlLog (process, logTime,  message)
--   VALUES ('usp_loadCurrent '+@v_type+' '+@v_agencyData+' '+CAST(@n_year AS VARCHAR)+' '+
--      CAST(@n_month AS VARCHAR), getdate(), 'Ended')

   INSERT INTO rpt_etlLog (process, logTime,  message) VALUES ('usp_loadCurrent', getdate(), 'Ended')
   PRINT 'usp_loadCurrent '+@v_type+' '+@v_agencyData+' '+CAST(@n_year AS VARCHAR)+' '+
      CAST(@n_month AS VARCHAR)+' ended at:'+CAST(getdate() AS VARCHAR)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE dbo.usp_loadMonthlyReport 
   @v_type VARCHAR(10),
   @v_agencyData VARCHAR(1)='N',
   @n_year SMALLINT=NULL, 
   @n_month SMALLINT=NULL AS
DECLARE @d_3monBefore DATETIME, @d_12monBefore DATETIME, @d_lastMonth DATETIME
DECLARE @n_status INT, @n_max INT, @n_adjYearMonth INT, @n_WACspread decimal(19, 7), @n_WACmovedBy decimal(19, 7)

   INSERT INTO rpt_etlLog (process, logTime,  message) VALUES ('usp_loadMonthlyReport', getdate(), 
      'Started with: '+@v_type+', '+@v_agencyData+', '+ISNULL(CAST(@n_year AS VARCHAR),' ')+', '+ISNULL(CAST(@n_month AS VARCHAR),' '))

   SET @n_max=(SELECT CAST(MAX(pd_curBal)/10000 AS INT)+200 FROM rpt_poolData)
   SET @n_WACspread=(SELECT  refValue FROM rpt_Reference WHERE refCode='WACSPREAD')
   SET @n_WACmovedBy=(SELECT  refValue FROM rpt_Reference WHERE refCode='WACMOVEDBY')

   IF (@n_year IS NULL)
      SELECT @n_year=YEAR(ft_lastestDate), @n_month=MONTH(ft_lastestDate) 
      FROM   dbo.rpt_FHLBtotal

   SET @n_adjYearMonth=100*@n_Year + @n_month
   SET @d_3monBefore= DATEADD(MONTH, -3, dbo.fn_yearMonthDayToDate(@n_Year, @n_Month, 18))
   SET @d_lastMonth= DATEADD(MONTH, 2, @d_3monBefore)
   SET @d_12monBefore= DATEADD(MONTH, -9, @d_3monBefore)

   DELETE rpt_monthlyReport WHERE mr_rptType=@v_type and mr_WACspread=@n_WACspread
   DELETE rpt_monRptHist WHERE mrh_rptType=@v_type AND mrh_WACspread=@n_WACspread AND mrh_rptYearMonth=100*@n_year+@n_month
   IF @v_agencyData<>'N' DELETE rpt_monthlyReport WHERE mr_WACspread IS NULL
   EXEC @n_status=usp_errHandler @@error, 'usp_loadMonthlyReport: Delete old Data'
   IF @n_status<>0 RETURN @n_status
   
   INSERT INTO rpt_monthlyReport (
      mr_agency,
      mr_ServicerNumber,
      mr_ServicerName,
      mr_OrigTerm,
      mr_LoanProgram ,
      mr_WACspread,
      mr_GrossCoupon,
      mr_GrossCouponInt,
      mr_OrigYear,
      mr_FactorCalc,
      mr_OrigBal,
      mr_CurrentBal,
      mr_prevBal,
      mr_WALA,
      mr_CPR1Month,
      mr_CPR3Month,
      mr_CPR6Month,
      mr_CPR12Month,
      mr_CPRLife,
      mr_showRank,
      mr_rptType, mr_numLoans, mr_bal3MonBefore, mr_numLoans3MonBefore, mr_sumChgoPart)
   SELECT 
      'MPF',
      s.ServicerNumber,
      s.ServicerName,
      d.pd_OrigTerm,
      d.pd_LoanProgram ,
      @n_WACspread,
      d.pd_WAC,
      d.pd_WACLow,
      d.pd_OrigYear,
      d.pd_poolFactor,
      d.pd_OrigBal/1000000,
      d.pd_CurBal/1000000,
      d.pd_prevBal/1000000,
      ROUND(d.pd_WALA, 0),
      100*d.pd_CPR1Month,
      100*d.pd_CPR3Month,
      100*d.pd_CPR6Month,
      100*d.pd_CPR1year,
      100*d.pd_CPRLife,
      showRank=
      CASE 
         WHEN s.servicerName='MPF' THEN 1
         WHEN s.servicerName='All Others' THEN @n_max
         ELSE @n_max-CAST(d.pd_curBal/10000 AS INT)-100
      END,
      @v_type, d.pd_numLoans, pre.pd_curBal/1000000, pre.pd_numLoans, d.pd_sumChgoPart
   FROM   rpt_servicer s, rpt_poolData d LEFT OUTER JOIN (
      SELECT * FROM rpt_poolData pd
      WHERE  pd_rptYear=YEAR(@d_3monBefore)
      AND    pd_rptMonth=MONTH(@d_3monBefore) 
      AND    pd_WACspread=@n_WACspread
      AND    pd_adjYearMonth=(
         SELECT MAX(pd_adjYearMonth) FROM rpt_poolData
         WHERE  pd_origYear=pd.pd_origYear
         AND    pd_origTerm=pd.pd_origTerm
         AND    pd_loanProgram=pd.pd_loanProgram
         AND    pd_WACspread=@n_WACspread
         AND    pd_WACLow=pd.pd_WACLow
         AND    pd_servicerNumber=pd.pd_servicerNumber
         AND    pd_rptType=pd.pd_rptType
         AND    pd_rptYear=pd.pd_rptYear
         AND    pd_rptMonth=pd.pd_rptMonth )) AS pre
   ON  pre.pd_servicerNumber=d.pd_servicerNumber
   AND pre.pd_rptType=d.pd_rptType
   AND pre.pd_origYear=d.pd_origYear
   AND pre.pd_origTerm=d.pd_origTerm
   AND pre.pd_loanProgram=d.pd_loanProgram
   AND pre.pd_WACLow=d.pd_WACLow 
   AND pre.pd_WACspread=d.pd_WACspread
   WHERE  d.pd_rptYear=@n_year
   AND    d.pd_rptMonth=@n_month 
   AND    d.pd_servicerNumber=s.servicerNumber
   AND    d.pd_adjYearMonth=@n_adjYearMonth  
   AND    d.pd_rptType=@v_type
   AND    d.pd_WACspread=@n_WACspread

   EXEC @n_status=usp_errHandler @@error, 'usp_loadMonthlyReport: load data'
   IF @n_status<>0 RETURN @n_status

   -- 20040322 add prevLnsz, 20040709 added cpr1p1
   UPDATE r
   SET    mr_prevLnsz=pre.pd_aveLoanSize, mr_cpr1p1=100*pre.pd_cpr1month
   FROM   rpt_monthlyReport r, 
      (
      SELECT * FROM rpt_poolData pd
      WHERE  pd_rptYear=YEAR(@d_lastMonth)
      AND    pd_rptMonth=MONTH(@d_lastMonth) 
      AND    pd_rptType=@v_type
      AND    pd_WACspread=@n_WACspread
      AND    pd_adjYearMonth=(
         SELECT MAX(pd_adjYearMonth) FROM rpt_poolData
         WHERE  pd_origYear=pd.pd_origYear
         AND    pd_origTerm=pd.pd_origTerm
         AND    pd_loanProgram=pd.pd_loanProgram
         AND    pd_WACspread=@n_WACspread
         AND    pd_WACLow=pd.pd_WACLow
         AND    pd_servicerNumber=pd.pd_servicerNumber
         AND    pd_rptType=pd.pd_rptType
         AND    pd_rptYear=pd.pd_rptYear
         AND    pd_rptMonth=pd.pd_rptMonth )
      ) AS pre
   WHERE  pre.pd_servicerNumber=r.mr_servicerNumber
   AND    pre.pd_rptType=r.mr_rptType
   AND    pre.pd_origYear=r.mr_origYear
   AND    pre.pd_origTerm=r.mr_origTerm
   AND    pre.pd_loanProgram=r.mr_loanProgram
   AND    pre.pd_WACLow=r.mr_GrossCouponInt 
   AND    pre.pd_WACspread=r.mr_WACspread

   EXEC @n_status=usp_errHandler @@error, 'usp_loadMonthlyReport: set prevCPR1 & lnsz'
   IF @n_status<>0 RETURN @n_status

   -- 20040405 add bal12monBefore
   UPDATE r
   SET    mr_bal12monBefore=pre.pd_curBal
   FROM   rpt_monthlyReport r, 
      (
      SELECT * FROM rpt_poolData pd
      WHERE  pd_rptYear=YEAR(@d_12monBefore)
      AND    pd_rptMonth=MONTH(@d_12monBefore) 
      AND    pd_rptType=@v_type
      AND    pd_WACspread=@n_WACspread
      AND    pd_adjYearMonth=(
         SELECT MAX(pd_adjYearMonth) FROM rpt_poolData
         WHERE  pd_origYear=pd.pd_origYear
         AND    pd_origTerm=pd.pd_origTerm
         AND    pd_loanProgram=pd.pd_loanProgram
         AND    pd_WACspread=@n_WACspread
         AND    pd_WACLow=pd.pd_WACLow
         AND    pd_servicerNumber=pd.pd_servicerNumber
         AND    pd_rptType=pd.pd_rptType
         AND    pd_rptYear=pd.pd_rptYear
         AND    pd_rptMonth=pd.pd_rptMonth )
      ) AS pre
   WHERE  pre.pd_servicerNumber=r.mr_servicerNumber
   AND    pre.pd_rptType=r.mr_rptType
   AND    pre.pd_origYear=r.mr_origYear
   AND    pre.pd_origTerm=r.mr_origTerm
   AND    pre.pd_loanProgram=r.mr_loanProgram
   AND    pre.pd_WACLow=r.mr_GrossCouponInt 
   AND    pre.pd_WACspread=r.mr_WACspread

   EXEC @n_status=usp_errHandler @@error, 'usp_loadMonthlyReport: set bal12monBefore'
   IF @n_status<>0 RETURN @n_status

   -- Loading agency data from cprcdr_byWAC (rptType IS NULL)
   IF @v_agencyData='Y' 
   BEGIN
      INSERT INTO rpt_monthlyReport (
         mr_agency,
         mr_ServicerNumber,
         mr_ServicerName,
         mr_OrigTerm,
         mr_LoanProgram ,
         mr_WACspread,                 --- Added 20050325
         mr_GrossCoupon,
         mr_GrossCouponInt,
         mr_OrigYear,
         mr_FactorCalc,
         mr_OrigBal,
         mr_CurrentBal,
         mr_WALA,
         mr_CPR1Month,
         mr_CPR3Month,
         mr_CPR6Month,
         mr_CPR12Month,
         mr_CPRLife,
         mr_Source,
         mr_showRank)
      SELECT 
         x.cprcdr_agency,
         s.ServicerNumber,
         s.ServicerName,
         x.cprcdr_OrigTerm,
         CASE x.cprcdr_agency WHEN 'GNMA II' THEN 'Government' ELSE 'Conventional' END,
         @n_WACspread,
         x.cprcdr_WAC,
         GrossCouponInt=x.cprcdr_wacLow,   
         x.cprcdr_OrigYear,
         x.cprcdr_Factor,
         x.cprcdr_OBal/1000000,
         x.cprcdr_CBal/1000000,
         x.cprcdr_age,
--         CPR1Month=CASE WHEN age<1 THEN NULL ELSE CPR1 END,
--         CPR3Month=CASE WHEN age<3 THEN NULL ELSE CPR3 END,
--         CPR6Month=CASE WHEN age<6 THEN NULL ELSE CPR6 END,
--         CPR1year=CASE WHEN age<12 THEN NULL ELSE CPR12 END,
         CPR1Month=x.cprcdr_CPR1 ,
         CPR3Month=x.cprcdr_CPR3 ,
         CPR6Month=x.cprcdr_CPR6 ,
         CPR1year=x.cprcdr_CPR12,
         x.cprcdr_CPRLife,
         'CPRCDR',
         showRank=2
      FROM   rpt_servicer s, rpt_CPRCDR_byWAC x
      WHERE  x.cprcdr_agency=s.servicerName
      AND    ABS(x.cprcdr_WACRange-@n_WACspread)<.01
      AND    100*@n_year+@n_month-x.cprcdr_asOfdate in (1, 89)
      AND EXISTS (                 --- 20040323 not load if no MPF in the cohort
         SELECT 1 FROM rpt_monthlyReport 
         WHERE  mr_servicerNumber=(SELECT servicerNumber FROM rpt_servicer WHERE servicerName='MPF')
         AND    ISNULL(mr_bal3monBefore, mr_currentBal)>=5 
         AND    mr_origYear=x.cprcdr_origYear
         AND    mr_origTerm=x.cprcdr_origTerm
         AND    mr_loanProgram=CASE x.cprcdr_agency WHEN 'GNMA II' THEN 'Government' ELSE 'Conventional' END
         AND    mr_WACspread=@n_WACspread
         AND    mr_GrossCouponInt=x.cprcdr_wacLow)      --- 20040524

      EXEC @n_status=usp_errHandler @@error, 'usp_loadMonthlyReport: set agency data'
      IF @n_status<>0 RETURN @n_status

      --- Update prevLnsz, prevBal and cpr1p1 for agencies
      UPDATE m
      SET    mr_prevLnsz=x.cprcdr_cLnsz, mr_prevBal=x.cprcdr_cBal, mr_cpr1p1=x.cprcdr_cpr1
      FROM   rpt_monthlyReport m, rpt_CPRCDR_byWAC x 
      WHERE  m.mr_agency NOT LIKE '%MPF%'   
      AND    x.cprcdr_agency=m.mr_servicerName
      AND    ABS(m.mr_GrossCouponInt-x.cprcdr_WACLow)<.01
      AND    x.cprcdr_origYear=m.mr_origYear
      AND    x.cprcdr_origTerm=m.mr_origTerm
      AND    ABS(x.cprcdr_WACRange-@n_WACspread)<.01
      AND    100*@n_year+@n_month-x.cprcdr_asOfdate in (2, 90)

      EXEC @n_status=usp_errHandler @@error, 'usp_loadMonthlyReport: set prevLnsz, prevBal and cpr1p1 for agencies'
      IF @n_status<>0 RETURN @n_status
   END



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE usp_loadPoolData (@v_type CHAR, @n_year SMALLINT, @n_month SMALLINT) AS
   INSERT INTO rpt_etlLog (process, logTime,  message)
   VALUES ('usp_loadPoolData', getdate(), 
      'Started with param: '+@v_type+', '+CAST(@n_year AS VARCHAR)+', '+CAST(@n_month AS VARCHAR))

   PRINT 'usp_loadPoolData: started'

DECLARE 
   @n_yearInit               SMALLINT, 
   @n_1stRptYear             SMALLINT, 
   @n_adjYearMonth           INT,
   @n_WACspread              decimal(19, 7),
   @n_WACmovedBy             decimal(19, 7)

   SET @n_yearInit=(SELECT  refValue FROM rpt_Reference WHERE refCode='STARTYEAR')
   SET @n_WACspread=(SELECT  refValue FROM rpt_Reference WHERE refCode='WACSPREAD')
   SET @n_WACmovedBy=(SELECT  refValue FROM rpt_Reference WHERE refCode='WACMOVEDBY')
   SELECT @n_1stRptYear=refValue FROM rpt_reference WHERE refCode='1STRPTYEAR'

   SET @n_adjYearMonth=100*@n_Year + @n_month
   
   DELETE rpt_poolData 
   WHERE  pd_rptType=@v_type 
   AND    ((pd_rptYear=@n_year AND pd_rptMonth=@n_month) OR pd_adjYearMonth=100*@n_year+@n_month)
   AND    pd_WACspread=@n_WACspread

   INSERT INTO rpt_poolData (
      pd_rptYear, pd_rptMonth, pd_origYear, pd_origTerm, pd_loanProgram, pd_servicerNumber, pd_WACspread, 
      pd_WACLow,
      pd_WAC,
      pd_poolFactor,
      pd_origBal,
      pd_curBal ,
      pd_prevBal ,
      pd_SMM,
      pd_WALA,
      pd_adjYearMonth, pd_rptType, pd_numLoans, pd_aveLoanSize, pd_aveChgoPart, pd_sumChgoPart)    
   SELECT 
      ah.HistYear, ah.histMonth, YEAR(m.ms_origDate), m.ms_origTerm, m.ms_loanProgram, p1.sp_servicerNumber, @n_WACspread,
      WACLow=-@n_WACmovedBy+FLOOR(ROUND((@n_WACmovedBy+m.ms_curWAC)/@n_WACspread, 5))*@n_WACspread,
      WAC=SUM(ISNULL(m.ms_curWAC*ah.currentBal*m.ms_participationFactor,0))/
         (SUM(ISNULL(ah.currentBal*m.ms_participationFactor,0))+.0001), 
      poolFactor=SUM(ISNULL(ah.currentBal*m.ms_participationFactor,0)) /
         (SUM(m.ms_OrigBal*m.ms_participationFactor)+.0001), 
      SUM(m.ms_OrigBal*m.ms_participationFactor),
      curBal=SUM(ISNULL(ah.currentBal*m.ms_participationFactor,0)),
      prevBal=SUM(ISNULL(ah.PreviousBal*m.ms_participationFactor,0)), 
      SMM=SUM(ISNULL(ah.PreviousBal*m.ms_participationFactor*ah.SMM/100,0))/
         (SUM(ISNULL(ah.PreviousBal*m.ms_participationFactor,0))+.00001),
      WALA=SUM(ISNULL(ah.WALA*ah.currentBal*m.ms_participationFactor,0))/
                 (SUM(ISNULL(ah.currentBal*m.ms_participationFactor,0))+.00001),
      @n_adjYearMonth, @v_type, COUNT(*), 
      aveLoanSize=CASE 
         WHEN @v_type<>'S' THEN SUM(ah.currentBal*m.ms_participationFactor)/
            (SUM(m.ms_participationFactor)+.00001) 
         ELSE SUM(ah.currentBal)/(SUM(SIGN(ah.currentBal))+.00001) END, 
      aveChgoPart=CASE 
         WHEN @v_type<>'S' THEN SUM(ah.currentBal*m.ms_participationFactor)/
            (SUM(ah.currentBal)+.00001)
         ELSE 1 END,
      sumChgoPart=SUM(SIGN(ah.currentBal)*m.ms_participationFactor)
   FROM   rpt_servicerPool p, rpt_servicerPool p1, rpt_Master m, AFT.dbo.aftHistory ah
   WHERE  p.sp_rptYear=@n_year
   AND    p.sp_rptMonth=@n_month
   AND    p.sp_rptType=@v_type
   AND    p1.sp_rptYear=@n_Year
   AND    p1.sp_rptMonth=@n_month
   AND    p1.sp_rptType=@v_type
   AND    p1.sp_poolRank=p.sp_poolRank
   AND    p1.sp_servicerNumber=(
      SELECT MIN(sp_servicerNumber) FROM rpt_servicerPool 
      WHERE  sp_rptYear=@n_year AND sp_rptMonth=@n_month 
      AND    sp_rptType=@v_type
      AND    sp_poolRank=p1.sp_poolRank)
   AND    m.ms_servicerNumber=p.sp_servicerNumber               
   AND    m.ms_OrigBal> 0
   AND    m.ms_participationFactor>0
   AND    ah.loanIDnumber=m.ms_loanIDnumber
   AND    ah.histYear>=@n_1stRptYear
   AND    (ah.HistYear<@n_year OR (ah.HistYear=@n_year AND ah.histMonth<@n_month) )
   GROUP BY m.ms_loanProgram, YEAR(m.ms_origDate), m.ms_origTerm, ah.HistYear, ah.histMonth, 
      -@n_WACmovedBy+FLOOR(ROUND((@n_WACmovedBy+m.ms_curWAC)/@n_WACspread, 5))*@n_WACspread, p1.sp_servicerNumber

   INSERT INTO rpt_etlLog (process, logTime,  message)
   VALUES ('usp_loadPoolData', getdate(), 'Ended')
   PRINT 'usp_loadPoolData: Ended'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE usp_makeForecast (
   @v_type VARCHAR(1)='C',
   @n_WACspread decimal(5,4)=0.25,
   @n_WACmovedBy decimal(5,4)=0,   
   @n_year SMALLINT,
   @n_month SMALLINT,
   @v_setFactor VARchar(5)='N' )
AS 
   DECLARE @n_invSpan decimal(19, 7) 
   DECLARE @n_status INT , @n_err int
   DECLARE @n_MPF INT, @n_FNMA INT, @n_FHLMC INT, @n_GNMA2 INT

   PRINT 'usp_makeForecast '+@v_type+','+CAST(@n_WACspread AS VARCHAR)+','+CAST(@n_WACmovedBy AS VARCHAR)+', '+
      CAST(@n_year AS VARCHAR)+', '+CAST(@n_month AS VARCHAR)+' started at:'+CAST(getdate() AS VARCHAR)
   INSERT INTO rpt_etlLog (process, logTime,  message)
   VALUES ('usp_makeForecast', getdate(), 
      'Started with: '+@v_type+', '+CAST(@n_WACspread AS VARCHAR)+','+CAST(@n_WACmovedBy AS VARCHAR)+', '+
      CAST(@n_year AS VARCHAR)+', '+CAST(@n_month AS VARCHAR))
   
   IF (@v_setFactor='Y') 
   BEGIN
      IF (@v_type='P') 
      BEGIN
         EXEC usp_setPortfolioFactor
         EXEC @n_status=usp_errHandler @@error, 'usp_makeForecast: usp_setPortfolioFactor'
         IF @n_status<>0 RETURN @n_status
      END
      IF (@v_type='C') 
      BEGIN
         EXEC usp_setChgoFactor
         EXEC @n_status=usp_errHandler @@error, 'usp_makeForecast: usp_setChgoFactor'
         IF @n_status<>0 RETURN @n_status
      END
      IF (@v_type='S') 
      BEGIN
         UPDATE rpt_Master SET ms_participationFactor=1
         EXEC @n_status=usp_errHandler @@error, 'usp_makeForecast - ms_participationFactor=1'
         IF @n_status<>0 RETURN @n_status
      END
   END
   
   SET @n_invSpan=ROUND(1/@n_WACspread, 0)
   
   DELETE rpt_prelimReport WHERE prelim_rptYearMonth=100*@n_Year+@n_Month and prelim_rptType=@v_type
   
   SELECT @n_MPF=s1.servicerNumber, @n_FNMA=s2.servicerNumber, 
          @n_FHLMC=s3.servicerNumber, @n_GNMA2=s4.servicerNumber
   FROM   rpt_servicer s1, rpt_servicer s2, rpt_servicer s3, rpt_servicer s4
   WHERE  s1.servicerName='MPF'
   AND    s2.servicerName='FNMA'
   AND    s3.servicerName='FHLMC'
   AND    s4.servicerName='GNMA II'
   EXEC @n_status=usp_errHandler @@error, 'usp_makeForecast - get servicerNumbers'
   IF @n_status<>0 RETURN @n_status
   
   -- insert MPF AND agency records
   INSERT INTO rpt_prelimReport (
      prelim_servicerNumber,
      prelim_ServicerName,
      prelim_OrigTerm,
      prelim_LoanProgram ,
      prelim_OrigYear ,
      prelim_WAClow,
      prelim_GrossCoupon,
      prelim_CPR1,
      prelim_curBal,
      prelim_preBal,
      prelim_WALA,
      prelim_CPR1Month ,
      prelim_CPR3Month ,
      prelim_CPR6Month,
      prelim_rptYearMonth,
      prelim_rptType)
   SELECT
      p.mr_servicerNumber,
      p.mr_ServicerName,
      p.mr_OrigTerm,
      p.mr_LoanProgram,
      p.mr_OrigYear,
      WAClow=p.mr_GrossCouponInt,
      p.mr_GrossCoupon,
      c.cprcdr_CPR1,
      curBal=c.cprcdr_cBal/1000000,
      preBal=p.mr_CurrentBal,
      WALA=ISNULL(c.cprcdr_age, p.mr_WALA+1),
      p.mr_CPR1Month,
      p.mr_CPR3Month,
      p.mr_CPR6Month,
      100*@n_Year+@n_Month,
      @v_type
   FROM   rpt_monthlyReport AS p LEFT OUTER JOIN (
      SELECT * FROM dbo.rpt_CPRCDR_byWAC 
      WHERE  cprcdr_origYear>1999 
      and    cprcdr_WACrange=@n_WACspread
      and    100*@n_Year+@n_Month-cprcdr_asOfDate in (1, 89)) AS c
   ON     p.mr_servicerName=c.cprcdr_agency
   AND    p.mr_origTerm=c.cprcdr_origTerm
   AND    p.mr_origYear=c.cprcdr_origYear
   AND    ABS(p.mr_GrossCouponInt-c.cprcdr_WACLow)<.01
   WHERE  p.mr_servicerNUmber in (@n_MPF, @n_FNMA, @n_FHLMC, @n_GNMA2)
   AND    p.mr_CurrentBal>0
   AND    p.mr_origYear>1999
   AND    p.mr_WACspread=@n_WACspread
   AND    (p.mr_rptType=@v_type OR p.mr_rptType IS NULL)
   EXEC @n_status=usp_errHandler @@error, 'usp_makeForecast - load rpt_prelimReport'
   IF @n_status<>0 RETURN @n_status
   
   -- Calclating the estCPR1 for MPF
   UPDATE tarTbl
   SET    prelim_estCPR1=
      CASE 
      WHEN c.cpr1/(c.cpr1p1+.00001)>10 THEN c.cpr1
      WHEN tarTbl.prelim_CPR1month*c.cpr1/(c.cpr1p1+.00001)<100 THEN tarTbl.prelim_CPR1month*c.cpr1/(c.cpr1p1+.00001) 
      ELSE 100 END
   FROM   rpt_prelimReport AS tarTbl, (
      SELECT 
         prelim_loanProgram,
         prelim_origTerm,
         prelim_origYear,
         prelim_WACLow,
         Cpr1=SUM(prelim_preBal*prelim_CPR1)/(SUM(prelim_preBal)+.000001),
         Cpr1p1=SUM(prelim_preBal*prelim_CPR1month)/(SUM(prelim_preBal)+.000001),
         Cpr3=SUM(prelim_preBal*prelim_CPR3Month)/(SUM(prelim_preBal)+.000001)
      FROM   rpt_prelimReport
      WHERE  prelim_servicerNumber<>@n_MPF
      and    prelim_rptType=@v_type
      AND    prelim_rptYearMonth=100*@n_Year+@n_Month
      GROUP BY prelim_loanProgram, prelim_origTerm, prelim_origYear, prelim_WACLow) AS C
   WHERE  tarTbl.prelim_servicerNumber=@n_MPF
   and    tarTbl.prelim_rptType=@v_type
   AND    tarTbl.prelim_loanProgram=c.prelim_loanProgram
   AND    c.prelim_origTerm=CASE 
      WHEN tarTbl.prelim_origTerm IN (180, 240, 360) 
      THEN CASE
         WHEN tarTbl.prelim_origTerm=240 AND tarTbl.prelim_LoanProgram='Government' 
         THEN 360
         ELSE tarTbl.prelim_origTerm END
      ELSE 180 END
   AND    tarTbl.prelim_origYear=c.prelim_origYear
   AND    tarTbl.prelim_WACLow=c.prelim_WACLow
   AND    tarTbl.prelim_rptYearMonth=100*@n_Year+@n_Month
   AND    c.cpr1 IS NOT NULL                        -- 20040206 don't calculate if no data available
   EXEC @n_status=usp_errHandler @@error, 'usp_makeForecast - Calclate estCPR1'
   IF @n_status<>0 RETURN @n_status
   
   -- calculate the schedulePrincipal
   UPDATE r
   set    r.prelim_schPrincipal=v.schPrin/1000000
   from   rpt_prelimReport r, 
      (
      select m.ms_loanProgram, m.ms_origTerm, YEAR(m.ms_origDate) origYear, 
         -@n_WACmovedBy+FLOOR(ROUND((@n_WACmovedBy+m.ms_curWAC)/@n_WACspread, 5))*@n_WACspread as WAClow,
         SUM(m.ms_participationFactor*m.ms_curWAC/1200*(m.ms_origBal/(1-power(1/(1+m.ms_curWAC/1200), m.ms_origTerm))-m.ms_curBal)) as schPrin
      from   rpt_Master m
      WHERE  ms_curBal>0
      GROUP BY m.ms_loanProgram, m.ms_origTerm, YEAR(m.ms_origDate), 
         -@n_WACmovedBy+FLOOR(ROUND((@n_WACmovedBy+m.ms_curWAC)/@n_WACspread, 5))*@n_WACspread 
      ) as v
   WHERE  r.prelim_servicerNumber=@n_MPF
   and    r.prelim_rptType=@v_type
   AND    r.prelim_loanProgram=v.ms_loanProgram
   AND    r.prelim_origTerm=v.ms_origTerm
   AND    r.prelim_origYear=v.origYear
   AND    r.prelim_WACLow=v.WAClow
   AND    r.prelim_rptYearMonth=100*@n_Year+@n_Month
   EXEC @n_status=usp_errHandler @@error, 'usp_makeForecast - Calclate schedulePrincipal'
   IF @n_status<>0 RETURN @n_status
   
   -- Calclating the estCurBal for MPF
   UPDATE r
   SET    r.prelim_estCurBal=(r.prelim_preBal-r.prelim_SchPrincipal)*POWER(1-r.prelim_estCPR1/100, 1.0/12), 
      r.prelim_premiumPaydown=m.mr_pdNet*(1-POWER(1-r.prelim_estCPR1/100, 1.0/12)),
      r.prelim_net=m.mr_pdNet
   from   rpt_prelimReport r, rpt_monthlyReport m
   WHERE  r.prelim_servicerNUmber=@n_MPF
   and    r.prelim_rptType=@v_type
   AND    r.prelim_rptYearMonth=100*@n_Year+@n_Month
   AND    m.mr_servicerNUmber=r.prelim_servicerNUmber
   AND    m.mr_origYear=r.prelim_origYear
   AND    m.mr_origTerm=r.prelim_origTerm
   AND    m.mr_loanProgram=r.prelim_loanProgram
   AND    m.mr_WACspread=@n_WACspread
   AND    m.mr_grossCouponInt=r.prelim_WACLow
   AND    m.mr_rptType=@v_type
   EXEC @n_status=usp_errHandler @@error, 'usp_makeForecast - Calclate estCurBal'
   IF @n_status<>0 RETURN @n_status
   
   update rpt_prelimReport 
   set    prelim_paydown=
      CASE WHEN prelim_servicerNumber=@n_MPF THEN prelim_preBal-prelim_estCurBal
      ELSE prelim_preBal-prelim_curBal 
      END
   where  prelim_rptYearMonth=100*@n_Year+@n_Month
   and    prelim_rptType=@v_type
   EXEC @n_status=usp_errHandler @@error, 'usp_makeForecast - Calclate paydown'
   IF @n_status<>0 RETURN @n_status

   -- INSERT INTO rpt_etlLog (process, logTime,  message)
   -- VALUES ('usp_makeForecast', getdate(), 'Ended')




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE usp_prelimReport (
   @v_type VARCHAR(1)='A',
   @n_WACspread decimal(5,4)=0.25,
   @n_WACmovedBy decimal(5,4)=0,   
   @n_year  SMALLINT=NULL,
   @n_month SMALLINT=NULL,
   @v_agencyData VARCHAR(1)='Y',
   @v_setFactor VARchar(5)='Y'
   )
AS 
   DECLARE @n_invSpan decimal(19, 7) 
   DECLARE @d_curDate DATETIME
   DECLARE @n_status INT, @n_err int, @n_tmp int
   DECLARE @v_msg VARCHAR(100)

   SET @v_msg='usp_prelimReport '+@v_type+','+CAST(@n_WACspread AS VARCHAR)+','+CAST(@n_WACmovedBy AS VARCHAR)+', '+
      ISNULL(CAST(@n_year AS VARCHAR),' ')+', '+ISNULL(CAST(@n_month AS VARCHAR),' ')+', '+@v_agencyData+', '+@v_setFactor
   PRINT @v_msg+' started at:'+CAST(getdate() AS VARCHAR)
   INSERT INTO rpt_etlLog (process, logTime,  message) VALUES ('usp_prelimReport', getdate(), @v_msg)
   
   IF (@v_type='A') 
   BEGIN
      ---- Call usp_init only the first time
      EXEC @n_status=usp_init @n_WACspread, @n_WACmovedBy
      SET @n_err=@@error
      IF @n_status<>0 RETURN @n_status
      EXEC @n_status=usp_errHandler @n_err, 'usp_prelimReport: usp_init'
      IF @n_status<>0 RETURN @n_status

      EXEC dbo.usp_setChgoFactor
      EXEC @n_status=usp_errHandler @@error, 'usp_prelimReport: usp_setChgoFactor'
      IF @n_status<>0 RETURN @n_status
      
      EXEC @n_status=dbo.usp_prelimReport 'C', @n_WACspread, @n_WACmovedBy, @n_year, @n_month, 'Y'
      SET @n_err=@@error
      IF @n_status<>0 RETURN @n_status
      EXEC @n_status=usp_errHandler @n_err, 'usp_prelimReport: usp_prelimReport C'
      IF @n_status<>0 RETURN @n_status

      -- UPDATE rpt_Master SET participationFactor=1
      -- EXEC dbo.usp_prelimReport 'S', @n_WACspread, @n_WACmovedBy, @n_year, @n_month, 'N'
      -- SET @n_err=@@ERROR
      -- IF (@n_err<>0) RETURN @n_err 

      EXEC usp_setPortfoliofactor
      EXEC @n_status=usp_errHandler @@error, 'usp_prelimReport: usp_setPortfoliofactor'
      IF @n_status<>0 RETURN @n_status
      
      EXEC @n_status=dbo.usp_prelimReport 'P', @n_WACspread, @n_WACmovedBy, @n_year, @n_month, 'N'
      SET @n_err=@@error
      IF @n_status<>0 RETURN @n_status
      EXEC @n_status=usp_errHandler @n_err, 'usp_prelimReport: usp_prelimReport P'
      IF @n_status<>0 RETURN @n_status
      
      RETURN 0
   END

   SET @n_invSpan=ROUND(1/@n_WACspread, 0)

   ---- set the reporting period
   IF (@n_year IS NULL) 
   BEGIN
      SELECT @n_year=r1.refValue, @n_month=r2.refValue 
      FROM   rpt_reference r1, rpt_reference r2 
      WHERE  r1.refCode='LATESTYEAR'
      AND    r2.refCode='LATESTMONTH'
   END
   ELSE
   BEGIN
      SELECT @d_curDate = DATEADD(MONTH, -1, dbo.fn_YearMonthDayToDate(@n_year, @n_month, 1)) 
      SET @n_year=YEAR(@d_curDate)
      SET @n_month=MONTH(@d_curDate)
   END

   ---- set the participation factor
   IF (@v_setFactor='Y') 
   BEGIN
      IF (@v_type='P') 
      BEGIN
         EXEC usp_setPortfolioFactor
         EXEC @n_status=usp_errHandler @@error, 'usp_prelimReport: usp_setPortfolioFactor'
         IF @n_status<>0 RETURN @n_status
      END
      IF (@v_type='C') 
      BEGIN
         EXEC usp_setChgoFactor
         EXEC @n_status=usp_errHandler @@error, 'usp_prelimReport: usp_setChgoFactor'
         IF @n_status<>0 RETURN @n_status
      END
      IF (@v_type='S') 
      BEGIN
         UPDATE rpt_Master SET ms_participationFactor=1
         EXEC @n_status=usp_errHandler @@error, 'usp_prelimReport - ms_participationFactor=1'
         IF @n_status<>0 RETURN @n_status
      END
   END
      
   ---- Load reporting month's data, assuming agency data was loaded for the @n_year @n_month by usp_loadCurrent
   EXEC @n_status=usp_collectCurData @v_type, @v_agencyData, @n_year, @n_month, @n_WACspread
   SET @n_err=@@error
   IF @n_status<>0 RETURN @n_status
   EXEC @n_status=usp_errHandler @n_err, 'usp_prelimReport: usp_init'
   IF @n_status<>0 RETURN @n_status

   EXEC @n_status=usp_setStat @v_type, @n_year, @n_month, 'N', 'Y'
   SET @n_err=@@error
   IF @n_status<>0 RETURN @n_status
   EXEC @n_status=usp_errHandler @n_err, 'usp_prelimReport: usp_setStat'
   IF @n_status<>0 RETURN @n_status
   
   INSERT INTO rpt_monRptHist SELECT *, 100*@n_year+@n_month FROM rpt_monthlyReport WHERE mr_rptType=@v_type AND mr_WacSpread=@n_WACspread

   ---- Current period
   SELECT @d_curDate = DATEADD(MONTH, 1, dbo.fn_YearMonthDayToDate(@n_year, @n_month, 1)) 
   SET @n_year=YEAR(@d_curDate)
   SET @n_month=MONTH(@d_curDate)
   
   EXEC @n_status=usp_makeForecast @v_type, @n_WACspread, @n_WACmovedBy, @n_year, @n_month, 'N'
   SET @n_err=@@error
   IF @n_status<>0 RETURN @n_status
   EXEC @n_status=usp_errHandler @n_err, 'usp_prelimReport: usp_makeForecast'
   IF @n_status<>0 RETURN @n_status

   PRINT 'usp_prelimReport ended at:'+CAST(getdate() AS VARCHAR)
   INSERT INTO rpt_etlLog (process, logTime,  message)
   VALUES ('usp_prelimReport', getdate(), 'Ended')
      

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE usp_rankCurServicer 
   @v_type CHAR,
   @n_year SMALLINT=NULL, 
   @n_month SMALLINT=NULL
AS
   INSERT INTO rpt_etlLog (process, logTime,  message)
   VALUES ('usp_rankCurServicer', getdate(), 
      'Started with param: '+@v_type+', '+CAST(@n_year AS VARCHAR)+', '+CAST(@n_month AS VARCHAR))

   DECLARE @n_status INT, @n_servicerNumber INT, @n_curBal decimal(19, 7)
   DECLARE @n_SNumOther INT, @n_SNumMPF INT
   DECLARE @n_rankOther SMALLINT, @n_rank SMALLINT, @n_top SMALLINT
   
   SET @n_rankOther=(SELECT refValue FROM rpt_Reference WHERE refCode='RANKOTHER')
   SET @n_rank=(SELECT refValue FROM rpt_Reference WHERE refCode='RANKFIRST')
   SET @n_top=(SELECT refValue FROM rpt_Reference WHERE refCode='RANKLAST')
   SET @n_SNumMPF=(SELECT servicerNumber FROM rpt_servicer WHERE servicerName='MPF')
   SET @n_SNumOther=(SELECT servicerNumber FROM rpt_servicer WHERE servicerName='All Others')

   DECLARE c_servicer CURSOR FOR
      SELECT ms_servicerNumber, SUM(ms_participationFactor*ms_curBal) bal 
      FROM   rpt_Master m 
      WHERE  ms_participationFactor>0
      GROUP BY ms_servicerNumber
      ORDER BY bal DESC

   IF (@n_year IS NULL)
      SELECT @n_year=r1.refValue, @n_month=r2.refValue 
      FROM   rpt_reference r1, rpt_reference r2
      WHERE  r1.refCode='LATESTYEAR'
      AND    r2.refCode='LATESTMONTH'
   
   DELETE rpt_servicerPool WHERE sp_rptType=@v_type AND sp_rptYear=@n_year AND sp_rptMonth=@n_month
   
   INSERT INTO rpt_servicerPool (sp_rptYear, sp_rptMonth, sp_poolRank, sp_servicerNumber, sp_rptType) 
   SELECT @n_year, @n_month, 1, servicerNumber, @v_type
   FROM   rpt_servicer
   WHERE  servicerName='MPF'
      
   INSERT INTO rpt_servicerPool (sp_rptYear, sp_rptMonth, sp_poolRank, sp_servicerNumber, sp_rptType) 
   SELECT @n_year, @n_month, @n_rankOther, s.servicerNumber, @v_type
   FROM   rpt_servicer s
   WHERE  s.servicerName='All Others'

   OPEN c_servicer
   FETCH NEXT FROM c_servicer INTO @n_servicerNumber, @n_curBal
   
   WHILE (@@FETCH_STATUS <> -1)
   BEGIN
      INSERT INTO rpt_servicerPool (sp_rptYear, sp_rptMonth, sp_poolRank, sp_servicerNumber, sp_curBal, sp_rptType) 
      VALUES (@n_year, @n_month, @n_rank, @n_servicerNumber, @n_curBal, @v_type)

      IF ( @n_rank<=@n_top ) 
         IF ( @n_rank<@n_top ) SET @n_rank = @n_rank + 1
         ELSE SET @n_rank = @n_rankOther 
      
      FETCH NEXT FROM c_servicer INTO @n_servicerNumber, @n_curBal
   END
   CLOSE c_servicer
   DEALLOCATE c_servicer
   EXEC @n_status=usp_errHandler @@error, 'usp_rankCurServicer - insert into rpt_servicerPool'
   IF @n_status<>0 RETURN @n_status

   ---- curBal for All Others
   UPDATE s
   SET    s.sp_curBal=(
      SELECT SUM(sp_curBal)
      FROM   rpt_servicerPool
      WHERE  sp_rptYear=s.sp_rptYear
      AND    sp_rptMonth=s.sp_rptMonth
      AND    sp_rptType=s.sp_rptType
      AND    sp_poolRank=s.sp_poolRank
      AND    sp_servicerNumber NOT IN (@n_SNumOther, @n_SNumMPF))
   FROM   rpt_servicerPool s
   WHERE  s.sp_servicerNumber=@n_SNumOther
   AND    s.sp_rptType=@v_type
   AND    s.sp_rptYear=@n_year
   AND    s.sp_rptMonth=@n_month
   EXEC @n_status=usp_errHandler @@error, 'usp_rankCurServicer - curBal for All Others'
   IF @n_status<>0 RETURN @n_status
      
   ---- curBal for MPF
   UPDATE s
   SET    s.sp_curBal=(
      SELECT SUM(sp_curBal)
      FROM   rpt_servicerPool
      WHERE  sp_rptYear=s.sp_rptYear
      AND    sp_rptMonth=s.sp_rptMonth
      AND    sp_rptType=s.sp_rptType
      AND    ((sp_poolRank<=@n_top AND sp_servicerNumber<>@n_SNumMPF) OR 
         sp_servicerNumber=@n_SNumOther))
   FROM   rpt_servicerPool s
   WHERE  s.sp_servicerNumber=@n_SNumMPF
   AND    s.sp_rptType=@v_type
   AND    s.sp_rptYear=@n_year
   AND    s.sp_rptMonth=@n_month
   EXEC @n_status=usp_errHandler @@error, 'usp_rankCurServicer - curBal for MPF'
   IF @n_status<>0 RETURN @n_status




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE dbo.usp_setCPR (@v_type CHAR, @n_rptYear SMALLINT, @n_rptMonth SMALLINT) AS
   INSERT INTO rpt_etlLog (process, logTime,  message)
   VALUES ('usp_setCPR', getdate(), 
      'Started with param: '+@v_type+', '+CAST(@n_rptYear AS VARCHAR)+', '+CAST(@n_rptMonth AS VARCHAR))
   PRINT 'usp_setCPR: started'

   DECLARE @n_status INT, @n_err int, @n_adjYearMonth INT
   DECLARE @n_sNumOthers INT
   DECLARE @n_WACspread decimal(5,4)
   
   SET @n_adjYearMonth=100*@n_rptYear + @n_rptMonth
   SET @n_sNumOthers=(SELECT servicerNumber FROM rpt_servicer WHERE servicerName='All Others')
   SELECT @n_WACspread=refValue FROM rpt_reference WHERE refCode='WACSPREAD'

   EXEC @n_status=usp_setCPRothers @v_type, @n_rptYear, @n_rptMonth
   SET @n_err=@@error
   IF @n_status<>0 RETURN @n_status
   EXEC @n_status=usp_errHandler @n_err, 'usp_setCPR: usp_setCPRothers'
   IF @n_status<>0 RETURN @n_status
   
   -- CPR1Month
   UPDATE rpt_poolData	
   SET    pd_CPR1Month=1-Power((1-pd_SMM), 12)
   WHERE  pd_WACspread=@n_WACspread
   EXEC @n_status=usp_errHandler @@error, 'usp_setCPR - CPR1'
   IF @n_status<>0 RETURN @n_status

   SELECT 
      pd_rptYear rptYear ,
      pd_rptMonth rptMonth ,
      pd_origYear origYear ,
      pd_origTerm origTerm ,
      pd_loanProgram loanProgram ,
      pd_servicerNumber servicerNumber ,
      pd_WACLow WACLow,
      pd_SMM SMM,
      pd_WALA WALA,
      pd_adjYearMonth adjYearMonth, 
      pd_rptType rptType
   INTO   #poolData
   FROM   rpt_poolData 
   WHERE  pd_rptType=@v_type
   AND    pd_servicerNumber<>@n_sNumOthers
   AND    100*pd_rptYear+pd_rptMonth >= @n_adjYearMonth-100
   AND    pd_WACspread=@n_WACspread
   EXEC @n_status=usp_errHandler @@error, 'usp_setCPR - Create #poolData'
   IF @n_status<>0 RETURN @n_status

   -- CPR3Month
   UPDATE d1	
   SET    d1.pd_CPR3Month=1-Power((1-d1.pd_SMM)*(1-d2.SMM)*(1-d3.SMM), 4)
   FROM   rpt_poolData d1, #poolData d2, #poolData d3
   WHERE  d1.pd_rptYear=@n_rptYear
   AND    d1.pd_rptMonth=@n_rptMonth  
   AND    d1.pd_WACspread=@n_WACspread
-- 20040429   AND    d1.pd_WALA>=2.5  
   AND    d1.pd_servicerNUmber<>@n_sNumOthers
   AND    d1.pd_rptType=@v_type
   AND    d2.origYear=d1.pd_origYear
   AND    d2.origTerm=d1.pd_origTerm
   AND    d2.loanProgram=d1.pd_loanProgram
   AND    d2.WACLow=d1.pd_WACLow
   AND    d2.servicerNumber=d1.pd_servicerNumber
   AND    d2.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d2.rptYear, d2.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d1.pd_rptYear, d1.pd_rptMonth, 18))=1  
   AND    d1.pd_adjYearMonth-d2.adjYearMonth IN (0, 1, 89)
   AND    d3.origYear=d1.pd_origYear
   AND    d3.origTerm=d1.pd_origTerm
   AND    d3.loanProgram=d1.pd_loanProgram
   AND    d3.WACLow=d1.pd_WACLow
   AND    d3.servicerNumber=d1.pd_servicerNumber
   AND    d3.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d3.rptYear, d3.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d2.rptYear, d2.rptMonth, 18))=1  
   AND    d2.adjYearMonth-d3.adjYearMonth IN (0, 1, 89)
   EXEC @n_status=usp_errHandler @@error, 'usp_setCPR - CPR3'
   IF @n_status<>0 RETURN @n_status
   
   -- CPR6Month
   UPDATE d1	
   SET    d1.pd_CPR6Month=1-Power((1-d1.pd_SMM)*(1-d2.SMM)*(1-d3.SMM)*(1-d4.SMM)*(1-d5.SMM)*(1-d6.SMM), 2)
   FROM   rpt_poolData d1, #poolData d2, #poolData d3, #poolData d4, #poolData d5, #poolData d6
   WHERE  d1.pd_rptYear=@n_rptYear
   AND    d1.pd_rptMonth=@n_rptMonth  
   AND    d1.pd_WACspread=@n_WACspread
-- 20040429   AND    d1.pd_WALA>=5.5  
   AND    d1.pd_servicerNUmber<>@n_sNumOthers
   AND    d1.pd_rptType=@v_type
   AND    d2.origYear=d1.pd_origYear
   AND    d2.origTerm=d1.pd_origTerm
   AND    d2.loanProgram=d1.pd_loanProgram
   AND    d2.WACLow=d1.pd_WACLow
   AND    d2.servicerNumber=d1.pd_servicerNumber
   AND    d2.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d2.rptYear, d2.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d1.pd_rptYear, d1.pd_rptMonth, 18))=1  
   AND    d1.pd_adjYearMonth-d2.adjYearMonth IN (0, 1, 89)
   AND    d3.origYear=d1.pd_origYear
   AND    d3.origTerm=d1.pd_origTerm
   AND    d3.loanProgram=d1.pd_loanProgram
   AND    d3.WACLow=d1.pd_WACLow
   AND    d3.servicerNumber=d1.pd_servicerNumber
   AND    d3.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d3.rptYear, d3.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d2.rptYear, d2.rptMonth, 18))=1  
   AND    d2.adjYearMonth-d3.adjYearMonth IN (0, 1, 89)
   AND    d4.origYear=d1.pd_origYear
   AND    d4.origTerm=d1.pd_origTerm
   AND    d4.loanProgram=d1.pd_loanProgram
   AND    d4.WACLow=d1.pd_WACLow
   AND    d4.servicerNumber=d1.pd_servicerNumber
   AND    d4.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d4.rptYear, d4.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d3.rptYear, d3.rptMonth, 18))=1  
   AND    d3.adjYearMonth-d4.adjYearMonth IN (0, 1, 89)
   AND    d5.origYear=d1.pd_origYear
   AND    d5.origTerm=d1.pd_origTerm
   AND    d5.loanProgram=d1.pd_loanProgram
   AND    d5.WACLow=d1.pd_WACLow
   AND    d5.servicerNumber=d1.pd_servicerNumber
   AND    d5.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d5.rptYear, d5.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d4.rptYear, d4.rptMonth, 18))=1  
   AND    d4.adjYearMonth-d5.adjYearMonth IN (0, 1, 89)
   AND    d6.origYear=d1.pd_origYear
   AND    d6.origTerm=d1.pd_origTerm
   AND    d6.loanProgram=d1.pd_loanProgram
   AND    d6.WACLow=d1.pd_WACLow
   AND    d6.servicerNumber=d1.pd_servicerNumber
   AND    d6.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d6.rptYear, d6.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d5.rptYear, d5.rptMonth, 18))=1  
   AND    d5.adjYearMonth-d6.adjYearMonth IN (0, 1, 89)
   EXEC @n_status=usp_errHandler @@error, 'usp_setCPR - CPR6'
   IF @n_status<>0 RETURN @n_status

   -- CPR1Year
   UPDATE d1	
   SET    d1.pd_CPR1year=1-(1-d1.pd_SMM)*(1-d2.SMM)*(1-d3.SMM)*(1-d4.SMM)*(1-d5.SMM)*(1-d6.SMM)*
                     (1-d7.SMM)*(1-d8.SMM)*(1-d9.SMM)*(1-d10.SMM)*(1-d11.SMM)*(1-d12.SMM)
   FROM   rpt_poolData d1, #poolData d2, #poolData d3, #poolData d4, #poolData d5, #poolData d6,
          #poolData d7, #poolData d8, #poolData d9, #poolData d10, #poolData d11, #poolData d12
   WHERE  d1.pd_rptYear=@n_rptYear
   AND    d1.pd_rptMonth=@n_rptMonth  
   AND    d1.pd_WACspread=@n_WACspread
-- 20040429   AND    d1.pd_WALA>=11.5 
   AND    d1.pd_servicerNUmber<>@n_sNumOthers
   AND    d1.pd_rptType=@v_type
   AND    d2.origYear=d1.pd_origYear
   AND    d2.origTerm=d1.pd_origTerm
   AND    d2.loanProgram=d1.pd_loanProgram
   AND    d2.WACLow=d1.pd_WACLow
   AND    d2.servicerNumber=d1.pd_servicerNumber
   AND    d2.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d2.rptYear, d2.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d1.pd_rptYear, d1.pd_rptMonth, 18))=1  
   AND    d1.pd_adjYearMonth-d2.adjYearMonth IN (0, 1, 89)
   AND    d3.origYear=d1.pd_origYear
   AND    d3.origTerm=d1.pd_origTerm
   AND    d3.loanProgram=d1.pd_loanProgram
   AND    d3.WACLow=d1.pd_WACLow
   AND    d3.servicerNumber=d1.pd_servicerNumber
   AND    d3.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d3.rptYear, d3.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d2.rptYear, d2.rptMonth, 18))=1  
   AND    d2.adjYearMonth-d3.adjYearMonth IN (0, 1, 89)
   AND    d4.origYear=d1.pd_origYear
   AND    d4.origTerm=d1.pd_origTerm
   AND    d4.loanProgram=d1.pd_loanProgram
   AND    d4.WACLow=d1.pd_WACLow
   AND    d4.servicerNumber=d1.pd_servicerNumber
   AND    d4.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d4.rptYear, d4.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d3.rptYear, d3.rptMonth, 18))=1  
   AND    d3.adjYearMonth-d4.adjYearMonth IN (0, 1, 89)
   AND    d5.origYear=d1.pd_origYear
   AND    d5.origTerm=d1.pd_origTerm
   AND    d5.loanProgram=d1.pd_loanProgram
   AND    d5.WACLow=d1.pd_WACLow
   AND    d5.servicerNumber=d1.pd_servicerNumber
   AND    d5.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d5.rptYear, d5.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d4.rptYear, d4.rptMonth, 18))=1  
   AND    d4.adjYearMonth-d5.adjYearMonth IN (0, 1, 89)
   AND    d6.origYear=d1.pd_origYear
   AND    d6.origTerm=d1.pd_origTerm
   AND    d6.loanProgram=d1.pd_loanProgram
   AND    d6.WACLow=d1.pd_WACLow
   AND    d6.servicerNumber=d1.pd_servicerNumber
   AND    d6.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d6.rptYear, d6.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d5.rptYear, d5.rptMonth, 18))=1  
   AND    d5.adjYearMonth-d6.adjYearMonth IN (0, 1, 89)
   AND    d7.origYear=d1.pd_origYear
   AND    d7.origTerm=d1.pd_origTerm
   AND    d7.loanProgram=d1.pd_loanProgram
   AND    d7.WACLow=d1.pd_WACLow
   AND    d7.servicerNumber=d1.pd_servicerNumber
   AND    d7.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d7.rptYear, d7.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d6.rptYear, d6.rptMonth, 18))=1  
   AND    d6.adjYearMonth-d7.adjYearMonth IN (0, 1, 89)
   AND    d8.origYear=d1.pd_origYear
   AND    d8.origTerm=d1.pd_origTerm
   AND    d8.loanProgram=d1.pd_loanProgram
   AND    d8.WACLow=d1.pd_WACLow
   AND    d8.servicerNumber=d1.pd_servicerNumber
   AND    d8.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d8.rptYear, d8.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d7.rptYear, d7.rptMonth, 18))=1  
   AND    d7.adjYearMonth-d8.adjYearMonth IN (0, 1, 89)
   AND    d9.origYear=d1.pd_origYear
   AND    d9.origTerm=d1.pd_origTerm
   AND    d9.loanProgram=d1.pd_loanProgram
   AND    d9.WACLow=d1.pd_WACLow
   AND    d9.servicerNumber=d1.pd_servicerNumber
   AND    d9.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d9.rptYear, d9.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d8.rptYear, d8.rptMonth, 18))=1  
   AND    d8.adjYearMonth-d9.adjYearMonth IN (0, 1, 89)
   AND    d10.origYear=d1.pd_origYear
   AND    d10.origTerm=d1.pd_origTerm
   AND    d10.loanProgram=d1.pd_loanProgram
   AND    d10.WACLow=d1.pd_WACLow
   AND    d10.servicerNumber=d1.pd_servicerNumber
   AND    d10.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d10.rptYear, d10.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d9.rptYear, d9.rptMonth, 18))=1  
   AND    d4.adjYearMonth-d5.adjYearMonth IN (0, 1, 89)
   AND    d11.origYear=d1.pd_origYear
   AND    d11.origTerm=d1.pd_origTerm
   AND    d11.loanProgram=d1.pd_loanProgram
   AND    d11.WACLow=d1.pd_WACLow
   AND    d11.servicerNumber=d1.pd_servicerNumber
   AND    d11.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d11.rptYear, d11.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d10.rptYear, d10.rptMonth, 18))=1  
   AND    d10.adjYearMonth-d11.adjYearMonth IN (0, 1, 89)
   AND    d12.origYear=d1.pd_origYear
   AND    d12.origTerm=d1.pd_origTerm
   AND    d12.loanProgram=d1.pd_loanProgram
   AND    d12.WACLow=d1.pd_WACLow
   AND    d12.servicerNumber=d1.pd_servicerNumber
   AND    d12.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d12.rptYear, d12.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d11.rptYear, d11.rptMonth, 18))=1  
   AND    d11.adjYearMonth-d12.adjYearMonth IN (0, 1, 89)
   EXEC @n_status=usp_errHandler @@error, 'usp_setCPR - CPR12'
   IF @n_status<>0 RETURN @n_status

   drop table [dbo].[#poolData]
   -- INSERT INTO rpt_etlLog (process, logTime,  message)
   -- VALUES ('usp_setCPR', getdate(), 'Ended')
   PRINT 'usp_setCPR: ended'




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE dbo.usp_setCPRothers (@v_type CHAR, @n_rptYear SMALLINT, @n_rptMonth SMALLINT) 
AS
   INSERT INTO rpt_etlLog (process, logTime,  message)
   VALUES ('usp_setCPRothers', getdate(), 
      'Started with param: '+@v_type+', '+CAST(@n_rptYear AS VARCHAR)+', '+CAST(@n_rptMonth AS VARCHAR))

   DECLARE @n_status INT, @n_adjYearMonth INT
   DECLARE @n_sNumOthers INT
   DECLARE @n_WACspread decimal(5,4)

   SET @n_adjYearMonth=100*@n_rptYear + @n_rptMonth
   SET @n_sNumOthers=(SELECT servicerNumber FROM rpt_servicer WHERE servicerName='All Others')
   SET @n_WACspread=(SELECT refValue FROM rpt_reference WHERE refCode='WACSPREAD')
   PRINT 'usp_setCPRothers: started'

   SELECT 
      pd_rptYear rptYear ,
      pd_rptMonth rptMonth ,
      pd_origYear origYear ,
      pd_origTerm origTerm ,
      pd_loanProgram loanProgram ,
      pd_servicerNumber servicerNumber ,
      pd_WACLow WACLow,
      pd_SMM SMM,
      pd_WALA WALA,
      pd_adjYearMonth adjYearMonth, 
      pd_rptType rptType
   INTO   #poolData
   FROM   rpt_poolData 
   WHERE  pd_rptType=@v_type
   AND    pd_servicerNumber=@n_sNumOthers
   AND    100*pd_rptYear+pd_rptMonth >= @n_adjYearMonth-100
   AND    pd_WACspread=@n_WACspread
   EXEC @n_status=usp_errHandler @@error, 'usp_setCPRothers - Load #poolData'
   IF @n_status<>0 RETURN @n_status

   -- CPR3Month
   UPDATE d1	
   SET    d1.pd_CPR3Month=1-Power((1-d1.pd_SMM)*(1-d2.SMM)*(1-d3.SMM), 4)
   FROM   rpt_poolData d1, #poolData d2, #poolData d3
   WHERE  d1.pd_rptYear=@n_rptYear
   AND    d1.pd_rptMonth=@n_rptMonth  
   AND    d1.pd_WACspread=@n_WACspread
--   AND    d1.pd_WALA>=2.5  
   AND    d1.pd_servicerNUmber=@n_sNumOthers
   AND    d1.pd_rptType=@v_type
   AND    d2.origYear=d1.pd_origYear
   AND    d2.origTerm=d1.pd_origTerm
   AND    d2.loanProgram=d1.pd_loanProgram
   AND    d2.WACLow=d1.pd_WACLow
   AND    d2.servicerNumber=@n_sNumOthers
   AND    d2.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d2.rptYear, d2.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d1.pd_rptYear, d1.pd_rptMonth, 18))=1  
   AND    d2.adjYearMonth=(
      SELECT MAX(adjYearMonth) FROM #poolData
      WHERE  origYear=d1.pd_origYear
      AND    origTerm=d1.pd_origTerm
      AND    loanProgram=d1.pd_loanProgram
      AND    WACLow=d1.pd_WACLow
      AND    servicerNumber=@n_sNumOthers
      AND    rptType=@v_type
      AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(rptYear, rptMonth, 18), 
                      dbo.fn_yearMonthDayToDate(d1.pd_rptYear, d1.pd_rptMonth, 18))=1  
      AND    d1.pd_adjYearMonth-adjYearMonth IN (0, 1, 89) )
   AND    d3.origYear=d1.pd_origYear
   AND    d3.origTerm=d1.pd_origTerm
   AND    d3.loanProgram=d1.pd_loanProgram
   AND    d3.WACLow=d1.pd_WACLow
   AND    d3.servicerNumber=@n_sNumOthers
   AND    d3.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d3.rptYear, d3.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d2.rptYear, d2.rptMonth, 18))=1  
   AND    d3.adjYearMonth=(
      SELECT MAX(adjYearMonth) FROM #poolData
      WHERE  origYear=d1.pd_origYear
      AND    origTerm=d1.pd_origTerm
      AND    loanProgram=d1.pd_loanProgram
      AND    WACLow=d1.pd_WACLow
      AND    servicerNumber=@n_sNumOthers
      AND    rptType=@v_type
      AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(rptYear, rptMonth, 18), 
                      dbo.fn_yearMonthDayToDate(d2.rptYear, d2.rptMonth, 18))=1  
      AND    d2.adjYearMonth-adjYearMonth IN (0, 1, 89) )

   EXEC @n_status=usp_errHandler @@error, 'usp_setCPRothers - Set CPR3'
   IF @n_status<>0 RETURN @n_status

   -- CPR6Month
   UPDATE d1	
   SET    d1.pd_CPR6Month=1-Power((1-d1.pd_SMM)*(1-d2.SMM)*(1-d3.SMM)*(1-d4.SMM)*(1-d5.SMM)*(1-d6.SMM), 2)
   FROM   rpt_poolData d1, #poolData d2, #poolData d3, #poolData d4, #poolData d5, #poolData d6
   WHERE  d1.pd_rptYear=@n_rptYear
   AND    d1.pd_rptMonth=@n_rptMonth  
   AND    d1.pd_WACspread=@n_WACspread
--   AND    d1.pd_WALA>=5.5  
   AND    d1.pd_servicerNUmber=@n_sNumOthers
   AND    d1.pd_rptType=@v_type
   AND    d2.origYear=d1.pd_origYear
   AND    d2.origTerm=d1.pd_origTerm
   AND    d2.loanProgram=d1.pd_loanProgram
   AND    d2.WACLow=d1.pd_WACLow
   AND    d2.servicerNumber=@n_sNumOthers
   AND    d2.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d2.rptYear, d2.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d1.pd_rptYear, d1.pd_rptMonth, 18))=1  
   AND    d2.adjYearMonth=(
      SELECT MAX(adjYearMonth) FROM #poolData
      WHERE  origYear=d1.pd_origYear
      AND    origTerm=d1.pd_origTerm
      AND    loanProgram=d1.pd_loanProgram
      AND    WACLow=d1.pd_WACLow
      AND    servicerNumber=@n_sNumOthers
      AND    rptType=@v_type
      AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(rptYear, rptMonth, 18), 
                      dbo.fn_yearMonthDayToDate(d1.pd_rptYear, d1.pd_rptMonth, 18))=1  
      AND    d1.pd_adjYearMonth-adjYearMonth IN (0, 1, 89) )
   AND    d3.origYear=d1.pd_origYear
   AND    d3.origTerm=d1.pd_origTerm
   AND    d3.loanProgram=d1.pd_loanProgram
   AND    d3.WACLow=d1.pd_WACLow
   AND    d3.servicerNumber=@n_sNumOthers
   AND    d3.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d3.rptYear, d3.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d2.rptYear, d2.rptMonth, 18))=1  
   AND    d3.adjYearMonth=(
      SELECT MAX(adjYearMonth) FROM #poolData
      WHERE  origYear=d1.pd_origYear
      AND    origTerm=d1.pd_origTerm
      AND    loanProgram=d1.pd_loanProgram
      AND    WACLow=d1.pd_WACLow
      AND    servicerNumber=@n_sNumOthers
      AND    rptType=@v_type
      AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(rptYear, rptMonth, 18), 
                      dbo.fn_yearMonthDayToDate(d2.rptYear, d2.rptMonth, 18))=1  
      AND    d2.adjYearMonth-adjYearMonth IN (0, 1, 89) )
   AND    d4.origYear=d1.pd_origYear
   AND    d4.origTerm=d1.pd_origTerm
   AND    d4.loanProgram=d1.pd_loanProgram
   AND    d4.WACLow=d1.pd_WACLow
   AND    d4.servicerNumber=@n_sNumOthers
   AND    d4.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d4.rptYear, d4.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d3.rptYear, d3.rptMonth, 18))=1  
   AND    d4.adjYearMonth=(
      SELECT MAX(adjYearMonth) FROM #poolData
      WHERE  origYear=d1.pd_origYear
      AND    origTerm=d1.pd_origTerm
      AND    loanProgram=d1.pd_loanProgram
      AND    WACLow=d1.pd_WACLow
      AND    servicerNumber=@n_sNumOthers
      AND    rptType=@v_type
      AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(rptYear, rptMonth, 18), 
                      dbo.fn_yearMonthDayToDate(d3.rptYear, d3.rptMonth, 18))=1  
      AND    d3.adjYearMonth-adjYearMonth IN (0, 1, 89) )
   AND    d5.origYear=d1.pd_origYear
   AND    d5.origTerm=d1.pd_origTerm
   AND    d5.loanProgram=d1.pd_loanProgram
   AND    d5.WACLow=d1.pd_WACLow
   AND    d5.servicerNumber=@n_sNumOthers
   AND    d5.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d5.rptYear, d5.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d4.rptYear, d4.rptMonth, 18))=1  
   AND    d5.adjYearMonth=(
      SELECT MAX(adjYearMonth) FROM #poolData
      WHERE  origYear=d1.pd_origYear
      AND    origTerm=d1.pd_origTerm
      AND    loanProgram=d1.pd_loanProgram
      AND    WACLow=d1.pd_WACLow
      AND    servicerNumber=@n_sNumOthers
      AND    rptType=@v_type
      AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(rptYear, rptMonth, 18), 
                      dbo.fn_yearMonthDayToDate(d4.rptYear, d4.rptMonth, 18))=1  
      AND    d4.adjYearMonth-adjYearMonth IN (0, 1, 89) )
   AND    d6.origYear=d1.pd_origYear
   AND    d6.origTerm=d1.pd_origTerm
   AND    d6.loanProgram=d1.pd_loanProgram
   AND    d6.WACLow=d1.pd_WACLow
   AND    d6.servicerNumber=@n_sNumOthers
   AND    d6.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d6.rptYear, d6.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d5.rptYear, d5.rptMonth, 18))=1  
   AND    d6.adjYearMonth=(
      SELECT MAX(adjYearMonth) FROM #poolData
      WHERE  origYear=d1.pd_origYear
      AND    origTerm=d1.pd_origTerm
      AND    loanProgram=d1.pd_loanProgram
      AND    WACLow=d1.pd_WACLow
      AND    servicerNumber=@n_sNumOthers
      AND    rptType=@v_type
      AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(rptYear, rptMonth, 18), 
                      dbo.fn_yearMonthDayToDate(d5.rptYear, d5.rptMonth, 18))=1  
      AND    d5.adjYearMonth-adjYearMonth IN (0, 1, 89) )

   EXEC @n_status=usp_errHandler @@error, 'usp_setCPRothers - Set CPR6'
   IF @n_status<>0 RETURN @n_status

   -- CPR1Year
   UPDATE d1	
   SET    d1.pd_CPR1year=1-(1-d1.pd_SMM)*(1-d2.SMM)*(1-d3.SMM)*(1-d4.SMM)*(1-d5.SMM)*(1-d6.SMM)*
                     (1-d7.SMM)*(1-d8.SMM)*(1-d9.SMM)*(1-d10.SMM)*(1-d11.SMM)*(1-d12.SMM)
   FROM   rpt_poolData d1, #poolData d2, #poolData d3, #poolData d4, #poolData d5, #poolData d6,
          #poolData d7, #poolData d8, #poolData d9, #poolData d10, #poolData d11, #poolData d12
   WHERE  d1.pd_rptYear=@n_rptYear
   AND    d1.pd_rptMonth=@n_rptMonth  
   AND    d1.pd_WACspread=@n_WACspread
--   AND    d1.pd_WALA>=11.5  
   AND    d1.pd_servicerNUmber=@n_sNumOthers
   AND    d1.pd_rptType=@v_type
   AND    d2.origYear=d1.pd_origYear
   AND    d2.origTerm=d1.pd_origTerm
   AND    d2.loanProgram=d1.pd_loanProgram
   AND    d2.WACLow=d1.pd_WACLow
   AND    d2.servicerNumber=@n_sNumOthers
   AND    d2.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d2.rptYear, d2.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d1.pd_rptYear, d1.pd_rptMonth, 18))=1  
   AND    d2.adjYearMonth=(
      SELECT MAX(adjYearMonth) FROM #poolData
      WHERE  origYear=d1.pd_origYear
      AND    origTerm=d1.pd_origTerm
      AND    loanProgram=d1.pd_loanProgram
      AND    WACLow=d1.pd_WACLow
      AND    servicerNumber=@n_sNumOthers
      AND    rptType=@v_type
      AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(rptYear, rptMonth, 18), 
                      dbo.fn_yearMonthDayToDate(d1.pd_rptYear, d1.pd_rptMonth, 18))=1  
      AND    d1.pd_adjYearMonth-adjYearMonth IN (0, 1, 89) )
   AND    d3.origYear=d1.pd_origYear
   AND    d3.origTerm=d1.pd_origTerm
   AND    d3.loanProgram=d1.pd_loanProgram
   AND    d3.WACLow=d1.pd_WACLow
   AND    d3.servicerNumber=@n_sNumOthers
   AND    d3.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d3.rptYear, d3.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d2.rptYear, d2.rptMonth, 18))=1  
   AND    d3.adjYearMonth=(
      SELECT MAX(adjYearMonth) FROM #poolData
      WHERE  origYear=d1.pd_origYear
      AND    origTerm=d1.pd_origTerm
      AND    loanProgram=d1.pd_loanProgram
      AND    WACLow=d1.pd_WACLow
      AND    servicerNumber=@n_sNumOthers
      AND    rptType=@v_type
      AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(rptYear, rptMonth, 18), 
                      dbo.fn_yearMonthDayToDate(d2.rptYear, d2.rptMonth, 18))=1  
      AND    d2.adjYearMonth-adjYearMonth IN (0, 1, 89) )
   AND    d4.origYear=d1.pd_origYear
   AND    d4.origTerm=d1.pd_origTerm
   AND    d4.loanProgram=d1.pd_loanProgram
   AND    d4.WACLow=d1.pd_WACLow
   AND    d4.servicerNumber=@n_sNumOthers
   AND    d4.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d4.rptYear, d4.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d3.rptYear, d3.rptMonth, 18))=1  
   AND    d4.adjYearMonth=(
      SELECT MAX(adjYearMonth) FROM #poolData
      WHERE  origYear=d1.pd_origYear
      AND    origTerm=d1.pd_origTerm
      AND    loanProgram=d1.pd_loanProgram
      AND    WACLow=d1.pd_WACLow
      AND    servicerNumber=@n_sNumOthers
      AND    rptType=@v_type
      AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(rptYear, rptMonth, 18), 
                      dbo.fn_yearMonthDayToDate(d3.rptYear, d3.rptMonth, 18))=1  
      AND    d3.adjYearMonth-adjYearMonth IN (0, 1, 89) )
   AND    d5.origYear=d1.pd_origYear
   AND    d5.origTerm=d1.pd_origTerm
   AND    d5.loanProgram=d1.pd_loanProgram
   AND    d5.WACLow=d1.pd_WACLow
   AND    d5.servicerNumber=@n_sNumOthers
   AND    d5.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d5.rptYear, d5.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d4.rptYear, d4.rptMonth, 18))=1  
   AND    d5.adjYearMonth=(
      SELECT MAX(adjYearMonth) FROM #poolData
      WHERE  origYear=d1.pd_origYear
      AND    origTerm=d1.pd_origTerm
      AND    loanProgram=d1.pd_loanProgram
      AND    WACLow=d1.pd_WACLow
      AND    servicerNumber=@n_sNumOthers
      AND    rptType=@v_type
      AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(rptYear, rptMonth, 18), 
                      dbo.fn_yearMonthDayToDate(d4.rptYear, d4.rptMonth, 18))=1  
      AND    d4.adjYearMonth-adjYearMonth IN (0, 1, 89) )
   AND    d6.origYear=d1.pd_origYear
   AND    d6.origTerm=d1.pd_origTerm
   AND    d6.loanProgram=d1.pd_loanProgram
   AND    d6.WACLow=d1.pd_WACLow
   AND    d6.servicerNumber=@n_sNumOthers
   AND    d6.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d6.rptYear, d6.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d5.rptYear, d5.rptMonth, 18))=1  
   AND    d6.adjYearMonth=(
      SELECT MAX(adjYearMonth) FROM #poolData
      WHERE  origYear=d1.pd_origYear
      AND    origTerm=d1.pd_origTerm
      AND    loanProgram=d1.pd_loanProgram
      AND    WACLow=d1.pd_WACLow
      AND    servicerNumber=@n_sNumOthers
      AND    rptType=@v_type
      AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(rptYear, rptMonth, 18), 
                      dbo.fn_yearMonthDayToDate(d5.rptYear, d5.rptMonth, 18))=1  
      AND    d5.adjYearMonth-adjYearMonth IN (0, 1, 89) )
   AND    d7.origYear=d1.pd_origYear
   AND    d7.origTerm=d1.pd_origTerm
   AND    d7.loanProgram=d1.pd_loanProgram
   AND    d7.WACLow=d1.pd_WACLow
   AND    d7.servicerNumber=@n_sNumOthers
   AND    d7.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d7.rptYear, d7.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d6.rptYear, d6.rptMonth, 18))=1  
   AND    d7.adjYearMonth=(
      SELECT MAX(adjYearMonth) FROM #poolData
      WHERE  origYear=d1.pd_origYear
      AND    origTerm=d1.pd_origTerm
      AND    loanProgram=d1.pd_loanProgram
      AND    WACLow=d1.pd_WACLow
      AND    servicerNumber=@n_sNumOthers
      AND    rptType=@v_type
      AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(rptYear, rptMonth, 18), 
                      dbo.fn_yearMonthDayToDate(d6.rptYear, d6.rptMonth, 18))=1  
      AND    d6.adjYearMonth-adjYearMonth IN (0, 1, 89) )
   AND    d8.origYear=d1.pd_origYear
   AND    d8.origTerm=d1.pd_origTerm
   AND    d8.loanProgram=d1.pd_loanProgram
   AND    d8.WACLow=d1.pd_WACLow
   AND    d8.servicerNumber=@n_sNumOthers
   AND    d8.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d8.rptYear, d8.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d7.rptYear, d7.rptMonth, 18))=1  
   AND    d8.adjYearMonth=(
      SELECT MAX(adjYearMonth) FROM #poolData
      WHERE  origYear=d1.pd_origYear
      AND    origTerm=d1.pd_origTerm
      AND    loanProgram=d1.pd_loanProgram
      AND    WACLow=d1.pd_WACLow
      AND    servicerNumber=@n_sNumOthers
      AND    rptType=@v_type
      AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(rptYear, rptMonth, 18), 
                      dbo.fn_yearMonthDayToDate(d7.rptYear, d7.rptMonth, 18))=1  
      AND    d7.adjYearMonth-adjYearMonth IN (0, 1, 89) )
   AND    d9.origYear=d1.pd_origYear
   AND    d9.origTerm=d1.pd_origTerm
   AND    d9.loanProgram=d1.pd_loanProgram
   AND    d9.WACLow=d1.pd_WACLow
   AND    d9.servicerNumber=@n_sNumOthers
   AND    d9.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d9.rptYear, d9.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d8.rptYear, d8.rptMonth, 18))=1  
   AND    d9.adjYearMonth=(
      SELECT MAX(adjYearMonth) FROM #poolData
      WHERE  origYear=d1.pd_origYear
      AND    origTerm=d1.pd_origTerm
      AND    loanProgram=d1.pd_loanProgram
      AND    WACLow=d1.pd_WACLow
      AND    servicerNumber=@n_sNumOthers
      AND    rptType=@v_type
      AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(rptYear, rptMonth, 18), 
                      dbo.fn_yearMonthDayToDate(d8.rptYear, d8.rptMonth, 18))=1  
      AND    d8.adjYearMonth-adjYearMonth IN (0, 1, 89) )
   AND    d10.origYear=d1.pd_origYear
   AND    d10.origTerm=d1.pd_origTerm
   AND    d10.loanProgram=d1.pd_loanProgram
   AND    d10.WACLow=d1.pd_WACLow
   AND    d10.servicerNumber=@n_sNumOthers
   AND    d10.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d10.rptYear, d10.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d9.rptYear, d9.rptMonth, 18))=1  
   AND    d10.adjYearMonth=(
      SELECT MAX(adjYearMonth) FROM #poolData
      WHERE  origYear=d1.pd_origYear
      AND    origTerm=d1.pd_origTerm
      AND    loanProgram=d1.pd_loanProgram
      AND    WACLow=d1.pd_WACLow
      AND    servicerNumber=@n_sNumOthers
      AND    rptType=@v_type
      AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(rptYear, rptMonth, 18), 
                      dbo.fn_yearMonthDayToDate(d9.rptYear, d9.rptMonth, 18))=1  
      AND    d9.adjYearMonth-adjYearMonth IN (0, 1, 89) )
   AND    d11.origYear=d1.pd_origYear
   AND    d11.origTerm=d1.pd_origTerm
   AND    d11.loanProgram=d1.pd_loanProgram
   AND    d11.WACLow=d1.pd_WACLow
   AND    d11.servicerNumber=@n_sNumOthers
   AND    d11.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d11.rptYear, d11.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d10.rptYear, d10.rptMonth, 18))=1  
   AND    d11.adjYearMonth=(
      SELECT MAX(adjYearMonth) FROM #poolData
      WHERE  origYear=d1.pd_origYear
      AND    origTerm=d1.pd_origTerm
      AND    loanProgram=d1.pd_loanProgram
      AND    WACLow=d1.pd_WACLow
      AND    servicerNumber=@n_sNumOthers
      AND    rptType=@v_type
      AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(rptYear, rptMonth, 18), 
                      dbo.fn_yearMonthDayToDate(d10.rptYear, d10.rptMonth, 18))=1  
      AND    d10.adjYearMonth-adjYearMonth IN (0, 1, 89) )
   AND    d12.origYear=d1.pd_origYear
   AND    d12.origTerm=d1.pd_origTerm
   AND    d12.loanProgram=d1.pd_loanProgram
   AND    d12.WACLow=d1.pd_WACLow
   AND    d12.servicerNumber=@n_sNumOthers
   AND    d12.rptType=@v_type
   AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(d12.rptYear, d12.rptMonth, 18), 
                          dbo.fn_yearMonthDayToDate(d11.rptYear, d11.rptMonth, 18))=1  
   AND    d12.adjYearMonth=(
      SELECT MAX(adjYearMonth) FROM #poolData
      WHERE  origYear=d1.pd_origYear
      AND    origTerm=d1.pd_origTerm
      AND    loanProgram=d1.pd_loanProgram
      AND    WACLow=d1.pd_WACLow
      AND    servicerNumber=@n_sNumOthers
      AND    rptType=@v_type
      AND    DATEDIFF(MONTH, dbo.fn_yearMonthDayToDate(rptYear, rptMonth, 18), 
                      dbo.fn_yearMonthDayToDate(d11.rptYear, d11.rptMonth, 18))=1  
      AND    d11.adjYearMonth-adjYearMonth IN (0, 1, 89) )

   EXEC @n_status=usp_errHandler @@error, 'usp_setCPRothers - Set CPR12'
   IF @n_status<>0 RETURN @n_status
   drop table #poolData
   PRINT 'usp_setCPRothers: ended'






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE dbo.usp_setChgoFactor AS
   UPDATE m
   SET    ms_participationFactor=p.mdl_chicagoParticipation
   FROM   rpt_Master m, uv_MA_DC_loan p
   WHERE  m.ms_loanIDnumber=p.mdl_loanNumber




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE usp_setCurPoolData 
   @v_type CHAR, 
   @n_year SMALLINT=NULL, 
   @n_month SMALLINT=NULL AS
DECLARE 
   @n_WACspread DECIMAL(5,4),
   @n_yearInit SMALLINT, @n_origYear SMALLINT,
   @n_adjYearMonth INT,
   @n_WACmovedBy DECIMAL(5,4)

   INSERT INTO rpt_etlLog (process, logTime,  message) VALUES ('usp_setCurPoolData', getdate(), 
      'Started with: '+@v_type+', '+CAST(@n_year AS VARCHAR)+', '+CAST(@n_month AS VARCHAR))

-- init values
   SET @n_yearInit=(SELECT  refValue FROM rpt_Reference WHERE refCode='STARTYEAR')
   SET @n_WACspread=(SELECT  refValue FROM rpt_Reference WHERE refCode='WACSPREAD')
   SET @n_WACmovedBy=(SELECT  refValue FROM rpt_Reference WHERE refCode='WACMOVEDBY')
   IF (@n_year IS NULL)
   BEGIN
      SELECT @n_year=r1.refValue, @n_month=r2.refValue 
      FROM   rpt_reference r1, rpt_reference r2 
      WHERE  r1.refCode='LATESTYEAR'
      AND    r2.refCode='LATESTMONTH'
   END
   SET @n_adjYearMonth=100*@n_Year + @n_month

   INSERT INTO rpt_poolData (     ----- 20050131 PUT monthlyRPT and forecast together
      pd_rptYear, pd_rptMonth, pd_origYear, pd_origTerm, pd_loanProgram, pd_servicerNumber, pd_WACspread, 
      pd_WACLow,
      pd_WAC,
      pd_poolFactor,
      pd_origBal,
      pd_curBal ,
      pd_prevBal ,
      pd_SMM,
      pd_WALA,
      pd_adjYearMonth, pd_rptType, pd_numLoans, pd_aveLoanSize, pd_aveChgoPart, pd_sumChgoPart)    
   SELECT 
      @n_year, @n_month, origYear, origTerm, loanProgram, sp_servicerNumber, @n_WACspread,
      WACLow,
      WAC, 
      poolFactor, 
      origBal,
      curBal, 
      prevBal ,
      SMM,
      WALA,
      @n_adjYearMonth, @v_type, cnt, curBal/(chgoPart+.00001), 
      aveChgoPart=curBal/(sysCurBal+.00001), 
      sumChgoPart=chgoPart
   FROM   (
      SELECT 
         c.origYear, c.origTerm, c.loanProgram, p1.sp_servicerNumber,
         WACLow=-@n_WACmovedBy+FLOOR(ROUND((@n_WACmovedBy+c.CurWAC)/@n_WACspread, 5))*@n_WACspread,
         WAC=SUM(c.CurWAC*c.pFactor*c.curBal)/(SUM(c.curBal*c.pFactor)+.00001), 
         poolFactor=SUM(c.curBal*c.pFactor)/(SUM(c.OrigBal*c.pFactor)+.00001), 
         origBal=SUM(c.OrigBal*c.pFactor),
         chgoPart=SUM(c.pFactor*c.cnt1),
         curBal=SUM(c.curBal*c.pFactor),
         sysCurBal=SUM(c.curBal),
         prevBal=SUM(c.prevBal*c.pFactor), 
         SMM=SUM(c.prevBal*c.pFactor*c.SMM)/(SUM(c.prevBal*c.pFactor)+.00001),
         WALA=SUM(c.curWALA*c.curBal*c.pFactor)/
            (SUM(c.curBal*c.pFactor)+.00001),
         cnt=SUM(c.cnt1) 
      FROM   rpt_servicerPool p, rpt_servicerPool p1, (
         SELECT 
            a.loanIDnumber, a.origYear, a.origTerm, a.loanProgram, a.participationFactor pFactor,
            a.CurWAC, a.OrigBal, a.curWALA, a.CurBal, 
            PrevBal=ISNULL(b.PreviousBal,0), 
            SMM=ISNULL(b.SMM/100,0), a.servicerNumber,
            cnt1=CASE WHEN (a.curBal*a.participationFactor>0) THEN 1 ELSE 0 END
         FROM   fhlb.dbo.fhlbMaster fm, (
            SELECT m.ms_loanIDnumber loanIDnumber, Year(m.ms_OrigDate) origYear, m.ms_origTerm origTerm, 
               m.ms_curBal curBal, m.ms_participationFactor participationFactor, m.ms_loanProgram loanProgram, 
               m.ms_CurWAC CurWAC, m.ms_OrigBal OrigBal, m.ms_curWALA curWALA, m.ms_servicerNumber servicerNumber
            FROM   rpt_Master m
            WHERE  m.ms_OrigBal> 0
            AND    MONTH(m.ms_OrigDate)<=CASE WHEN (YEAR(m.ms_OrigDate)=@n_year) THEN @n_month ELSE 12 END
         ) AS A LEFT OUTER JOIN (
            SELECT loanIDnumber, PreviousBal, smm
            FROM   AFT.dbo.aftHistory ah
            WHERE  ah.HistYear=@n_year
            AND    ah.histMonth=@n_month
         ) AS B ON a.loanIDnumber=b.loanIDnumber
         WHERE    A.loanIDnumber=fm.loanNumber
      ) AS C
      WHERE  p.sp_rptYear=@n_year
      AND    p.sp_rptMonth=@n_month
      AND    p.sp_rptType=@v_type
      AND    p1.sp_rptYear=@n_year
      AND    p1.sp_rptMonth=@n_month
      AND    p1.sp_poolRank=p.sp_poolRank
      AND    p1.sp_rptType=@v_type
      AND    p1.sp_servicerNumber=(
         SELECT MIN(sp_servicerNumber) FROM rpt_servicerPool 
         WHERE  sp_rptYear=@n_year AND sp_rptMonth=@n_month 
         AND    sp_rptType=@v_type
         AND    sp_poolRank=p1.sp_poolRank)
      AND    p.sp_servicerNumber=c.servicerNumber               
      AND    c.pFactor>0
      GROUP BY c.loanProgram, c.origYear, c.origTerm, p1.sp_servicerNumber, 
         -@n_WACmovedBy+FLOOR(ROUND((@n_WACmovedBy+c.CurWAC)/@n_WACspread, 5))*@n_WACspread
   ) AS T

   EXEC usp_errHandler @@error, 'usp_setCurPoolData - insert into rpt_PoolData'
         
   -- Create MPF records for all periods
   INSERT INTO rpt_poolData (
      pd_rptYear ,
      pd_rptMonth ,
      pd_origYear,
      pd_origTerm,
      pd_loanProgram,
      pd_servicerNumber,
      pd_WACspread, 
      pd_WACLow,
      pd_WAC,
      pd_poolFactor,
      pd_origBal,
      pd_curBal ,
      pd_prevBal ,
      pd_SMM,
      pd_WALA,
      pd_adjYearMonth, pd_rptType, pd_numLoans, 
      pd_aveLoanSize, 
      pd_aveChgoPart,
      pd_sumChgoPart)    
   SELECT  
      pd_rptYear ,
      pd_rptMonth,
      pd_origYear,
      pd_origTerm,
      pd_loanProgram,
      servicerNumber,
      @n_WACspread, 
      pd_WACLow,
      WAC, 
      factor, 
      OrigBal,
      curBal,
      prevBal, 
      SMM,
      WALA,
      @n_adjYearMonth, @v_type, cnt, 
      aveLoanSize=CASE WHEN @v_type<>'S' THEN curBal/(chgoPart+(1-SIGN(chgoPart))) ELSE curBal/(cnt+.00001) END, 
      curBal/(sysCurBal+.00001), 
      chgoPart
   FROM   (
      SELECT  
         p.pd_rptYear, p.pd_rptMonth,
         pd_origYear,
         pd_origTerm,
         pd_loanProgram,
         s.servicerNumber,
         pd_WACLow,
         WAC=CASE WHEN SUM(pd_CurBal)>0 THEN SUM(pd_WAC*pd_CurBal)/(SUM(pd_CurBal)+.00001) ELSE AVG(pd_WAC) END, 
         factor=SUM(pd_CurBal)/SUM(pd_OrigBal), 
         origBal=SUM(pd_OrigBal),
         sysCurBal=SUM(pd_curBal/(pd_aveChgoPart+(1-SIGN(pd_aveChgoPart)))),
         curBal=SUM(pd_CurBal),
         prevBal=SUM(pd_PrevBal), 
         SMM=SUM(pd_PrevBal*pd_SMM)/(SUM(pd_PrevBal)+.00001),
         WALA=CASE WHEN SUM(pd_CurBal)>0 THEN ROUND(SUM(pd_WALA*pd_CurBal)/(SUM(pd_CurBal)+.00001), 0) ELSE ROUND(AVG(pd_WALA),0) END,
         cnt=SUM(pd_numLoans), 
         chgoPart=SUM(pd_sumChgoPart)
      FROM   rpt_poolData p, rpt_servicer s
      WHERE  p.pd_rptType=@v_type
      AND    s.servicerName='MPF'
      AND    p.pd_WACspread=@n_WACspread
      GROUP BY p.pd_rptYear, p.pd_rptMonth, p.pd_origYear, p.pd_origTerm, p.pd_loanProgram, p.pd_WACLow, s.servicerNumber
   ) AS T

   EXEC usp_errHandler @@error, 'usp_setCurPoolData - insert MPF records'

   -- INSERT INTO rpt_etlLog (process, logTime,  message)
   -- VALUES ('usp_setCurPoolData', getdate(), 'Ended')
         



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE usp_setPortfolioFactor AS
   UPDATE m
   SET    ms_participationFactor=ISNULL(p28.pl_chicagoParticipation, 0)
   FROM   rpt_Master m left outer join uv_portfolioLoan p28 on m.ms_loanIDNumber=p28.pl_loanNUmber




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE usp_setStat (
   @v_type VARCHAR(1)='A', 
   @n_year SMALLINT, 
   @n_month SMALLINT,
   @v_setFactor VARchar(5)='Y',
   @v_forecast CHAR(1)='N' )
AS
   DECLARE @n_status INT , @n_err INT, @v_msg varchar(100)

   IF (@v_type='A') 
   BEGIN
      EXEC @n_status=dbo.usp_setStat 'C', @n_year, @n_month, 'Y', @v_forecast
      SET @n_err=@@error
      IF @n_status<>0 RETURN @n_status
      EXEC @n_status=usp_errHandler @n_err, 'usp_setStat A: usp_setStat C'
      IF @n_status<>0 RETURN @n_status

      -- EXEC dbo.usp_setStat 'S', @n_year, @n_month, 'Y', @v_forecast

      EXEC @n_status=dbo.usp_setStat 'P', @n_year, @n_month, 'Y', @v_forecast
      SET @n_err=@@error
      IF @n_status<>0 RETURN @n_status
      EXEC @n_status=usp_errHandler @n_err, 'usp_setStat A: usp_setStat P'
      IF @n_status<>0 RETURN @n_status
      
      RETURN 0
   END
   
   SET @v_msg= 'usp_setStat '+@v_type+' '+CAST(@n_year AS VARCHAR)+' '+
      CAST(@n_month AS VARCHAR)+' '+@v_setFactor
   PRINT @v_msg+' started at:'+CAST(getdate() AS VARCHAR)
   INSERT INTO rpt_etlLog (process, logTime,  message)
   VALUES ('usp_setStat', getdate(), @v_msg+' started.')

   IF (@v_setFactor='Y') BEGIN
      IF (@v_type='S') UPDATE rpt_Master SET ms_participationFactor=1
      ELSE
         IF (@v_type='C') 
         BEGIN
            EXEC usp_setChgoFactor
            EXEC @n_status=usp_errHandler @@error, 'usp_setStat: usp_setChgoFactor'
            IF @n_status<>0 RETURN @n_status
         END
         ELSE 
         BEGIN
            EXEC usp_setPortfoliofactor
            EXEC @n_status=usp_errHandler @@error, 'usp_setStat: usp_setPortfoliofactor'
            IF @n_status<>0 RETURN @n_status
         END
   END
      
   EXEC @n_status=usp_calcPremium @v_type, @n_year, @n_month, 'N'
   SET @n_err=@@error
   IF @n_status<>0 RETURN @n_status
   EXEC @n_status=usp_errHandler @n_err, 'usp_setStat: usp_calcPremium'
   IF @n_status<>0 RETURN @n_status

---- Scores not used this version
--   IF (@v_forecast<>'Y') 
--   BEGIN
--      EXEC @n_status=dbo.usp_setGeoScore @v_type, @n_year, @n_month, 'N'
--      IF (@@ERROR<>0 OR @n_status<>0) RETURN 1
--      EXEC @n_status=dbo.usp_setFICO_LTV @v_type, @n_year, @n_month, 'N'
--      IF (@@ERROR<>0 OR @n_status<>0) RETURN 1   
--   END
   
   PRINT @v_msg+' ended at:'+CAST(getdate() AS VARCHAR)



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE usp_setTop20A 
   @n_year SMALLINT, 
   @n_month SMALLINT
AS
   DECLARE @n_status INT , @n_err INT, @n_WACspread decimal(19, 7), @n_SNumOther INT, @n_SNumMPF INT 
   SET @n_SNumMPF=(SELECT servicerNumber FROM rpt_servicer WHERE servicerName='MPF')
   SET @n_SNumOther=(SELECT servicerNumber FROM rpt_servicer WHERE servicerName='All Others')
   SET @n_WACspread=(SELECT  refValue FROM rpt_Reference WHERE refCode='WACSPREAD')

   -- Assume reportB is finished before running reportA
   DECLARE @n_first SMALLINT, @n_last SMALLINT
   SET @n_first=(SELECT refValue FROM rpt_Reference WHERE refCode='RANKFIRST')
   SET @n_last=(SELECT refValue FROM rpt_Reference WHERE refCode='RANKLAST')

   SELECT IDENTITY (int, 1, 1) AS cRank, * INTO #rpt_chgRank
   FROM  (
      SELECT TOP 40 c.sp_servicerNumber servicerNumber, c.sp_curBal/1000000 cBal 
      FROM   rpt_servicerPool c
      WHERE  c.sp_rptType='C'
      AND    (c.sp_poolRank BETWEEN @n_first AND @n_last OR c.sp_servicerNumber=@n_SNumOther)
      AND    c.sp_rptYear=@n_year AND c.sp_rptMonth=@n_month
      ORDER BY cBal DESC) as A
   EXEC @n_status=usp_errHandler @@error, 'usp_setTop20A - Load #rpt_chgRank'
   IF @n_status<>0 RETURN @n_status

   SELECT IDENTITY (int, 1, 1) as cRank, * into #rpt_sysRank
   FROM  (
      SELECT TOP 40 c.sp_servicerNumber servicerNumber, c.sp_curBal/1000000 cBal 
      FROM   rpt_servicerPool c 
      WHERE  c.sp_rptType='S'
      AND    (c.sp_poolRank BETWEEN @n_first AND @n_last OR c.sp_servicerNumber=@n_SNumOther)
      AND    c.sp_rptYear=@n_year and c.sp_rptMonth=@n_month
      ORDER BY cBal DESC) as A
   EXEC @n_status=usp_errHandler @@error, 'usp_setTop20A - Load #rpt_sysRank'
   IF @n_status<>0 RETURN @n_status

   TRUNCATE TABLE rpt_top20A
   DELETE rpt_top20AHist WHERE tah_rptYearMonth=100*@n_year+@n_month
   
   -- For Chicago
   INSERT INTO rpt_top20AHist (tah_servicerName, tah_cBal, tah_cRank, tah_pctBal, tah_premium, tah_discount, 
      tah_net, tah_pctPD, tah_rptType, tah_rptYearMonth)
   SELECT  m.servicerName, r.cBal, r.cRank, r.cBal/t.tBal as pctBal, m.premium, m.discount, 
      m.net, m.pctPD, 'C' as rptType, 100*@n_year+@n_month AS rptYearMonth
   FROM   #rpt_chgRank r, (SELECT SUM(cBal) tBal FROM #rpt_chgRank) AS t, 
      (
      SELECT mr_servicerNumber servicerNumber, mr_servicerName servicerName, SUM(mr_pdNet)/MAX(ttl.total) AS pctPD,
         SUM(mr_premium) premium, SUM(mr_discount) discount, SUM(mr_pdNet) net
      FROM   rpt_monthlyReport mr, 
         (
         SELECT SUM(mr_pdNet) total from rpt_monthlyReport 
         WHERE  mr_rptType='C'
         AND    mr_WACspread=@n_WACspread
         AND    mr_servicerNumber=@n_SNumMPF
         ) AS ttl
      WHERE  mr_rptType='C'
      AND    mr_servicerNumber NOT IN (1000, 1001, 1002, 1004)
      AND    mr_WACspread=@n_WACspread
      GROUP BY mr_servicerNumber , mr_servicerName
      ) AS M    
   WHERE  m.servicerNumber=r.servicerNumber
   ORDER BY r.cRank
   
   EXEC @n_status=usp_errHandler @@error, 'usp_setTop20A - Load rpt_top20AHist Chicago'
   IF @n_status<>0 RETURN @n_status

   --- for MPF system
   INSERT INTO rpt_top20AHist (tah_servicerName, tah_cBal, tah_cRank, tah_pctBal, tah_premium, tah_discount, 
      tah_net, tah_pctPD, tah_rptType, tah_rptYearMonth)
   SELECT  m.servicerName, 
      r.cBal, r.cRank, r.cBal/t.tBal as pctBal, m.premium, m.discount, m.net, m.pctPD, 'S', 100*@n_year+@n_month
   FROM   #rpt_sysRank r, (SELECT SUM(cBal) tBal FROM #rpt_sysRank) AS t, 
      (
      SELECT mr_servicerNumber servicerNumber, mr_servicerName servicerName, SUM(mr_pdNet)/MAX(ttl.total) AS pctPD,
         SUM(mr_premium) premium, SUM(mr_discount) discount, SUM(mr_pdNet) net
      FROM   rpt_monthlyReport mr, 
         (
         SELECT SUM(mr_pdNet) total from rpt_monthlyReport 
         WHERE  mr_rptType='S'
         AND    mr_WACspread=@n_WACspread
         AND    mr_servicerNumber=@n_SNumMPF
         ) AS ttl
      WHERE  mr_rptType='S'
      AND    mr_servicerNumber NOT IN (1000, 1001, 1002, 1004)
      AND    mr_WACspread=@n_WACspread
      GROUP BY mr_servicerNumber , mr_servicerName
      ) AS M 
   WHERE  m.servicerNumber=r.servicerNumber
   ORDER BY r.cRank

   EXEC @n_status=usp_errHandler @@error, 'usp_setTop20A - Load rpt_top20AHist System'
   IF @n_status<>0 RETURN @n_status

   -- 20040324 update pLnsz 
   UPDATE t
   SET    tah_pLnsz=(
      SELECT SUM(r.mr_prevBal*r.mr_prevLnsz)/SUM(r.mr_prevBal)
      FROM   rpt_monthlyReport r, rpt_servicer s
      WHERE  r.mr_servicerNumber=s.servicerNumber
      AND    s.servicerName=t.tah_servicerName
      AND    r.mr_WACspread=@n_WACspread
      AND    r.mr_rptType=t.tah_rptType)
   FROM   rpt_top20AHist t
   WHERE  tah_rptYearMonth=100*@n_year+@n_month


   -- The final records for the 1st page of the monthly report
   INSERT INTO rpt_top20A ( ta_servicerName, 
      ta_cBal, ta_cRank, ta_pctBal, ta_premium, ta_discount, ta_net, ta_pctPD, ta_rptType, ta_pLnsz)
   SELECT  tah_servicerName, 
      tah_cBal, tah_cRank, tah_pctBal, tah_premium, tah_discount, tah_net, tah_pctPD, tah_rptType, tah_pLnsz
   FROM   rpt_top20AHist
   WHERE  tah_rptYearMonth=100*@n_year+@n_month
   
   EXEC @n_status=usp_errHandler @@error, 'usp_setTop20A - Load rpt_top20A'
   IF @n_status<>0 RETURN @n_status

   



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE usp_setTop20B 
   @n_year SMALLINT, 
   @n_month SMALLINT
AS
   DECLARE @n_status INT , @n_WACspread decimal(19, 7), @n_SNumOther INT, @n_SNumMPF INT 
   SET @n_SNumMPF=(SELECT servicerNumber FROM rpt_servicer WHERE servicerName='MPF')
   SET @n_SNumOther=(SELECT servicerNumber FROM rpt_servicer WHERE servicerName='All Others')
   SET @n_WACspread=(SELECT  refValue FROM rpt_Reference WHERE refCode='WACSPREAD')

   DECLARE @n_rankOther SMALLINT, @n_first SMALLINT, @n_last SMALLINT
   SET @n_first=(SELECT refValue FROM rpt_Reference WHERE refCode='RANKFIRST')
   SET @n_last=(SELECT refValue FROM rpt_Reference WHERE refCode='RANKLAST')

--   if exists (select * from tempdb.dbo.sysobjects where name like '#rpt_chgRank%')
--   drop table [dbo].[#rpt_chgRank]
--   if exists (select * from tempdb.dbo.sysobjects where name like '#rpt_sysRank%')
--   drop table [dbo].[#rpt_sysRank]
--   if exists (select * from tempdb.dbo.sysobjects where name like '#rpt_chgRankB%')
--   drop table [dbo].[#rpt_chgRankB]
--   if exists (select * from tempdb.dbo.sysobjects where name like '#rpt_sysRankB%')
--   drop table [dbo].[#rpt_sysRankB]
--
   TRUNCATE TABLE rpt_top20B
   DELETE rpt_top20BHist WHERE tbh_rptYearMonth=100*@n_year+@n_month
   
   -- create ranking tables
   SELECT IDENTITY (int, 1, 1) AS cRank, * INTO #rpt_chgRank
   FROM  (
      SELECT TOP 40 c.sp_servicerNumber servicerNumber, c.sp_curBal/1000000 cBal 
      FROM   rpt_servicerPool c
      WHERE  c.sp_rptType='C'
      AND    (c.sp_poolRank BETWEEN @n_first AND @n_last OR c.sp_servicerNumber=@n_SNumOther)
      AND    c.sp_rptYear=@n_year AND c.sp_rptMonth=@n_month
      ORDER BY cBal DESC) as A
   EXEC @n_status=usp_errHandler @@error, 'usp_setTop20B - Load #rpt_chgRank'
   IF @n_status<>0 RETURN @n_status

   SELECT IDENTITY (int, 1, 1) as cRank, * into #rpt_sysRank
   FROM  (
      SELECT TOP 40 c.sp_servicerNumber servicerNumber, c.sp_curBal/1000000 cBal 
      FROM   rpt_servicerPool c 
      WHERE  c.sp_rptType='S'
      AND    (c.sp_poolRank BETWEEN @n_first AND @n_last OR c.sp_servicerNumber=@n_SNumOther)
      AND    c.sp_rptYear=@n_year and c.sp_rptMonth=@n_month
      ORDER BY cBal DESC) as A
   EXEC @n_status=usp_errHandler @@error, 'usp_setTop20B - Load #rpt_sysRank'
   IF @n_status<>0 RETURN @n_status

------------------------
   -- ranking tables for version B
   SELECT IDENTITY (int, 1, 1) AS cRank, * INTO #rpt_sysRankB
   FROM  (
      SELECT TOP 200 * FROM (
         SELECT c.sp_servicerNumber servicerNumber, c.sp_curBal/1000000 cBal 
         FROM   rpt_servicerPool c
         WHERE  c.sp_rptType='S'
         AND    c.sp_servicerNumber NOT IN (@n_SNumMPF, @n_SNumOther)
         AND    c.sp_rptYear=@n_year and c.sp_rptMonth=@n_month
         UNION
         SELECT @n_SNumOther AS servicerNumber, sum(c.sp_curBal)/1000000 cBal 
         FROM   rpt_servicerPool c
         WHERE  c.sp_rptType='S'
         AND    c.sp_servicerNumber NOT IN (SELECT servicerNumber FROM #rpt_chgRank) 
         AND    c.sp_servicerNumber<>@n_SNumMPF
         AND    c.sp_rptYear=@n_year AND c.sp_rptMonth=@n_month) AS I
      ORDER BY cBal DESC) AS O
   EXEC @n_status=usp_errHandler @@error, 'usp_setTop20B - Load #rpt_sysRankB'
   IF @n_status<>0 RETURN @n_status

   SELECT IDENTITY (int, 1, 1) AS cRank, * INTO #rpt_chgRankB
   FROM  (
      SELECT TOP 200 * FROM (
         SELECT c.sp_servicerNumber servicerNumber, c.sp_curBal/1000000 cBal 
         FROM   rpt_servicerPool c
         WHERE  c.sp_rptType='C'
         AND    c.sp_servicerNumber NOT IN (@n_SNumMPF, @n_SNumOther)
         AND    c.sp_rptYear=@n_year and c.sp_rptMonth=@n_month
         UNION
         SELECT @n_SNumOther AS servicerNumber, sum(c.sp_curBal)/1000000 cBal 
         FROM   rpt_servicerPool c
         WHERE  c.sp_rptType='C'
         AND    c.sp_servicerNumber NOT IN (SELECT servicerNumber FROM #rpt_sysRank) 
         AND    c.sp_servicerNumber<>@n_SNumMPF
         AND    c.sp_rptYear=@n_year AND c.sp_rptMonth=@n_month) AS I
      ORDER BY cBal DESC) AS O
   EXEC @n_status=usp_errHandler @@error, 'usp_setTop20B - Load #rpt_chgRankB'
   IF @n_status<>0 RETURN @n_status

   -- First Page For Chicago
   INSERT INTO rpt_top20BHist ( tbh_servicerName, tbh_cBalCh, tbh_cRankCh, tbh_pctBalCh, 
      tbh_cBalSys, tbh_cRankSys, tbh_pctBalSys,  tbh_rptType, tbh_rptYearMonth)
   SELECT  s.servicerName, 
      r.cBal, r.cRank, r.cBal/tc.tBal as pctBal, ra.cBal cBalSys, ra.cRank cRankSys, ra.cBal/ts.tBal as pctBalSys, 
      'C' as rptType, 100*@n_year+@n_month AS rptYearMonth
   FROM   rpt_servicer s, (SELECT SUM(cBal) tBal FROM #rpt_chgRank) AS tc, 
      (
      SELECT SUM(cBal) tBal FROM #rpt_sysRankB v1
      WHERE  EXISTS (SELECT 1 FROM #rpt_chgRank WHERE servicerNumber=v1.servicerNumber)
      ) AS ts, #rpt_chgRank AS r 
      LEFT OUTER JOIN #rpt_sysRankB AS ra ON r.servicerNumber=ra.servicerNumber
   WHERE  s.servicerNumber=r.servicerNumber
   ORDER BY r.cRank   

   EXEC @n_status=usp_errHandler @@error, 'usp_setTop20B - Load rpt_top20BHist Chicago'
   IF @n_status<>0 RETURN @n_status
------------------------


   --- First Page for MPF system
   INSERT INTO rpt_top20BHist ( tbh_servicerName, tbh_cBalCh, tbh_cRankCh, tbh_pctBalCh, 
      tbh_cBalSys, tbh_cRankSys, tbh_pctBalSys,  tbh_rptType, tbh_rptYearMonth)
   SELECT  s.servicerName, 
      ra.cBal cBalCh, ra.cRank cRankCh, ra.cBal/ts.tBal as pctBalCh, r.cBal, r.cRank, r.cBal/tc.tBal, 
      'S' as rptType, 100*@n_year+@n_month AS rptYearMonth
   FROM   rpt_servicer s, (SELECT SUM(cBal) tBal FROM #rpt_sysRank) AS tc, 
      (
      SELECT SUM(cBal) tBal FROM #rpt_chgRankB v1
      WHERE  EXISTS (SELECT 1 FROM #rpt_sysRank WHERE servicerNumber=v1.servicerNumber)
      ) AS ts, #rpt_sysRank AS r 
      LEFT OUTER JOIN #rpt_chgRankB AS ra ON r.servicerNumber=ra.servicerNumber
   WHERE  s.servicerNumber=r.servicerNumber
   ORDER BY r.cRank
   EXEC @n_status=usp_errHandler @@error, 'usp_setTop20B - Load rpt_top20BHist MPF'
   IF @n_status<>0 RETURN @n_status

   -- 20040322 update pctCum for rptType='C'
   UPDATE t
   SET    tbh_pctCumCh=(
      SELECT SUM(tbh_pctBalCh) 
      FROM   rpt_top20BHist 
      WHERE  tbh_cRankCh<=t.tbh_cRankCh AND tbh_rptType=t.tbh_rptType AND tbh_rptYearMonth=t.tbh_rptYearMonth),
          tbh_pctCumSys=(
      SELECT SUM(tbh_pctBalSys) 
      FROM   rpt_top20BHist 
      WHERE  tbh_cRankCh<=t.tbh_cRankCh AND tbh_rptType=t.tbh_rptType AND tbh_rptYearMonth=t.tbh_rptYearMonth)
   FROM   rpt_top20BHist t
   WHERE  tbh_rptType='C'
   AND    tbh_rptYearMonth=100*@n_year+@n_month
   EXEC @n_status=usp_errHandler @@error, 'usp_setTop20B - Set rpt_top20BHist.tbh_pctCum C'
   IF @n_status<>0 RETURN @n_status

   -- 20040322 update pctCum for rptType='S'
   UPDATE t
   SET    tbh_pctCumCh=(
      SELECT SUM(tbh_pctBalCh) 
      FROM   rpt_top20BHist 
      WHERE  tbh_cRankSys<=t.tbh_cRankSys AND tbh_rptType=t.tbh_rptType AND tbh_rptYearMonth=t.tbh_rptYearMonth),
          tbh_pctCumSys=(
      SELECT SUM(tbh_pctBalSys) 
      FROM   rpt_top20BHist 
      WHERE  tbh_cRankSys<=t.tbh_cRankSys AND tbh_rptType=t.tbh_rptType AND tbh_rptYearMonth=t.tbh_rptYearMonth)
   FROM   rpt_top20BHist t
   WHERE  tbh_rptType='S'
   AND    tbh_rptYearMonth=100*@n_year+@n_month
   EXEC @n_status=usp_errHandler @@error, 'usp_setTop20B - LSet rpt_top20BHist.tbh_pctCum S'
   IF @n_status<>0 RETURN @n_status

   -- 20040323 update prevLnsz 
   UPDATE t
   SET    tbh_pLnszSys=(
      SELECT SUM(r.mr_prevBal*r.mr_prevLnsz)/SUM(r.mr_prevBal)
      FROM   rpt_monthlyReport r, rpt_servicer s
      WHERE  r.mr_servicerNumber=s.servicerNumber
      AND    s.servicerName=t.tbh_servicerName
      AND    r.mr_WACspread=@n_WACspread
      AND    r.mr_rptType='S')
   FROM   rpt_top20BHist t
   WHERE  tbh_rptYearMonth=100*@n_year+@n_month
   EXEC @n_status=usp_errHandler @@error, 'usp_setTop20B - Load rpt_top20BHist Chicago'
   IF @n_status<>0 RETURN @n_status

   UPDATE t
   SET    tbh_pLnszCh=(
      SELECT SUM(r.mr_prevBal*r.mr_prevLnsz)/SUM(r.mr_prevBal)
      FROM   rpt_monthlyReport r, rpt_servicer s
      WHERE  r.mr_servicerNumber=s.servicerNumber
      AND    s.servicerName=t.tbh_servicerName
      AND    r.mr_WACspread=@n_WACspread
      AND    r.mr_rptType='C')
   FROM   rpt_top20BHist t
   WHERE  tbh_rptYearMonth=100*@n_year+@n_month
   EXEC @n_status=usp_errHandler @@error, 'usp_setTop20B - Load rpt_top20BHist Chicago'
   IF @n_status<>0 RETURN @n_status

   -- The final records for the 1st page of the monthly report
   INSERT INTO rpt_top20B ( tb_servicerName, tb_cBalCh, tb_cRankCh, tb_pctBalCh, tb_cBalSys, tb_cRankSys, 
      tb_pctBalSys, tb_rptType, tb_pctCumCh, tb_pctCumSys, tb_pLnszCh, tb_pLnszSys)
   SELECT  tbh_servicerName, tbh_cBalCh, tbh_cRankCh, tbh_pctBalCh, tbh_cBalSys, tbh_cRankSys, 
      tbh_pctBalSys, tbh_rptType, tbh_pctCumCh, tbh_pctCumSys, tbh_pLnszCh, tbh_pLnszSys
   FROM   rpt_top20BHist
   WHERE  tbh_rptYearMonth=100*@n_year+@n_month
   EXEC @n_status=usp_errHandler @@error, 'usp_setTop20B - Load rpt_top20BHist Chicago'
   IF @n_status<>0 RETURN @n_status
   
   --- update rpt_FHLBtotal
   UPDATE rpt_FHLBtotal
   SET    ft_RptTotalBalC=(SELECT SUM(tb_cBalCH) FROM rpt_top20B WHERE tb_rptType = 'C'),
          ft_RptTotalBalS=(SELECT SUM(tb_cBalSys) FROM rpt_top20B WHERE tb_rptType = 'S') 
   EXEC @n_status=usp_errHandler @@error, 'usp_setTop20B - UPDATE rpt_FHLBtotal'
   IF @n_status<>0 RETURN @n_status
   



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

