USE dj0803805;
GO

/* These procedures execute a SELECT statement getting all columns in each of their
respective tables.

The optional @Input parameter lets you select a specific row by it's ID. Alternatively, setting it to 0
(or skipping it) will return all rows.
*/

EXEC sp_GetInvoices
	@Input = 0;
EXEC sp_GetPackages 
	@Input = 0;

/* This one's slightly different: It returns all the Package rows belonging to a specific
InvoiceID. It might not be necessary, I admit, but it's there none the less.

If given an Input of 0 or 1 (Or if it's skipped) it'll return packages belonging to that
"Error invoice" you'll read about in a minute, if you haven't already.
*/
EXEC sp_GetPackagesByInvoice
	@Input = 1;


/* These next two procedures create new rows in their respective tables.
They each return the new row as part of a SELECT statement. This enables 
you to read from it, for a number of reasons. In particular, it is critically 
important to grab InvoiceIDs as you create them, so that Packages can be associated 
with them in the correct manner.
*/
EXEC sp_NewInvoice
	@Name = 'Mister Customer', -- The customer's name.
	@Address = '1234 N Example Str', -- The billing address.
	@City = 'Flavortown', -- The billing town.
	@State = 'NY', -- The billing state. MUST BE TWO CHARACTERS
	@Zip = '12345'; -- The billing ZIP code. MUST BE FIVE CHARACTERS.

-- Ignore this part.
DECLARE @MyInvoice INT;
SELECT @MyInvoice = @@IDENTITY;
SELECT @MyInvoice;
-- It's not super important, it just keeps this example code from breaking.

EXEC sp_NewPackage
	@InvoiceID = @MyInvoice, -- The ID for the parent Invoice. If it's not provided, it'll default to 1, which is a pre-existing "error" row.
	@Name = 'Miss Recipient', -- The recipient name.
	@Address = '4321 N Example Str', -- The mailing address.
	@City = 'Funky Town', -- The mailing city.
	@State = 'CA', -- The mailing state. MUST BE TWO CHARACTERS.
	@Zip = '54321', -- The mailing ZIP code. MUST BE FIVE CHARACTERS.
	@Description = 'This is an example package.', -- A description of the package.
	@Weight = 420.69, -- The packages weight (Presumably in ounces?).
	@CostPerOunce = 3.50,
	@DaysToShip = 2; -- The cost per ounce.


/* That's all for now. Let me know if changes or additions need made, alright? */