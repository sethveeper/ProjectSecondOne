USE dj0803805;
GO

	-- CAST will convert it, but not reformat it.
SELECT InvoiceDate, 
	InvoiceTotal,
	CAST(InvoiceDate AS varchar) AS [VarChar Date],
	CAST(InvoiceTotal AS int) AS [Integer Total],
	CAST(InvoiceTotal AS varchar) AS [VarChar Total]
	FROM Invoices;

SELECT 50/100 AS [Integer Math],
	50/CAST(100 AS decimal(3)) AS [Cast Math];

	-- This converts and formats one data type into another.
SELECT CONVERT(varchar,InvoiceDate) AS [VarChar Date],
	CONVERT(varchar,InvoiceDate, 1) AS [VarChar Dat 1],
	CONVERT(varchar,InvoiceDate, 107) AS [VarChar Date 107],
	CONVERT(varchar,InvoiceTotal) AS [VarChar Total],
	CONVERT(varchar,InvoiceTotal, 1) AS [VarChar Total 1]
	FROM Invoices;

	-- This conversion will return NULL if it doesn't work.
SELECT TRY_CONVERT(varchar, InvoiceDate) AS [VarChar Date],
	TRY_CONVERT(varchar, InvoiceDate, 1) AS [VarChar Date 1],
	TRY_CONVERT(varchar, InvoiceDate, 107) AS [VarChar Date 107],
	TRY_CONVERT(varchar, InvoiceTotal) AS [VarChar Total],
	TRY_CONVERT(varchar, InvoiceTotal, 1) AS [VarChar Total 1],
	TRY_CONVERT(date, 'Feb 29 2015') AS [Invalid Date]
	FROM Invoices;

	-- Here's some other conversions. You probably won't need these much.
SELECT STR(1234.56789, 7, 1) AS [Number to String],
	CHAR(9) AS [Number to Character],
	ASCII('Orange') AS [String to ASCII],
	NCHAR(332) AS [NChar],
	UNICODE(N'Or') AS [Unicode];