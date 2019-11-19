USE dj0803805;
GO

INSERT INTO SequenceTable 
VALUES(
	NEXT VALUE FOR master..TestSequence1, 'A New Row'
);

SELECT * FROM SequenceTable;