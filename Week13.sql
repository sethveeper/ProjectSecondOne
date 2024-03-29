USE dj0803805;
GO

/*1.	Write a script that declares a variable and sets it to the count of 
all products in the Products table. If the count is greater than or equal 
to 7, the script should display a message that says, �The number of 
products is greater than or equal to 7�. Otherwise, it should say, 
�The number of products is less than 7�.
*/

PRINT 'Question 1:';

DECLARE @ProductCount int;
SELECT @ProductCount = COUNT(*) FROM Products;

IF @ProductCount < 7
	PRINT 'The number of products is less than 7';
ELSE
	PRINT 'The number of products is greater than or equal to 7';

PRINT '-------------------------------------------------------';
GO

/*2.	Write a script that uses two variables to store 
(1) the count of all of the products in the Products table and 
(2) the average list price for those products. 
If the product count is greater than or equal to 7, the script should print 
a message that displays the values of both variables. Otherwise, the script 
should print a message that says, �The number of products is less than 7�.
*/

PRINT 'Question 2:';

DECLARE @ProductCount int;
SELECT @ProductCount = COUNT(*) FROM Products;

DECLARE @ProductAvgList money;
SELECT @ProductAvgList = AVG(ListPrice) FROM Products;

IF @ProductCount < 7
	PRINT 'The number of products is less than 7';
ELSE
	PRINT 'The total number of products is: ' + CAST(@ProductCount AS varchar);
	PRINT 'The average list price is: ' + CAST(@ProductAvgList AS varchar);

PRINT '-------------------------------------------------------';
GO
/*3.	Write a script that calculates the common factors between 10 and 20. 
To find a common factor, you can use the modulo operator (%) to check whether a number 
can be evenly divided into both numbers. Then, this script should print lines that display the common factors like this: 
Common factors of 10 and 20
1
2
5
*/

PRINT 'Question 3:';

DECLARE @Count int;
SET @Count = 1;

PRINT 'Common factors of 10 and 20:'
WHILE (@Count < 20)
	BEGIN
	IF (10 % @Count = 0) AND (20 % @Count = 0)
		PRINT @Count;
	SET @Count = @Count + 1;
	END

PRINT '-------------------------------------------------------';
GO

/*4.	Write a script that attempts to insert a new category named �Guitars� into the 
Categories table. If the insert is successful, the script should display this message:
SUCCESS: Record was inserted.

If the update is unsuccessful, the script should display a message something like this:
FAILURE: Record was not inserted.
Error 2627: Violation of UNIQUE KEY constraint 'UQ__Categori__8517B2E0A87CE853'. Cannot insert duplicate key in object 'dbo.Categories'. The duplicate key value is (Guitars).
*/

PRINT 'Question 4';

BEGIN TRY  
	INSERT INTO Categories (CategoryName) VALUES ('Guitars');
    PRINT 'SUCCESS: Record was inserted.'; 
END TRY  
BEGIN CATCH  
    PRINT 'FAILURE: Record was not inserted.'; 
END CATCH;

PRINT '-------------------------------------------------------';