SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


ALTER PROCEDURE setPoolData(@n_year SMALLINT, @n_month SMALLINT) AS
DECLARE 
   @v_loanProgram VARCHAR(30),
   @n_WACLow REAL,
   @n_WACSpan REAL,
   @n_WACTop REAL,
   @n_WACinit REAL,
   @n_WAC REAL,
   @n_poolFactor REAL,
   @n_origBal FLOAT,
   @n_curBal FLOAT,
   @n_prevBal FLOAT,
   @n_SMM REAL,
   @n_WALA REAL,
   @n_rank SMALLINT, @n_poolRank SMALLINT, @n_tmp SMALLINT,
   @n_yearInit SMALLINT, @n_origYear SMALLINT,
   @n_loanTerm SMALLINT

DECLARE c_loanProgram CURSOR FOR
   SELECT DISTINCT loanProgram  
   FROM   aft.dbo.AFTMaster
   WHERE  loanProgram IS NOT NULL

DECLARE c_loanTerm CURSOR STATIC FOR
   SELECT DISTINCT origTerm
   FROM   aft.dbo.aftMaster
   WHERE  origTerm>=180

DECLARE c_rank CURSOR FOR 
   SELECT  
      poolRank,
      WAC,
      poolFactor,
      origBal,
      curBal ,
      prevBal ,
      SMM,
      WALA
   FROM   reports.dbo.tempPoolData
   ORDER BY curBal DESC

-- init values
   SET @n_yearInit=2001
------   SET @n_yearInit=2002
   SET @n_WACinit=3.5
------   SET @n_WACinit=5.875
   SET @n_WACTop=11.0
------   SET @n_WACTop=6.0
   SET @n_WACSpan=.12499

   -- loanProgram LOOP
   OPEN c_loanProgram	
   FETCH NEXT FROM c_loanProgram INTO @v_loanProgram
   WHILE (@@FETCH_STATUS <> -1)
   BEGIN
      PRINT 'LoanProgram: '+@v_loanProgram
      -- origYear LOOP
      SET @n_origYear=@n_yearInit
      WHILE (@n_origYear<@n_year)
      BEGIN
         PRINT '   origYear: '+ CAST(@n_origYear AS VARCHAR)
         -- loanTerm LOOP
         OPEN c_loanTerm	
         FETCH NEXT FROM c_loanTerm INTO @n_loanTerm
         WHILE (@@FETCH_STATUS <> -1)
         BEGIN
            PRINT '      loanTerm: '+ CAST(@n_loanTerm AS VARCHAR)
            -- WACLow LOOP
            SET @n_WACLow=@n_WACinit
            WHILE (@n_WACLow<@n_WACTop)
            BEGIN
               PRINT '         WACLow: '+ CAST(@n_WACLow AS VARCHAR)
               TRUNCATE TABLE reports.dbo.tempPoolData
               INSERT INTO reports.dbo.tempPoolData (
                  poolRank,
                  WAC,
                  poolFactor,
                  origBal,
                  curBal ,
                  prevBal ,
                  SMM,
                  WALA)
               SELECT 
                  p.poolRank,
                  WAC=SUM(ISNULL(ah.grossCoupon*ah.currentBal,0))/(SUM(ISNULL(ah.currentBal,0))+.0001), 
                  SUM(ISNULL(ah.currentBal,0)) /(SUM(m.OrigBal)+.0001), 
                  SUM(m.OrigBal),
                  curBal=SUM(ISNULL(ah.currentBal,0)),
                  prevBal=SUM(ISNULL(ah.PreviousBal,0)), 
                  SMM=SUM(ISNULL(ah.PreviousBal*ah.SMM/100,0))/
                      (SUM(ISNULL(ah.PreviousBal,0))+.000001),
                  WALA=ROUND(SUM(ISNULL(ah.WALA*ah.PreviousBal,0))/
                             (SUM(ISNULL(ah.PreviousBal,0))+.000001), 0)
               FROM   reports.dbo.servicerPool p, reports.dbo.servicer s, AFT.dbo.AFTMaster m, AFT.dbo.aftHistory ah  
               WHERE  p.rptYear=@n_year
               AND    p.rptMonth=@n_month
               AND    p.servicerNumber=s.servicerNumber               
               AND    s.servicerName=m.servicer   -- Since m.servicerNumber changed
               AND    m.OrigBal> 0
               AND    m.OrigTerm = @n_loanTerm 
               AND    m.LoanProgram = @v_loanProgram 
               AND    Year(m.OrigDate) = @n_origYear
               AND    MONTH(m.OrigDate)<=CASE WHEN (@n_origYear=@n_year) THEN @n_month ELSE 12 END
               AND    m.loanIDnumber=ah.loanIDnumber
               AND    ah.HistYear=@n_year
               AND    ah.histMonth=@n_month
               AND    ah.grossCoupon BETWEEN @n_WACLow AND @n_WACLow+@n_WACSpan
               GROUP BY p.poolRank
               
               -- rank LOOP
               SET @n_rank=100
               OPEN c_rank
               FETCH NEXT FROM c_rank INTO
                  @n_poolRank, @n_WAC, @n_poolFactor, @n_origBal,
                  @n_curBal, @n_prevBal, @n_SMM, @n_WALA
               WHILE (@@FETCH_STATUS<>-1)
               BEGIN
                  SET @n_rank=@n_rank+1
                  INSERT INTO reports.dbo.poolData (
                     rptYear ,
                     rptMonth ,
                     origYear,
                     origTerm,
                     loanProgram,
                     poolRank,
                     showRank,
                     WACLow,
                     WAC,
                     poolFactor,
                     origBal,
                     curBal ,
                     prevBal ,
                     SMM,
                     WALA)
                  VALUES (@n_year, @n_month,
                     @n_origYear,
                     @n_loanTerm,
                     @v_loanProgram,
                     @n_poolRank,
                     CASE WHEN @n_poolRank=23 THEN 2*@n_rank ELSE @n_rank END,
                     @n_WACLow,
                     @n_WAC, @n_poolFactor, @n_origBal,
                     @n_curBal, @n_prevBal, @n_SMM, @n_WALA)
               
                  FETCH NEXT FROM c_rank INTO
                     @n_poolRank, @n_WAC, @n_poolFactor, @n_origBal,
                     @n_curBal, @n_prevBal, @n_SMM, @n_WALA
               END                 -- rank LOOP
               
               CLOSE c_rank
               SET @n_WACLow=ROUND(@n_WACLow+@n_WACSpan, 3)
            END          -- WACLow LOOP
            FETCH NEXT FROM c_loanTerm INTO @n_loanTerm
         END                    -- loanTerm LOOP
         
         CLOSE c_loanTerm
         SET @n_origYear=@n_origYear+1
      END                    -- origYear LOOP

      FETCH NEXT FROM c_loanProgram INTO @v_loanProgram
   END                       -- loanProgram LOOP

   CLOSE c_loanProgram
   DEALLOCATE c_rank
   DEALLOCATE c_loanTerm
   DEALLOCATE c_loanProgram




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

