SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


ALTER  PROCEDURE usp_ConvertFHLBData
AS
BEGIN	
	
	DECLARE @intNextMasterObjectId INTEGER
	DECLARE @intNextHistoryObjectId INTEGER

	SET @intNextMasterObjectId = ( SELECT NextObjectId FROM AFT.dbo.AFTObjectCounters WHERE ClassName = 'AFTMaster' )
	SET @intNextHistoryObjectId = ( SELECT NextObjectId FROM AFT.dbo.AFTObjectCounters WHERE ClassName = 'AFTHistory' )
	
	DECLARE @intMasterClassId INT
	
	SELECT @intMasterClassId = ClassId
		FROM AFT.dbo.AFTObjectCounters
		WHERE ClassName = 'AFTMaster'
	
	DECLARE @intHistoryClassId INT
			
	SELECT @intHistoryClassId = ClassId
		FROM AFT.dbo.AFTObjectCounters
		WHERE ClassName = 'AFTHistory'
			
	DECLARE @intMaxLoanNumber INT,
			@intCurrentLoanNumber INT,
			@intLoanNumberIncrement INT

	DECLARE @fltNegligibleBalance FLOAT
	SELECT @fltNegligibleBalance = 0.0001
	
	-- These tables might have other necessary data that should not be deleted.
	-- The delete where Agency='FHLB' could be done here; but we figured it should
	-- be a separate action in the Convert FHLB to AFT package since such a large
	-- delete might cause require the log to be truncated and if the error occured
	-- in a different action it is more easily identifiable.
	-- TRUNCATE TABLE AFT.dbo.AFTMaster
	-- TRUNCATE TABLE AFT.dbo.AFTHistory
	
	SELECT @intCurrentLoanNumber = 0
	SELECT @intLoanNumberIncrement = 1000
	
	SELECT @intMaxLoanNumber = Max(LoanNumber) FROM FHLB.dbo.FHLBMaster m
	-- SELECT @intMaxLoanNumber = 999
	
	-- Loop through and incrementally insert and update a range of loan numbers
	-- This is used for performance and debugging purposes in case there are 
	-- arithmetic overflow or other data conversion errors.  
	WHILE ( @intCurrentLoanNumber <= @intMaxLoanNumber )
	BEGIN
		PRINT 'Inserting loan number beginning at '
		PRINT @intCurrentLoanNumber

		TRUNCATE TABLE FHLB.dbo.FHLBMasterTemp
		TRUNCATE TABLE FHLB.dbo.FHLBHistoryTemp

		TRUNCATE TABLE AFT.dbo.AFTMasterTemp
		TRUNCATE TABLE AFT.dbo.AFTHistoryTemp
	
		INSERT INTO FHLB.dbo.FHLBMasterTemp
		  SELECT *
		  FROM FHLB.dbo.FHLBMaster
		  WHERE LoanNumber >= @intCurrentLoanNumber 
			  AND LoanNumber < @intCurrentLoanNumber + @intLoanNumberIncrement

		INSERT INTO FHLB.dbo.FHLBHistoryTemp
		  SELECT *
		  FROM FHLB.dbo.FHLBHistory
		  WHERE LoanNumber >= @intCurrentLoanNumber 
			  AND LoanNumber < @intCurrentLoanNumber + @intLoanNumberIncrement

		-- INSERT INITIAL MASTER DATA 
		INSERT INTO AFT.dbo.AFTMasterTemp
		(
			ObjectId,
			ClassId,
			LoanIdNumber,
			OrigDate,
			OrigTerm,
			MaxNumLoans,
			OrigBal,
			LoanSize,
			OrigLTV,
			CurWAM,
			CurWala,
			ZipCode,
			BorrowerFICO,
			CoBorrowerFICO,
			BorrowerIncome,
			CoBorrowerIncome,
			ServicerNumber,
			IsSingleLoan,
			IsArm,
			IsABS,
			HasPenalty,
			IsMegaPool,
			PreAggTypeID,
			IsSecuritized,
			DateModified,
			CurNumLoans,
			AsOfDate,
			CurBal,
			CurFactor,
			CurNet,
			CurWAC,
			Agency,
			LoanCategoryCode,
			RemittanceCode,
			ProductCode
		)
		SELECT 
			ObjectId = m.LoanNumber + @intNextMasterObjectId,
			ClassId = @intMasterClassId,
			LoanIdNumber = m.LoanNumber,

			-- OLD COMMENT:
			-- Default orig date to one month previous to first payment date
			-- To be overidden by usp_CalculateOrigTerm when necessary
			-- NEW COMMENT:
			-- FHLB says that Original Date is always 2 months previous to the first payment date.
			OrigDate = DateAdd(MONTH, -2, m.FirstPaymentDate),

			-- OLD COMMENT:
			-- Calculate Orig term in the default manner, to be overidden later if necessary
			-- by usp_CalculateOrigTerm
			-- NEW COMMENT:
			-- FHLB says that Original Date is always 2 months previous to the first payment date.
			OrigTerm = AFT.dbo.fn_RoundOrigTerm(
						DateDiff(MONTH, DateAdd(MONTH, -2, m.FirstPaymentDate), m.MaturityDate)
					   , 0),	-- one means round up.
			MaxNumLoans = 1,
			OrigBal = m.OrigLoanAmount,
			LoanSize = m.OrigLoanAmount,
			OrigLTV = m.LoanToValue,

			-- Set default CurWAM in case there exists no history
			CurWAM = 0,

			-- Set default CurWala in case there exists no history
			CurWala = 0,

			-- Get first part of zip code before the dash.
			ZipCode = 'ZipCode',
			
			BorrowerFICO = CASE WHEN ( IsNumeric(m.BorrowerFICOScore) = 1 )
													THEN CASE WHEN ( Convert(float, m.BorrowerFICOScore) > 0.0 )
																THEN m.BorrowerFICOScore
																ELSE null
																END
													ELSE null
													END,
			CoBorrowerFICO = CASE WHEN ( IsNumeric(m.CoBorrower1FICOScore) = 1 )
													THEN CASE WHEN ( Convert(float, m.CoBorrower1FICOScore) > 0.0 )
																THEN m.CoBorrower1FICOScore
																ELSE null
																END
													ELSE null
													END,
			BorrowerIncome = CASE WHEN ( m.BorrowerMonthlyIncome > 0 )
													THEN m.BorrowerMonthlyIncome
													ELSE null
													END,
			CoBorrowerIncome = CASE WHEN ( m.CoBorrower1MonthlyIncome > 0 )
													THEN m.CoBorrower1MonthlyIncome
													ELSE null
													END,
			ServicerNumber = CONVERT(INTEGER, m.PFINumber),
			IsSingleLoan = 1,
			IsArm = 0,
			IsABS = 0,
			HasPenalty = 0,
			IsMegaPool = 0,
			PreAggTypeID = 0,
			IsSecuritized = 0,
			DateModified = getDate(),
			CurNumLoans = 1,
			-- Set default AsOfDate in case there is no history
			AsOfDate = m.FirstPaymentDate,
			CurBal = 0,
			CurFactor = 0,
			CurNet = 0,
			CurWAC = 0,
			Agency = 'FHLB',
			LoanCategoryCode = 'LoanCat',
			RemittanceCode = 'RemitCode',
			ProductCode = 'ProductCode'
		
			FROM FHLB.dbo.FHLBMasterTemp m
			-- WHERE EXISTS ( SELECT * FROM FHLB.dbo.FHLBHistoryTemp h WHERE h.LoanNumber = m.LoanNumber )
			ORDER BY m.LoanNumber

			UPDATE AFT.dbo.AFTMasterTemp
				SET		-- Occupancy
						OccupancyCode = l1.OccupancyCode,
						PrimaryResRatio = l1.PrimaryResRatio,
						-- PropertyType
			 			PropertyTypeCode = l2.PropertyTypeCode,
					 	SingleFamRatio = l2.SingleFamRatio,
						-- LoanPurpose	
						LoanPurposeCode = l3.LoanPurposeCode,
						CashOutRatio = l3.CashOutRatio,
						-- Documentation
						DocumentationTypeCode = l4.DocumentationTypeCode,
						FullDocRatio = l4.FullDocRatio,
		  				-- State
						State = l5.StateAbbr,
						GeoAreaCode = l5.RegionName,
						-- LoanProgram
						LoanProgram = l6.LoanProgramCode,
						-- ServicerName
						Servicer = l7.ServicerName
				FROM AFT.dbo.AFTMasterTemp JOIN FHLB.dbo.FHLBMasterTemp fhlbm ON AFTMasterTemp.LoanIdNumber = fhlbm.LoanNumber
					LEFT OUTER JOIN FHLB.dbo.FHLBOccupancyLookup l1 ON fhlbm.Occupancy = l1.OccupancyCode
					LEFT OUTER JOIN FHLB.dbo.FHLBPropertyTypeLookup l2 ON fhlbm.PropertyType = l2.PropertyTypeAbbr
					LEFT OUTER JOIN FHLB.dbo.FHLBLoanPurposeLookup l3 ON CONVERT(INTEGER, fhlbm.LoanPurpose) = l3.LoanPurposeId
					LEFT OUTER JOIN FHLB.dbo.FHLBDocumentationTypeLookup l4 ON fhlbm.DocumentationType = l4.DocumentationTypeAbbr
					LEFT OUTER JOIN FHLB.dbo.FHLBStateLookup l5 ON CONVERT(INTEGER, fhlbm.LastOfCENStateFIPS) = l5.StateId
					LEFT OUTER JOIN FHLB.dbo.FHLBLoanProgramLookup l6 ON fhlbm.ProgramCode = l6.LoanProgramAbbr
					LEFT OUTER JOIN FHLB.dbo.FHLBServicerLookup l7 ON AFTMasterTemp.ServicerNumber = l7.ServicerNumber
		
			-- OLD COMMENT:
			-- Calculate and update orig term for those loans which seem like the origination date is NOT
			-- one month previous to the first payment date given in its history
			-- Orig Date is also updated
			-- NEW COMMENT:
			-- FHLB says that Original Date is always 2 months previous to the first payment date.
			-- Thus, we go by that assumption and don't bother calculating ourselves.
			--EXEC dbo.usp_CalculateOrigTerm

			-- INSERT INITIAL HISTORY DATA
			INSERT INTO AFT.dbo.AFTHistoryTemp
			(
				ObjectId,
				ClassId,
				WALA,
				MonthsSinceOrig,
				LoanIdNumber,
				HistDate,
				HistMonth,
				HistYear,
				GrossCoupon,
				NetCoupon,
				LTV,
				NumLoans,
				SMM,
				CPR,
				CurrentBal,
				PreviousBal,
				Factor,
				TotalPrincipalAdjustments,
				Principal,
				CurrentSchedulePrincipal
			)
			SELECT 
				ObjectId = fhlbh.PaymentId + @intNextHistoryObjectId,
				ClassId = @intHistoryClassId,
				WALA = DateDiff(MONTH, aftm.OrigDate, fhlbh.PayDate),
				MonthsSinceOrig = DateDiff(MONTH, aftm.OrigDate, fhlbh.PayDate),
				LoanIdNumber = fhlbh.LoanNumber,
				HistDate = fhlbh.PayDate,
				HistMonth = fhlbh.PayDateMonth,
				HistYear = fhlbh.PayDateYear,
				GrossCoupon = fhlbm.InterestRate * 100.0,
				-- Used to be the following:
				-- NetCoupon = ( fhlbm.InterestRate * 100.0 ) - 
				-- 	( ( fhlbh.LoanAdminFee / AFT.dbo.fn_CheckZero(fhlbm.OrigLoanAmount) ) * 12.0 * 100.0 ),
				-- Set to default. Will be calculated in usp_CalculateNetCoupon
				NetCoupon = 0,
				LTV = fhlbh.ScheduleEndPrincipalBal / 
					AFT.dbo.fn_CheckZero(fhlbm.OrigLoanAmount / AFT.dbo.fn_CheckZero(fhlbm.LoanToValue) ),
				NumLoans = 1,
				SMM = 0,
				CPR = 0,
				CurrentBal = fhlbh.ScheduleEndPrincipalBal,
				PreviousBal = 0,
				Factor = fhlbh.ScheduleEndPrincipalBal / AFT.dbo.fn_CheckZero(fhlbm.OrigLoanAmount),
				TotalPrincipalAdjustments = fhlbh.TotalPrincipalAdjustment + fhlbh.TotalPrincipalCurtailments,
				Principal = fhlbh.Principal,
				CurrentSchedulePrincipal = fhlbh.CurrentSchedulePrincipal
			
				FROM AFT.dbo.AFTMasterTemp aftm, FHLB.dbo.FHLBHistoryTemp fhlbh, FHLB.dbo.FHLBMasterTemp fhlbm
				WHERE aftm.LoanIdNumber = fhlbh.LoanNumber
					AND fhlbh.LoanNumber = fhlbm.LoanNumber 
				ORDER BY fhlbh.LoanNumber, PayDate

			-- Adjust current balances for those loans which have negative adjustments/curtailments
			-- in their history
			EXEC AFT.dbo.usp_AdjustCurBal 
			
			-- Update previous balances for all but the first row
			-- by getting the current balance from the previous row.
			UPDATE AFT.dbo.AFTHistoryTemp 
			SET PreviousBal = afth2.CurrentBal
				FROM AFT.dbo.AFTHistoryTemp, AFT.dbo.AFTHistoryTemp afth2
				WHERE AFTHistoryTemp.LoanIdNumber = afth2.LoanIdNumber
					AND DateDiff(MONTH, afth2.HistDate, AFTHistoryTemp.HistDate) = 1
					AND ( SELECT Count(*) 
							FROM AFT.dbo.AFTHistoryTemp h2 
							WHERE AFTHistoryTemp.LoanIdNumber = h2.LoanIdNumber 
								AND AFTHistoryTemp.HistDate > h2.HistDate 
							) >= 1

			-- For the first row, update the previous bal according to the principal used for that month
			UPDATE AFT.dbo.AFTHistoryTemp
			SET PreviousBal = CASE WHEN ( CurrentBal + fhlbh.Principal < aftm.OrigBal )
								THEN CurrentBal + fhlbh.Principal 
								ELSE aftm.OrigBal
								END
				FROM AFT.dbo.AFTHistoryTemp afth, AFT.dbo.AFTMasterTemp aftm, FHLB.dbo.FHLBHistoryTemp fhlbh
				WHERE afth.LoanIdNumber = fhlbh.LoanNumber
					AND aftm.LoanIdNumber = afth.LoanIdNumber
					AND fhlbh.PayDate = afth.HistDate
					-- This is the first row in the history
					AND  afth.HistDate = ( SELECT Min(HistDate) 
											FROM AFT.dbo.AFTHistoryTemp h2
											WHERE afth.LoanIdNumber = h2.LoanIdNumber 
										)

			-- If first HistDate is the same month and year as original date in master table
			--		PreviousBal = master's OrigBal 
			-- 		Factor = 1
			UPDATE AFT.dbo.AFTHistoryTemp
				SET PreviousBal = m.OrigBal,
					Factor = 1
				FROM AFT.dbo.AFTHistoryTemp h, AFT.dbo.AFTMasterTemp m
				WHERE h.HistDate = ( SELECT Min(HistDate) 
																				FROM AFT.dbo.AFTHistoryTemp h2
																				WHERE h.LoanIdNumber = h2.LoanIdNumber 
										)
					AND h.LoanIdNumber = m.LoanIdNumber
					AND (h.HistYear = DatePart(YEAR, m.OrigDate)
							AND h.HistMonth = DatePart(MONTH, m.OrigDate))

			PRINT 'Deleting rows with 0 balance'
			-- Delete all loan history after the loan's balance has been set to 0
			-- while not deleting the row where balance first goes to 0.
			DELETE AFT..AFTHistoryTemp 
				FROM AFT..AFTHistoryTemp afth1
				WHERE PreviousBal < @fltNegligibleBalance
					-- Make sure this is not one of the situations where the balance suddenly
					-- picks back up again for whatever reason.
					AND NOT EXISTS 
						( SELECT * 
								FROM AFT..AFTHistoryTemp afth2
								WHERE afth2.LoanIdNumber = afth1.LoanIdNumber
									AND afth2.HistDate > afth1.HistDate
									AND afth2.PreviousBal > @fltNegligibleBalance
							)

			UPDATE AFT.dbo.AFTHistoryTemp
			SET SMM = AFT.dbo.fn_CheckNegative( 100.0 * ( ( PreviousBal - CurrentBal - fhlbh.CurrentSchedulePrincipal ) / 
												  			  ( PreviousBal - fhlbh.CurrentSchedulePrincipal ) 
															), 
												   0)
			FROM FHLB.dbo.FHLBHistoryTemp fhlbh, AFT.dbo.AFTHistoryTemp afth
			WHERE fhlbh.LoanNumber = afth.LoanIdNumber
				AND fhlbh.PayDate = afth.HistDate
				AND PreviousBal - fhlbh.CurrentSchedulePrincipal > 0
			
			UPDATE AFT.dbo.AFTHistoryTemp
			SET CPR = AFT.dbo.fn_SMMToCPR( SMM )
	
			-- Update those columns of the master table that depend on our history table.
			UPDATE AFT.dbo.AFTMasterTemp
			SET AsOfDate = ( SELECT Max(HistDate) 
								FROM AFT.dbo.AFTHistoryTemp h
								WHERE aftm.LoanIdNumber = h.LoanIdNumber
							)
			FROM AFT.dbo.AFTMasterTemp aftm
			WHERE EXISTS ( SELECT * 
					FROM AFT.dbo.AFTHistoryTemp afth 
					WHERE aftm.LoanIdNumber = afth.LoanIdNumber 
							)

			-- Calculate net coupon from the first row we can join with the FHLB history
			-- table.  Update all rows for that loan with that net coupon value.
			UPDATE AFT.dbo.AFTHistoryTemp 
			SET NetCoupon = AFT.dbo.fn_CalculateNetCoupon(
								afth.LoanIdNumber, 
								afth.CurrentBal, 
								afth.GrossCoupon, 
								aftm.OrigBal, 
								aftm.OrigTerm, 
								fhlbh.CurrentSchedulePrincipal + fhlbh.CurrentScheduleInterest,
								fhlbh.LoanAdminFee )
			-- We update all rows of a loan with the same net coupon value.  Thus, we join
			-- two history tables together without including the hist date in the join, 
			-- the second history table is (indirectly) joined with the first payment of the 
			-- loan in the FHLB history table, thus returning only one row per loan.
			FROM AFT.dbo.AFTHistoryTemp JOIN AFT.dbo.AFTHistoryTemp afth
					ON afth.LoanIdNumber = AFTHistoryTemp.LoanIdNumber
				JOIN AFT.dbo.AFTMasterTemp aftm 
					ON aftm.LoanIdNumber = afth.LoanIdNumber
				JOIN FHLB.dbo.FHLBHistoryTemp fhlbh
					ON afth.LoanIdNumber = fhlbh.LoanNumber AND
						fhlbh.PayDate = afth.HistDate
			-- Get only the first payment since net coupon stays the same (or very similar) throughout
			-- the loan's history.
			WHERE fhlbh.PayDate = (SELECT Min(PayDate) 
									FROM FHLB.dbo.FHLBHistoryTemp fhlbh2
									WHERE fhlbh.LoanNumber = fhlbh2.LoanNumber
									)

			-- Update the master from the most recent records in the history table.
			UPDATE AFT.dbo.AFTMasterTemp
			SET CurFactor = afth.Factor,
				CurBal = afth.CurrentBal,
				CurWac = afth.GrossCoupon,
				CurNet = afth.NetCoupon,
				CurLTV = afth.LTV
			FROM AFT.dbo.AFTMasterTemp aftm, AFT.dbo.AFTHistoryTemp afth, FHLB.dbo.FHLBMasterTemp fhlbm
			WHERE aftm.LoanIdNumber = fhlbm.LoanNumber 
				AND aftm.LoanIdNumber = afth.LoanIdNumber
				AND aftm.AsOfDate = afth.HistDate

	

			-- Do a final update from newly updated master columns
			UPDATE AFT.dbo.AFTMasterTemp
			SET CurWala = DateDiff(MONTH, OrigDate, AsOfDate),
				-- Now CurWAM is calculated.
				--CurWAM = OrigTerm - DateDiff(MONTH, OrigDate, AsOfDate),
				AmortTerm = OrigTerm

			EXEC AFT.dbo.usp_CalculateWAM

			INSERT INTO AFT.dbo.AFTMaster
			(
				ObjectId, ClassId, Name, Description, Created, LastModified, OwnerId,
				LastModifiedBy, IndexValue, MaxNumLoans, Issuer, LoanProgram, Agency, OrigDate,
				OrigTerm, AmortTerm, OrigBal, OrigLTV, CurWac, CurNet, CurWALA,
				CurWAM, CurFactor, CurBal, CurLTV, LoanSize, PrimaryResRatio, SingleFamRatio,
				FullDocRatio, CashOutRatio, State, ZipCode, BorrowerFICO, BorrowerIncome,
				CoBorrowerIncome, CoBorrowerFICO, PropertyTypeCode, OccupancyCode, GeoAreaCode,
				LoanStatusCode, ProductCode, DocumentationTypeCode, LoanPurposeCode, RemittanceCode,
				LoanCategoryCode, AFTRating, SPRating, MoodyRating, FitchRating,
				Servicer, ServicerNumber, IndexType, GrossMargin, CouponResetPeriod,
				LifeCap, ResetCap, LifeFloor, ServicingFee, TeaserPeriod,
				TeaserRate, PayResetPeriod, PayResetCap, PayCapWaivePeriod, InitialPayResetPeriod,
				NegativeAmortFlag, NegativeAmortLimit, PCVar1, PCVar2, PCVar3,
				PCVar4, PCVar5, PCVar6, PCVar7, PCVar8,
				PCVar9, PCVar10, LoanIDNumber, LoanIDString, PoolNumber,
				AsOfDate, DateModified, UserModified, CurNumLoans, CPR1Month,
				CPR3Month, CPR6Month, CPR12Month, CPRLife, IsSingleLoan,
				IsARM, IsABS, HasPenalty, IsMegaPool, PreAggTypeID,
				IsSecuritized
			)
			SELECT ObjectId, ClassId, Name, Description, Created, LastModified, OwnerId,
				LastModifiedBy, IndexValue, MaxNumLoans, Issuer, LoanProgram, Agency, OrigDate,
				OrigTerm, AmortTerm, OrigBal, OrigLTV, CurWac, CurNet, CurWALA,
				CurWAM, CurFactor, CurBal, CurLTV, LoanSize, PrimaryResRatio, SingleFamRatio,
				FullDocRatio, CashOutRatio, State, ZipCode, BorrowerFICO, BorrowerIncome,
				CoBorrowerIncome, CoBorrowerFICO, PropertyTypeCode, OccupancyCode, GeoAreaCode,
				LoanStatusCode, ProductCode, DocumentationTypeCode, LoanPurposeCode, RemittanceCode,
				LoanCategoryCode, AFTRating, SPRating, MoodyRating, FitchRating,
				Servicer, ServicerNumber, IndexType, GrossMargin, CouponResetPeriod,
				LifeCap, ResetCap, LifeFloor, ServicingFee, TeaserPeriod,
				TeaserRate, PayResetPeriod, PayResetCap, PayCapWaivePeriod, InitialPayResetPeriod,
				NegativeAmortFlag, NegativeAmortLimit, PCVar1, PCVar2, PCVar3,
				PCVar4, PCVar5, PCVar6, PCVar7, PCVar8,
				PCVar9, PCVar10, LoanIDNumber, LoanIDString, PoolNumber,
				AsOfDate, DateModified, UserModified, CurNumLoans, CPR1Month,
				CPR3Month, CPR6Month, CPR12Month, CPRLife, IsSingleLoan,
				IsARM, IsABS, HasPenalty, IsMegaPool, PreAggTypeID, IsSecuritized
				FROM AFT.dbo.AFTMasterTemp
				WHERE 1=1
		
			INSERT INTO AFT.dbo.AFTHistory
			(
				ObjectId, ClassId, Name, Description, Created,
				LastModified, OwnerId, LastModifiedBy, LoanIdNumber, HistDate,
				HistYear, HistMonth, WALA, MonthsSinceOrig, CurrentBal,
				PreviousBal, CPR, SMM, GrossCoupon, NetCoupon,
				Factor, LTV, NumLoans
			)
			SELECT ObjectId, ClassId, Name, Description, Created,
				LastModified, OwnerId, LastModifiedBy, LoanIdNumber, HistDate,
				HistYear, HistMonth, WALA, MonthsSinceOrig, CurrentBal,
				PreviousBal, CPR, SMM, GrossCoupon, NetCoupon,
				Factor, LTV, NumLoans
				FROM AFT.dbo.AFTHistoryTemp
				WHERE 1=1
				
			SELECT @intCurrentLoanNumber = @intCurrentLoanNumber + @intLoanNumberIncrement 
	END -- END WHILE

	IF (SELECT MAX(LoanIdNumber) FROM AFT..AFTHistory) <> (SELECT MAX(LoanNumber) FROM FHLB.dbo.FHLBHistory) 
	BEGIN
		PRINT 'Max Loan id in AFT History table does not equal max loan id in FHLB History table'
	END
	
	IF (SELECT MAX(LoanIdNumber) FROM AFT..AFTMaster) <> (SELECT MAX(LoanNumber) FROM FHLB.dbo.FHLBMaster) 
	BEGIN
		PRINT 'Max Loan id in AFT History table does not equal max loan id in FHLB History table'
	END

	PRINT 'End of procedure'
END -- CREATE PROCEDURE



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

