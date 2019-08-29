USE dj0803805;
GO

-- TOP is used to grab the top however many things
-- from a list.

-- ORDER BY lets us decide how to display them.
SELECT TOP 5 VendorID, InvoiceTotal
	FROM Invoices
	ORDER BY InvoiceTotal DESC;
