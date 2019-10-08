/*******************************
================================
WARNING

DO NOT RUN THE WHOLE QUERY

THINGS WILL GET WEIRD AND BROKEN
================================
*******************************/
USE dj0803805;
GO

-- Shows the whole table. (Obviously.)
SELECT * 
	FROM InvoicesBackUp
ORDER BY VendorID;

-- Copies a table into a new table.
SELECT *
	INTO InvoicesBackUp
	FROM Invoices;

	-- Gets rid of a table.
DROP TABLE InvoicesBackUp;

-- Puts additional row(s) into a table.
INSERT INTO InvoicesBackUp
	VALUES 
	(95, '111-10098', '2016-04-01', 219.50, 0, 0, 1, '2016-04-30', NULL),
	(102, '109596', '2016-04-02', 22.97, 0, 0, 1, '2016-04-31', NULL),
	(72, '40319', '2016-04-03', 173.38, 0, 0, 1, '2016-05-01', NULL);

-- Puts additional row(s) into a table (But with the parameter order redefined)
INSERT INTO InvoicesBackUp
	(VendorID, InvoiceNumber, InvoiceTotal, PaymentTotal, CreditTotal, TermsID, InvoiceDate, InvoiceDueDate)
VALUES 
	(97, '456789', 8344.50, 0, 0, 1, '2016-04-01', '2016-04-30');

/*******************************
================================
WARNING

DO NOT RUN THE WHOLE QUERY

THINGS WILL GET WEIRD AND BROKEN
================================
*******************************/

-- Updates specific rows based on the WHERE clause
UPDATE InvoicesBackUp
	SET PaymentDate = '2016-05-21',
	PaymentTotal = 19351.18
WHERE InvoiceNumber = '97/522';

UPDATE InvoicesBackUp
	SET TermsID = 1
WHERE VendorID = 95;

-- Update with a calculation and a subquery
UPDATE InvoicesBackUp
	SET CreditTotal = CreditTotal + 100,
	InvoiceDueDate = (SELECT MAX(InvoiceDueDate) FROM InvoicesBackUp)
WHERE InvoiceNumber = '97/522';

SELECT * FROM InvoicesBackUp
WHERE InvoiceNumber = '97/522';


/*******************************
================================
WARNING

DO NOT RUN THE WHOLE QUERY

THINGS WILL GET WEIRD AND BROKEN
================================
*******************************/

-- Deletes the table's contents (But not the table itself)
DELETE InvoicesBackUp;

-- Deletes rows based on the WHERE clause
DELETE InvoicesBackUp
WHERE InvoiceID = 115;

DELETE InvoicesBackUp
WHERE VendorID = 37;

SELECT * FROM InvoicesBackUp
WHERE VendorID = 37;