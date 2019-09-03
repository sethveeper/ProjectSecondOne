USE dj0803805;
GO

SELECT ProductCode AS Code, 
		ProductName AS [Product Name], 
		ListPrice AS [Listed Price], 
		DiscountPercent AS Discount 
		FROM PRODUCTS
		ORDER BY ListPrice DESC;

SELECT LastName + ', ' + FirstName AS Name
		FROM Customers;
		
SELECT ProductName AS [Product Name], 
		ListPrice AS [Listed Price], 
		DateAdded AS Date
		FROM PRODUCTS
		WHERE ListPrice > 500 AND ListPrice < 2000
		ORDER BY ListPrice DESC;
		
SELECT ProductName AS [Product Name], 
		ListPrice AS [Listed Price], 
		DiscountPercent AS [Discount Percent],
		ListPrice * (DiscountPercent / 100) AS [Discount Amount],
		ListPrice - (ListPrice * (DiscountPercent / 100)) AS [Discount Price]
		FROM PRODUCTS;

SELECT OrderID, OrderDate, ShipDate 
	FROM Orders
	WHERE ShipDate IS NULL;