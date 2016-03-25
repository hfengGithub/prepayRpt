SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


ALTER  procedure usp_AddSingleLoanRowId
	@intReturnFlag integer output
as
begin

	set @intReturnFlag = -2

 	alter table AFT.dbo.AFTmaster add  RowId integer identity not null
	alter table AFT.dbo.AFThistory	add  RowId integer identity not null

	set @intReturnFlag = 0

end


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

