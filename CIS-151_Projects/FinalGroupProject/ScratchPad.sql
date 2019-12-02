USE dj0803805;
GO

EXEC sp_NewInvoice
	@Name = 'Seth Veeper', -- The customer's name.
	@Address = '1819 N Colgate Ave', -- The billing address.
	@City = 'Springfield', -- The billing town.
	@State = 'MO', -- The billing state. MUST BE TWO CHARACTERS
	@Zip = '65802'; -- The billing ZIP code. MUST BE FIVE CHARACTERS.

DECLARE @Invoice INT;
SELECT @Invoice = @@IDENTITY;

EXEC sp_NewPackage
	@InvoiceID = @Invoice, -- The ID for the parent Invoice. If it's not provided, it'll default to 1, which is a pre-existing "error" row.
	@Name = 'Seth Veeper', -- The recipient name.
	@Address = '1819 N Colgate Ave', -- The mailing address.
	@City = 'Springfield', -- The mailing city.
	@State = 'MO', -- The mailing state. MUST BE TWO CHARACTERS.
	@Zip = '65802', -- The mailing ZIP code. MUST BE FIVE CHARACTERS.
	@Description = 'The Platinum Chip', -- A description of the package.
	@Weight = 0.5, -- The packages weight (Presumably in ounces?).
	@CostPerOunce = 100.00, -- The cost per ounce.
	@DaysToShip = 3; 

EXEC sp_NewPackage
	@InvoiceID = @Invoice, -- The ID for the parent Invoice. If it's not provided, it'll default to 1, which is a pre-existing "error" row.
	@Name = 'Michael Kroth', -- The recipient name.
	@Address = '1001 W Chestnut EXPY', -- The mailing address.
	@City = 'Springfield', -- The mailing city.
	@State = 'MO', -- The mailing state. MUST BE TWO CHARACTERS.
	@Zip = '65802', -- The mailing ZIP code. MUST BE FIVE CHARACTERS.
	@Description = 'Flu Medication', -- A description of the package.
	@Weight = 2.3, -- The packages weight (Presumably in ounces?).
	@CostPerOunce = 0.05, -- The cost per ounce.
	@DaysToShip = 1; 

EXEC sp_GetInvoices
	@Input = @Invoice;
EXEC sp_GetPackagesByInvoice
	@Input = @Invoice;