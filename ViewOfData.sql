USE dj0803805;
GO

/*
CREATE VIEW VendorsMin AS
	SELECT VendorName, VendorState, VendorPhone
	FROM Vendors;

SELECT * FROM VendorsMin
	WHERE VendorState = 'MO'
ORDER BY VendorName;

CREATE VIEW VendorShortList AS
	SELECT VendorName, 
	VendorContactLName,
	VendorContactFName,
	VendorPhone
	FROM Vendors
	WHERE VendorID IN (SELECT VendorID FROM Invoices);

SELECT * FROM VendorShortList;

CREATE VIEW VendorInvoices AS
	SELECT VendorName,
	InvoiceNumber,
	InvoiceDate,
	InvoiceTotal
	FROM Vendors JOIN Invoices
		ON Vendors.VendorID = Invoices.VendorID;
*/


SELECT * FROM VendorInvoices;