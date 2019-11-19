USE dj0803805;
GO

DECLARE @MyInvTotal money;
EXEC spInvTotal3 '2016-02-01', 'P%', @MyInvTotal OUTPUT;
PRINT @MyInvTotal
GO

DECLARE @MyInvTotal money;
EXEC spInvTotal3 @DateVar = '2016-02-01', @VendorVar = 'B%', @InvTotal = @MyInvTotal OUTPUT;
PRINT @MyInvTotal
GO

DECLARE @MyInvTotal money;
EXEC spInvTotal3 @VendorVar = 'M%', @InvTotal = @MyInvTotal OUTPUT;
PRINT @MyInvTotal
GO

DECLARE @MyInvTotal money;
EXEC spInvTotal3 @InvTotal = @MyInvTotal OUTPUT;
PRINT @MyInvTotal