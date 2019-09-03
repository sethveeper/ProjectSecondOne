USE dj0803805;
GO

-- This is a demonstration of how Inner Joins work.

SELECT InvoiceNumber, VendorName
	FROM Vendors JOIN Invoices
		ON Vendors.VendorID = Invoices.VendorID;
		-- Essentially, it's looking for anything that
		-- shares a VendorID on both tables.

-- This one only returns certain lines.
SELECT InvoiceNumber, InvoiceDate,
	InvoiceTotal, InvoiceLineItemAmount
	FROM Invoices JOIN InvoiceLineItems AS LineItems
		ON (Invoices.InvoiceID = LineItems.InvoiceID)
		AND (Invoices.InvoiceTotal > LineItems.InvoiceLineItemAmount)
	ORDER BY InvoiceNumber;

-- This one is apparently called a "Self Join".
-- It returns common cities between vendors.
SELECT DISTINCT Vendors1.VendorName, Vendors1.VendorCity,
	Vendors1.VendorState
	FROM Vendors AS Vendors1 JOIN Vendors AS Vendors2
		ON (Vendors1.VendorCity = Vendors2.VendorCity) 
		AND (Vendors1.VendorState = Vendors2.VendorState) 
		AND (Vendors1.VendorID <> Vendors2.VendorID)
	ORDER BY Vendors1.VendorState, Vendors1.VendorCity;