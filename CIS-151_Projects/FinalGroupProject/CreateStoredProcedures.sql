USE dj0803805;
GO

-- Creates a new invoice.
ALTER PROC sp_NewInvoice
	@Name NVARCHAR(50) = 'ERROR',
	@Address NVARCHAR(50) = 'ERROR',
	@City NVARCHAR(50) = 'ERROR',
	@State NVARCHAR(2) = 'ER',
	@Zip NVARCHAR(5) = 'ERROR',
	@Select BIT = 0
AS
	INSERT INTO ex_Invoices (Name, Address, City, State, Zip)
	VALUES (@Name, @Address, @City, @State, @Zip);
	
	-- After creating the new row, it makes a SELECT statement for that row.
	DECLARE @NewID INT;
	IF (@Select = 1)
		SELECT @NewID = @@IDENTITY;
		SELECT * FROM ex_Invoices WHERE InvoiceID = @NewID;
	-- I hope so, anyways.
GO

-- Creates a new package.
ALTER PROC sp_NewPackage
	@InvoiceID INT = 1, -- If IDs aren't provided, it will go to a 
	@ServiceID INT = 1, -- "default" ID for both of these.
	@Name NVARCHAR(50) = 'ERROR',
	@Address NVARCHAR(50) = 'ERROR',
	@City NVARCHAR(50) = 'ERROR',
	@State NVARCHAR(2) = 'ER',
	@Zip NVARCHAR(5) = 'ERROR',
	@Description NVARCHAR(50) = 'ERROR',
	@Weight DECIMAL(8,4) = 0,
	@CostPerOunce MONEY = 0,
	@DaysToShip TINYINT = 2,
	@Select BIT = 0
AS
	INSERT INTO ex_Packages (Name, Address, City, State, Zip, Description, Weight, CostPerOunce, DaysToShip, InvoiceID)
	VALUES (@Name, @Address, @City, @State, @Zip, @Description, @Weight, @CostPerOunce, @DaysToShip, @InvoiceID);

	-- After creating the new row, it makes a SELECT statement for that row.
	DECLARE @NewID INT;
	IF (@Select = 1)
		SET @NewID = @@IDENTITY;
		SELECT * FROM ex_Packages WHERE PackageID = @NewID;
	-- After creating the new row, it returns that row's ID.
	-- Hopefully.
GO

-- Gets all invoices, or a particular invoice (By ID).
ALTER PROC sp_GetInvoices
	@Input INT = 0
AS
	IF @Input = 0
		SELECT * FROM ex_Invoices ORDER BY InvoiceID;
	ELSE
		SELECT * FROM ex_Invoices WHERE InvoiceID = @Input;
GO

-- Gets all packages, or a particular package (By ID).
ALTER PROC sp_GetPackages
	@Input INT = 0
AS
	IF @Input = 0
		SELECT * FROM ex_Packages ORDER BY InvoiceID, PackageID;
	ELSE
		SELECT * FROM ex_Packages WHERE PackageID = @Input;
GO

-- Gets all packages by a given InvoiceID.
ALTER PROC sp_GetPackagesByInvoice
	@Input INT = 1
AS
	IF @Input = 0
		SELECT @Input = 1;

	SELECT * FROM ex_Packages WHERE InvoiceID = @Input ORDER BY PackageID;
GO