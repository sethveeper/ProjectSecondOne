USE dj0803805;
GO

SELECT InvoiceNumber, 
	-- We can do math! Using mostly standard operators.
	InvoiceTotal - PaymentTotal - CreditTotal 
	AS [Balance Due]
	FROM Invoices
	-- WHERE is similar to an if statement
	WHERE (InvoiceTotal - PaymentTotal - CreditTotal ) > 0;