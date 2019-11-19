USE dj0803805;
GO

CREATE PROC spInvTotal1
	@DateVar smalldatetime,
	@InvTotal money OUTPUT
AS

SELECT @InvTotal = SUM(InvoiceTotal) 
	FROM Invoices
	WHERE InvoiceDate >= @DateVar;

GO

CREATE PROC spInvTotal2
	@DateVar smalldatetime = NULL,
	@InvTotal money OUTPUT
AS
	
	IF @DateVar IS NULL
		SELECT @DateVar = MIN(InvoiceDate)
			FROM Invoices;

	SELECT @InvTotal = SUM(InvoiceTotal) 
		FROM Invoices
		WHERE InvoiceDate >= @DateVar;
GO

CREATE PROC spInvTotal3
	@DateVar smalldatetime = NULL,
	@VendorVar varchar(40) = '%',
	@InvTotal money OUTPUT
AS
	
	IF @DateVar IS NULL
		SELECT @DateVar = MIN(InvoiceDate)
			FROM Invoices;

	SELECT @InvTotal = SUM(InvoiceTotal) 
		FROM Invoices JOIN Vendors
			ON Invoices.VendorID = Vendors.VendorID
		WHERE (InvoiceDate >= @DateVar) AND (VendorName LIKE @VendorVar);
GO