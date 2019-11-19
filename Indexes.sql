USE dj0803805;
GO

/*
CREATE INDEX IX_Invoices
	ON Invoices (InvoiceDate DESC, InvoiceTotal);

SELECT * FROM Invoices;
*/

/*
CREATE TABLE Vendors9
(
	VendorID	INT NOT NULL PRIMARY KEY,
	VendorName	VARCHAR(50) NOT NULL
);

CREATE TABLE Invoices9
(
	InvoiceID		INT NOT NULL PRIMARY KEY,
	VendorID		INT NOT NULL REFERENCES Vendors9 (VendorID),
	InvoiceTotal	MONEY NULL
);
*/


DROP TABLE SequenceTable;
GO

CREATE TABLE SequenceTable(
	SequenceNo INT,
	Description VARCHAR(50));
	
INSERT INTO SequenceTable VALUES
(NEXT VALUE For Master.dbo.TestSequence1, 'First Inserted Row');
INSERT INTO SequenceTable VALUES
(NEXT VALUE For Master.dbo.TestSequence1, 'Second Inserted Row');

SELECT * FROM SequenceTable;