SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE adjPoolData (@n_rptYear SMALLINT, @n_rptMonth SMALLINT) AS
DECLARE @d_rptDate DATETIME
   SET @d_rptDate= aft.dbo.fn_yearMonthDayToDate(@n_rptYear, @n_rptMonth, 18)

   USE reports
   GO
   
   -- CPR1Month
   UPDATE PoolData	
   SET    CPR1Month=1-Power((1-SMM), 12)
   WHERE  rptYear=@n_rptYear
   AND    rptMonth=@n_rptMonth       

   -- CPR3Month
   UPDATE d1	
   SET    CPR3Month=1-Power((1-d1.SMM)*(1-d2.SMM)*(1-d3.SMM), 4)
   FROM   servicerPool s1, servicerPool s2, servicerPool s3, PoolData d1, PoolData d2, PoolData d3
   WHERE  s1.rptYear=@n_rptYear
   AND    s1.rptMonth=@n_rptMonth  
   AND    s1.poolRank<23
   AND    d1.rptYear=s1.rptYear
   AND    d1.rptMonth=s1.rptMonth  
   AND    d1.poolRank=s1.poolRank
   AND    s2.servicerNumber=s1.servicerNumber
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(s2.rptYear, s2.rptMonth, 18), @d_rptDate)=1
   AND    s2.poolRank<23
   AND    d2.poolRank=s2.poolRank
   AND    d2.rptYear=s2.rptYear
   AND    d2.rptMonth=s2.rptMonth
   AND    d2.origYear=d1.origYear
   AND    d2.origTerm=d1.origTerm
   AND    d2.loanProgram=d1.loanProgram
   AND    d2.WACLow=d1.WACLow
   AND    s3.servicerNumber=s1.servicerNumber
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(s3.rptYear, s3.rptMonth, 18), @d_rptDate)=2
   AND    s3.poolRank<23
   AND    d3.poolRank=s3.poolRank
   AND    d3.rptYear=s3.rptYear
   AND    d3.rptMonth=s3.rptMonth
   AND    d3.origYear=d1.origYear
   AND    d3.origTerm=d1.origTerm
   AND    d3.loanProgram=d1.loanProgram
   AND    d3.WACLow=d1.WACLow
       
   UPDATE d1	
   SET    CPR3Month=1-Power((1-d1.SMM)*(1-d2.SMM)*(1-d3.SMM), 4)
   FROM   PoolData d1, PoolData d2, PoolData d3
   WHERE  d1.rptYear=@n_rptYear
   AND    d1.rptMonth=@n_rptMonth  
   AND    d1.poolRank=23
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(d2.rptYear, d2.rptMonth, 18), @d_rptDate)=1
   AND    d2.poolRank=d1.poolRank
   AND    d2.origYear=d1.origYear
   AND    d2.origTerm=d1.origTerm
   AND    d2.loanProgram=d1.loanProgram
   AND    d2.WACLow=d1.WACLow
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(d3.rptYear, d3.rptMonth, 18), @d_rptDate)=2
   AND    d3.poolRank=d1.poolRank
   AND    d3.origYear=d1.origYear
   AND    d3.origTerm=d1.origTerm
   AND    d3.loanProgram=d1.loanProgram
   AND    d3.WACLow=d1.WACLow
       

   -- CPR6Month
   UPDATE d1	
   SET    CPR6Month=1-Power((1-d1.SMM)*(1-d2.SMM)*(1-d3.SMM)*(1-d4.SMM)*(1-d5.SMM)*(1-d6.SMM), 2)
   FROM   servicerPool s1, servicerPool s2, servicerPool s3, servicerPool s4, servicerPool s5, servicerPool s6,
          PoolData d1, PoolData d2, PoolData d3, PoolData d4, PoolData d5, PoolData d6
   WHERE  s1.rptYear=@n_rptYear
   AND    s1.rptMonth=@n_rptMonth  
   AND    s1.poolRank<23
   AND    d1.rptYear=s1.rptYear
   AND    d1.rptMonth=s1.rptMonth  
   AND    d1.poolRank=s1.poolRank
   AND    s2.servicerNumber=s1.servicerNumber
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(s2.rptYear, s2.rptMonth, 18), @d_rptDate)=1
   AND    s2.poolRank<23
   AND    d2.poolRank=s2.poolRank
   AND    d2.rptYear=s2.rptYear
   AND    d2.rptMonth=s2.rptMonth
   AND    d2.origYear=d1.origYear
   AND    d2.origTerm=d1.origTerm
   AND    d2.loanProgram=d1.loanProgram
   AND    d2.WACLow=d1.WACLow
   AND    s3.servicerNumber=s1.servicerNumber
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(s3.rptYear, s3.rptMonth, 18), @d_rptDate)=2
   AND    s3.poolRank<23
   AND    d3.poolRank=s3.poolRank
   AND    d3.rptYear=s3.rptYear
   AND    d3.rptMonth=s3.rptMonth
   AND    d3.origYear=d1.origYear
   AND    d3.origTerm=d1.origTerm
   AND    d3.loanProgram=d1.loanProgram
   AND    d3.WACLow=d1.WACLow       
   AND    s4.servicerNumber=s1.servicerNumber
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(s4.rptYear, s4.rptMonth, 18), @d_rptDate)=3
   AND    s4.poolRank<23
   AND    d4.poolRank=s4.poolRank
   AND    d4.rptYear=s4.rptYear
   AND    d4.rptMonth=s4.rptMonth
   AND    d4.origYear=d1.origYear
   AND    d4.origTerm=d1.origTerm
   AND    d4.loanProgram=d1.loanProgram
   AND    d4.WACLow=d1.WACLow
   AND    s5.servicerNumber=s1.servicerNumber
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(s5.rptYear, s5.rptMonth, 18), @d_rptDate)=4
   AND    s5.poolRank<23
   AND    d5.poolRank=s5.poolRank
   AND    d5.rptYear=s5.rptYear
   AND    d5.rptMonth=s5.rptMonth
   AND    d5.origYear=d1.origYear
   AND    d5.origTerm=d1.origTerm
   AND    d5.loanProgram=d1.loanProgram
   AND    d5.WACLow=d1.WACLow
   AND    s6.servicerNumber=s1.servicerNumber
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(s6.rptYear, s6.rptMonth, 18), @d_rptDate)=5
   AND    s6.poolRank<23
   AND    d6.poolRank=s6.poolRank
   AND    d6.rptYear=s6.rptYear
   AND    d6.rptMonth=s6.rptMonth
   AND    d6.origYear=d1.origYear
   AND    d6.origTerm=d1.origTerm
   AND    d6.loanProgram=d1.loanProgram
   AND    d6.WACLow=d1.WACLow

   UPDATE d1	
   SET    CPR6Month=1-Power((1-d1.SMM)*(1-d2.SMM)*(1-d3.SMM)*(1-d4.SMM)*(1-d5.SMM)*(1-d6.SMM), 2)
   FROM   PoolData d1, PoolData d2, PoolData d3, PoolData d4, PoolData d5, PoolData d6
   WHERE  d1.rptYear=@n_rptYear
   AND    d1.rptMonth=@n_rptMonth  
   AND    d1.poolRank=23
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(d2.rptYear, d2.rptMonth, 18), @d_rptDate)=1
   AND    d2.poolRank=d1.poolRank
   AND    d2.origYear=d1.origYear
   AND    d2.origTerm=d1.origTerm
   AND    d2.loanProgram=d1.loanProgram
   AND    d2.WACLow=d1.WACLow
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(d3.rptYear, d3.rptMonth, 18), @d_rptDate)=2
   AND    d3.poolRank=d1.poolRank
   AND    d3.origYear=d1.origYear
   AND    d3.origTerm=d1.origTerm
   AND    d3.loanProgram=d1.loanProgram
   AND    d3.WACLow=d1.WACLow
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(d4.rptYear, d4.rptMonth, 18), @d_rptDate)=3
   AND    d4.poolRank=d1.poolRank
   AND    d4.origYear=d1.origYear
   AND    d4.origTerm=d1.origTerm
   AND    d4.loanProgram=d1.loanProgram
   AND    d4.WACLow=d1.WACLow
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(d5.rptYear, d5.rptMonth, 18), @d_rptDate)=4
   AND    d5.poolRank=d1.poolRank
   AND    d5.origYear=d1.origYear
   AND    d5.origTerm=d1.origTerm
   AND    d5.loanProgram=d1.loanProgram
   AND    d5.WACLow=d1.WACLow
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(d6.rptYear, d6.rptMonth, 18), @d_rptDate)=5
   AND    d6.poolRank=d1.poolRank
   AND    d6.origYear=d1.origYear
   AND    d6.origTerm=d1.origTerm
   AND    d6.loanProgram=d1.loanProgram
   AND    d6.WACLow=d1.WACLow

   -- CPR1Year
   UPDATE d1	
   SET    CPR1year=1-(1-d1.SMM)*(1-d2.SMM)*(1-d3.SMM)*(1-d4.SMM)*(1-d5.SMM)*(1-d6.SMM)*
                     (1-d7.SMM)*(1-d8.SMM)*(1-d9.SMM)*(1-d10.SMM)*(1-d11.SMM)*(1-d12.SMM)
   FROM   servicerPool s1, servicerPool s2, servicerPool s3, servicerPool s4, servicerPool s5, servicerPool s6,
          servicerPool s7, servicerPool s8, servicerPool s9, servicerPool s10, servicerPool s11, servicerPool s12,
          PoolData d1, PoolData d2, PoolData d3, PoolData d4, PoolData d5, PoolData d6
          PoolData d7, PoolData d8, PoolData d9, PoolData d10, PoolData d11, PoolData d12
   WHERE  s1.rptYear=@n_rptYear
   AND    s1.rptMonth=@n_rptMonth  
   AND    s1.poolRank<23
   AND    d1.rptYear=s1.rptYear
   AND    d1.rptMonth=s1.rptMonth  
   AND    d1.poolRank=s1.poolRank
   AND    s2.servicerNumber=s1.servicerNumber
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(s2.rptYear, s2.rptMonth, 18), @d_rptDate)=1
   AND    s2.poolRank<23
   AND    d2.poolRank=s2.poolRank
   AND    d2.rptYear=s2.rptYear
   AND    d2.rptMonth=s2.rptMonth
   AND    d2.origYear=d1.origYear
   AND    d2.origTerm=d1.origTerm
   AND    d2.loanProgram=d1.loanProgram
   AND    d2.WACLow=d1.WACLow
   AND    s3.servicerNumber=s1.servicerNumber
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(s3.rptYear, s3.rptMonth, 18), @d_rptDate)=2
   AND    s3.poolRank<23
   AND    d3.poolRank=s3.poolRank
   AND    d3.rptYear=s3.rptYear
   AND    d3.rptMonth=s3.rptMonth
   AND    d3.origYear=d1.origYear
   AND    d3.origTerm=d1.origTerm
   AND    d3.loanProgram=d1.loanProgram
   AND    d3.WACLow=d1.WACLow       
   AND    s4.servicerNumber=s1.servicerNumber
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(s4.rptYear, s4.rptMonth, 18), @d_rptDate)=3
   AND    s4.poolRank<23
   AND    d4.poolRank=s4.poolRank
   AND    d4.rptYear=s4.rptYear
   AND    d4.rptMonth=s4.rptMonth
   AND    d4.origYear=d1.origYear
   AND    d4.origTerm=d1.origTerm
   AND    d4.loanProgram=d1.loanProgram
   AND    d4.WACLow=d1.WACLow
   AND    s5.servicerNumber=s1.servicerNumber
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(s5.rptYear, s5.rptMonth, 18), @d_rptDate)=4
   AND    s5.poolRank<23
   AND    d5.poolRank=s5.poolRank
   AND    d5.rptYear=s5.rptYear
   AND    d5.rptMonth=s5.rptMonth
   AND    d5.origYear=d1.origYear
   AND    d5.origTerm=d1.origTerm
   AND    d5.loanProgram=d1.loanProgram
   AND    d5.WACLow=d1.WACLow
   AND    s6.servicerNumber=s1.servicerNumber
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(s6.rptYear, s6.rptMonth, 18), @d_rptDate)=5
   AND    s6.poolRank<23
   AND    d6.poolRank=s6.poolRank
   AND    d6.rptYear=s6.rptYear
   AND    d6.rptMonth=s6.rptMonth
   AND    d6.origYear=d1.origYear
   AND    d6.origTerm=d1.origTerm
   AND    d6.loanProgram=d1.loanProgram
   AND    d6.WACLow=d1.WACLow
   AND    s7.servicerNumber=s1.servicerNumber
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(s7.rptYear, s7.rptMonth, 18), @d_rptDate)=6
   AND    s7.poolRank<23
   AND    d7.poolRank=s7.poolRank
   AND    d7.rptYear=s7.rptYear
   AND    d7.rptMonth=s7.rptMonth
   AND    d7.origYear=d1.origYear
   AND    d7.origTerm=d1.origTerm
   AND    d7.loanProgram=d1.loanProgram
   AND    d7.WACLow=d1.WACLow
   AND    s8.servicerNumber=s1.servicerNumber
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(s8.rptYear, s8.rptMonth, 18), @d_rptDate)=7
   AND    s8.poolRank<23
   AND    d8.poolRank=s8.poolRank
   AND    d8.rptYear=s8.rptYear
   AND    d8.rptMonth=s8.rptMonth
   AND    d8.origYear=d1.origYear
   AND    d8.origTerm=d1.origTerm
   AND    d8.loanProgram=d1.loanProgram
   AND    d8.WACLow=d1.WACLow
   AND    s9.servicerNumber=s1.servicerNumber
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(s9.rptYear, s9.rptMonth, 18), @d_rptDate)=8
   AND    s9.poolRank<23
   AND    d9.poolRank=s9.poolRank
   AND    d9.rptYear=s9.rptYear
   AND    d9.rptMonth=s9.rptMonth
   AND    d9.origYear=d1.origYear
   AND    d9.origTerm=d1.origTerm
   AND    d9.loanProgram=d1.loanProgram
   AND    d9.WACLow=d1.WACLow
   AND    s10.servicerNumber=s1.servicerNumber
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(s10.rptYear, s10.rptMonth, 18), @d_rptDate)=9
   AND    s10.poolRank<23
   AND    d10.poolRank=s10.poolRank
   AND    d10.rptYear=s10.rptYear
   AND    d10.rptMonth=s10.rptMonth
   AND    d10.origYear=d1.origYear
   AND    d10.origTerm=d1.origTerm
   AND    d10.loanProgram=d1.loanProgram
   AND    d10.WACLow=d1.WACLow
   AND    s11.servicerNumber=s1.servicerNumber
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(s11.rptYear, s11.rptMonth, 18), @d_rptDate)=10
   AND    s11.poolRank<23
   AND    d11.poolRank=s11.poolRank
   AND    d11.rptYear=s11.rptYear
   AND    d11.rptMonth=s11.rptMonth
   AND    d11.origYear=d1.origYear
   AND    d11.origTerm=d1.origTerm
   AND    d11.loanProgram=d1.loanProgram
   AND    d11.WACLow=d1.WACLow
   AND    s12.servicerNumber=s1.servicerNumber
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(s12.rptYear, s12.rptMonth, 18), @d_rptDate)=11
   AND    s12.poolRank<23
   AND    d12.poolRank=s12.poolRank
   AND    d12.rptYear=s12.rptYear
   AND    d12.rptMonth=s12.rptMonth
   AND    d12.origYear=d1.origYear
   AND    d12.origTerm=d1.origTerm
   AND    d12.loanProgram=d1.loanProgram
   AND    d12.WACLow=d1.WACLow

   UPDATE d1	
   SET    CPR1year=1-(1-d1.SMM)*(1-d2.SMM)*(1-d3.SMM)*(1-d4.SMM)*(1-d5.SMM)*(1-d6.SMM)*
                     (1-d7.SMM)*(1-d8.SMM)*(1-d9.SMM)*(1-d10.SMM)*(1-d11.SMM)*(1-d12.SMM)
   FROM   PoolData d1, PoolData d2, PoolData d3, PoolData d4, PoolData d5, PoolData d6,
          PoolData d7, PoolData d8, PoolData d9, PoolData d10, PoolData d11, PoolData d12
   WHERE  d1.rptYear=@n_rptYear
   AND    d1.rptMonth=@n_rptMonth  
   AND    d1.poolRank=23
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(d2.rptYear, d2.rptMonth, 18), @d_rptDate)=1
   AND    d2.poolRank=d1.poolRank
   AND    d2.origYear=d1.origYear
   AND    d2.origTerm=d1.origTerm
   AND    d2.loanProgram=d1.loanProgram
   AND    d2.WACLow=d1.WACLow
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(d3.rptYear, d3.rptMonth, 18), @d_rptDate)=2
   AND    d3.poolRank=d1.poolRank
   AND    d3.origYear=d1.origYear
   AND    d3.origTerm=d1.origTerm
   AND    d3.loanProgram=d1.loanProgram
   AND    d3.WACLow=d1.WACLow
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(d4.rptYear, d4.rptMonth, 18), @d_rptDate)=3
   AND    d4.poolRank=d1.poolRank
   AND    d4.origYear=d1.origYear
   AND    d4.origTerm=d1.origTerm
   AND    d4.loanProgram=d1.loanProgram
   AND    d4.WACLow=d1.WACLow
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(d5.rptYear, d5.rptMonth, 18), @d_rptDate)=4
   AND    d5.poolRank=d1.poolRank
   AND    d5.origYear=d1.origYear
   AND    d5.origTerm=d1.origTerm
   AND    d5.loanProgram=d1.loanProgram
   AND    d5.WACLow=d1.WACLow
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(d6.rptYear, d6.rptMonth, 18), @d_rptDate)=5
   AND    d6.poolRank=d1.poolRank
   AND    d6.origYear=d1.origYear
   AND    d6.origTerm=d1.origTerm
   AND    d6.loanProgram=d1.loanProgram
   AND    d6.WACLow=d1.WACLow
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(d7.rptYear, d7.rptMonth, 18), @d_rptDate)=6
   AND    d7.poolRank=d1.poolRank
   AND    d7.origYear=d1.origYear
   AND    d7.origTerm=d1.origTerm
   AND    d7.loanProgram=d1.loanProgram
   AND    d7.WACLow=d1.WACLow
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(d8.rptYear, d8.rptMonth, 18), @d_rptDate)=7
   AND    d8.poolRank=d1.poolRank
   AND    d8.origYear=d1.origYear
   AND    d8.origTerm=d1.origTerm
   AND    d8.loanProgram=d1.loanProgram
   AND    d8.WACLow=d1.WACLow
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(d9.rptYear, d9.rptMonth, 18), @d_rptDate)=8
   AND    d9.poolRank=d1.poolRank
   AND    d9.origYear=d1.origYear
   AND    d9.origTerm=d1.origTerm
   AND    d9.loanProgram=d1.loanProgram
   AND    d9.WACLow=d1.WACLow
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(d10.rptYear, d10.rptMonth, 18), @d_rptDate)=9
   AND    d10.poolRank=d1.poolRank
   AND    d10.origYear=d1.origYear
   AND    d10.origTerm=d1.origTerm
   AND    d10.loanProgram=d1.loanProgram
   AND    d10.WACLow=d1.WACLow
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(d11.rptYear, d11.rptMonth, 18), @d_rptDate)=10
   AND    d11.poolRank=d1.poolRank
   AND    d11.origYear=d1.origYear
   AND    d11.origTerm=d1.origTerm
   AND    d11.loanProgram=d1.loanProgram
   AND    d11.WACLow=d1.WACLow
   AND    DATEDIFF(MONTH, aft.dbo.fn_yearMonthDayToDate(d12.rptYear, d12.rptMonth, 18), @d_rptDate)=11
   AND    d12.poolRank=d1.poolRank
   AND    d12.origYear=d1.origYear
   AND    d12.origTerm=d1.origTerm
   AND    d12.loanProgram=d1.loanProgram
   AND    d12.WACLow=d1.WACLow

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

