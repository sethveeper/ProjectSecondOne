USE dj0803805;
GO

/*1.	The Guitar Shop is going to start carrying cases as part of their inventory. 
Write the statement needed to add Cases to the categories in the database. 
Code the INSERT statement so SQL Server automatically generates the value for the CategoryID column.
*/

INSERT INTO Categories (CategoryName)
VALUES ('Cases');

SELECT * FROM Categories
ORDER BY CategoryID DESC;

/*2.	During a meeting, it was decided that instead of Cases, 
the Guitar Shop would start using the term Guitar Cases for these items. 
Write the statement that will update the name of the category Cases to Guitar Cases. 
To be sure you are updating the right row, use the CategoryID in your statement.
*/

UPDATE Categories
	SET CategoryName = 'Guitar Cases'
WHERE CategoryID = 5;

SELECT * FROM Categories
ORDER BY CategoryID DESC;

/*3.	Some new items have come into the Guitar Shop and need to be added to the database. 
Write the statement that will add this product:
ProductID:	The next automatically generated ID 
CategoryID:	4
ProductCode:	dgx_680
ProductName:	Yamaha DGX 680 102-Key Digital Piano
Description:	Long description to come.
ListPrice:	799.99
DiscountPercent:	0
DateAdded:	Today’s date/time.
*/

INSERT INTO Products
	(CategoryID, ProductCode, ProductName, Description, ListPrice, DiscountPercent, DateAdded)
VALUES (4, 'dgx_680', 'Yamaha DGX 680 102-Key Digital Piano', 'Long description to come.', 799.99, 0, GETDATE());

SELECT TOP 5 * FROM Products
	ORDER BY ProductID DESC;

/*4.	It was later determined that the new product dgx_680 would have a discount percentage of 30%. 
Write the statement that will update the product in the database. 
*/

UPDATE Products
	SET DiscountPercent = 30
WHERE ProductCode = 'dgx_680';
/* Why use the product code instead of the ID? I didn't want to assume what the ID would be,
as that would be untenable in a bigger database with perhaps hundreds or thousands of products.
But I've been given the product code, and I can safely assume that it's still sufficiently unique. */

SELECT TOP 5 * FROM Products
	ORDER BY ProductID DESC;

/*5.	A new customer needs to be added to the database so that their orders can be tracked. 
Add the following customer to the Guitar Shop’s list:

EmailAddress:	john.snyder@microsoft.com
Password:	(empty string)
FirstName:	John
LastName:	Snyder
*/

INSERT INTO Customers
	(EmailAddress, Password, FirstName, LastName)
VALUES ('john.snyder@microsoft.com', '', 'John', 'Snyder');

SELECT TOP 5 * FROM Customers
ORDER BY CustomerID DESC;