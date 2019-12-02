USE dj0803805;
GO

DROP TABLE IF EXISTS ex_Packages;  
DROP TABLE IF EXISTS ex_Invoices;
GO  

CREATE TABLE ex_Invoices
(
	[InvoiceID] INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	[Name] NVARCHAR(50) NOT NULL,
	[Address] NVARCHAR(50) NOT NULL,
	[City] NVARCHAR(50) NOT NULL,
	[State] NVARCHAR(2) NOT NULL,
	[Zip] NVARCHAR(5) NOT NULL
);

CREATE TABLE ex_Packages
(
	[PackageID] INT IDENTITY(1, 1) NOT NULL,
	[InvoiceID] INT FOREIGN KEY REFERENCES ex_Invoices(InvoiceID),
	[Name] NVARCHAR(50) NOT NULL,
	[Address] NVARCHAR(50) NOT NULL,
	[City] NVARCHAR(50) NOT NULL,
	[State] NVARCHAR(2) NOT NULL,
	[Zip] NVARCHAR(5) NOT NULL,
	[Description] NVARCHAR(50) NOT NULL,
	[Weight] DECIMAL(8,4) NOT NULL,
	[CostPerOunce] MONEY NOT NULL,
	[DaysToShip] TINYINT NOT NULL
);
GO
-- ^^^^ End of Create Tables batch

DECLARE @ThisID INT;

EXEC sp_NewInvoice
	@Name = 'Invoice of Erroroneous Packages',
	@Address = '123 Error Street',
	@City = 'Errorville',
	@State = 'NA',
	@Zip = '42069'

EXEC sp_NewPackage
	@InvoiceID = 1,
	@Name = 'Seth Veeper',
	@Address = '4321 Example Street',
	@City = 'Goodsprings',
	@State = 'NV',
	@Zip = '89019',
	@Description = 'Seth''s example package ^w^',
	@Weight = 420.69,
	@CostPerOunce = 3.50
GO