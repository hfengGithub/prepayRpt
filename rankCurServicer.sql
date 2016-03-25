SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


-- The procedure will ranks the top @n_top servicer according to the AFTMaster.curBal
-- and assign @n_top+1 to the others
ALTER   PROCEDURE rankCurServicer AS
   DECLARE @n_servicerNumber SMALLINT, @n_curBal float, @d_curPeriod DATETIME
   DECLARE @n_year SMALLINT, @n_month SMALLINT, @n_rank SMALLINT, @n_top SMALLINT 
   DECLARE c_servicer CURSOR FOR
      SELECT l.servicerNumber, SUM(curBal) bal
      FROM   aft.dbo.aftMaster m, fhlb.dbo.fhlbServicerLookup l
      WHERE  m.servicer=l.servicerName
      GROUP BY l.servicerNumber
      ORDER BY bal DESC
   SET @n_year=YEAR(getdate())
   SET @n_month=MONTH(getdate())

   INSERT INTO servicerPool (rptYear, rptMonth, poolRank, servicerNumber) 
   SELECT @n_year, @n_month, 1, servicerNumber
   FROM   servicer
   WHERE  servicerName='MPF'
   
   INSERT INTO servicerPool (rptYear, rptMonth, poolRank, servicerNumber) 
   SELECT @n_year, @n_month, 2, servicerNumber
   FROM   servicer
   WHERE  servicerName='FNMA (JPM)'
   
   SET @n_rank=2
   SET @n_top=22
   
   OPEN c_servicer
   FETCH NEXT FROM c_servicer INTO @n_servicerNumber, @n_curBal
   
   WHILE (@@FETCH_STATUS <> -1)
   BEGIN
      IF ( @n_rank<=@n_top ) 
         SET @n_rank = @n_rank + 1
      INSERT INTO servicerPool (
         rptYear,
         rptMonth,
         poolRank,
         servicerNumber) 
      VALUES (@n_year, @n_month, @n_rank, @n_servicerNumber)
      FETCH NEXT FROM c_servicer INTO @n_servicerNumber, @n_curBal
   END
   CLOSE c_servicer
   DEALLOCATE c_servicer

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

