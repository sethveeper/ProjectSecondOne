USE dj0803805;
GO

-- This is a demonstration of how Inner Joins work.

Select InvoiceNumber, VendorName
	FROM Vendors JOIN Invoices
		ON Vendors.VendorID = Invoices.VendorID;
		-- Essentially, it's looking for anything that
		-- shares a VendorID on both tables.