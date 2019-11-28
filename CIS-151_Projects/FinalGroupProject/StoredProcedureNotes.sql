USE dj0803805;
GO

/* These procedures execute a SELECT statement getting all columns in each of their
respective tables.

The optional @Input parameter lets you select a specific row by it's ID. Alternatively, setting it to 0
(or skipping it) will return all rows.
*/

EXEC sp_GetInvoices
	@Input = 0;
EXEC sp_GetServices
	@Input = 0;
EXEC sp_GetPackages 
	@Input = 0;



/* These next three procedures create new rows in their respective tables.
They each return the new row's ID number: Keeping track of these is necessary for making sure 
that their respective keys are connected together properly.

In particular, when creating a new Package row, it's important to fill in values for both the 
delivery service used (ServiceID) and the invoice it's under (InvoiceID).

That said, I'm not sure if this is the best way to go about returning those values - please give me your input 
and I'll alter them accordingly.
*/
DECLARE @MyInvoice INT;
EXEC sp_NewInvoice
	@Name = 'Mister Customer', -- The customer's name.
	@Address = '1234 N Example Str', -- The billing address.
	@City = 'Flavortown', -- The billing town.
	@State = 'NY', -- The billing state. MUST BE TWO CHARACTERS
	@Zip = '12345', -- The billing ZIP code. MUST BE FIVE CHARACTERS.
	@NewID = @MyInvoice OUTPUT; -- The output variable.
SELECT * FROM ex_Invoices WHERE InvoiceID = @MyInvoice;

DECLARE @MyService INT;
EXEC sp_NewService
	@Company = 'Acme Shipping', -- The company name. (Yes, it would probably be better to have a seperate "companies" table, but hush.)
	@Description = '1-3 business days.', -- A short description of the delivery service.
	@Cost = 10.00, -- The cost. If @FlatFee is set to 1, then it's the flat cost - if FlatFee is set to 0, then it's the additional cost per ounce.
	@FlatFee = 1, -- See the note in Cost.
	@NewID = @MyService OUTPUT; -- The output variable.
SELECT * FROM ex_Invoices WHERE InvoiceID = @MyService;

DECLARE @MyPackage INT;
EXEC sp_NewPackage
	@InvoiceID = @MyInvoice, -- The ID for the parent Invoice. If it's not provided, it'll default to 1, which is a pre-existing "error" row.
	@ServiceID = @MyService, -- The ID for the delivery service selected. If it's not provided, it'll default to 1, which is a pre-existing "error" row.
	@Name = 'Miss Recipient', -- The recipient name.
	@Address = '4321 N Example Str', -- The mailing address.
	@City = 'Funky Town', -- The mailing city.
	@State = 'CA', -- The mailing state. MUST BE TWO CHARACTERS.
	@Zip = '54321', -- The mailing ZIP code. MUST BE FIVE CHARACTERS.
	@Description = 'This is an example package.', -- A description of the package.
	@Weight = 420.69, -- The packages weight (Presumably in ounces?).
	@CostPerOunce = 3.50, -- The cost per ounce.
	@NewID = @MyService OUTPUT; -- The output variable.
SELECT * FROM ex_Packages WHERE InvoiceID = @MyPackage;

/* That's all for now. Let me know if changes or additions need made, alright? */
