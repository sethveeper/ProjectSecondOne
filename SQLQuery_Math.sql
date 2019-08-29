USE dj0803805;
GO;

SELECT InvoiceNumber, 
	InvoiceTotal - PaymentTotal - CreditTotal 
	AS [Balance Due]
	FROM Invoices;