SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

USE reports
GO

-- INSERT INTO servicer
-- SELECT *  
-- FROM   fhlb.dbo.fhlbServicerLookup
-- 
-- UPDATE servicer
-- SET    servicerName=servicerName+'.'
-- WHERE  servicerNumber IN (4178, 4455)
-- 
-- INSERT INTO servicer VALUES(1000, 'MPF')
-- INSERT INTO servicer VALUES(1001, 'FNMA (JPM)')
  
-- The procedure will ranks the top @n_top servicer according to the curBal
-- and assign @n_top+1 to the others
ALTER   PROCEDURE rankServicer (@n_year INT, @n_month INT) AS
DECLARE @n_servicerNumber INT, @n_curBal float, @n_rank INT, @n_top INT, @d_curPeriod DATETIME

DECLARE c_servicer CURSOR FOR
   SELECT l.servicerNumber, SUM(currentBal) bal
   FROM   aft.dbo.aftMaster m, aft.dbo.aftHistory h, fhlb.dbo.fhlbServicerLookup l
   WHERE  m.servicer=l.servicerName
   AND    h.histMonth=@n_month
   AND    h.histYear=@n_year
   AND    h.loanIDNumber=m.loanIdNUmber
   GROUP BY l.servicerNumber
   ORDER BY bal DESC

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

