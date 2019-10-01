/*************************
DO NOT RUN THE WHOLE QUERY
**************************/

USE dj0803805;
GO

INSERT INTO ColorSample
	VALUES
	(000000, 'Yellow'),
	(101010, 'Orange'),
	(123456, NULL),
	(DEFAULT, NULL);

SELECT * FROM ColorSample;