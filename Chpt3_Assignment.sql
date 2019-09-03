USE dj0803805;
GO

SELECT ProductCode AS Code, 
		ProductName AS Name, 
		ListPrice AS [Listed Price], 
		DiscountPercent AS Discount 
		FROM PRODUCTS
		ORDER BY ListPrice DESC;

SELECT LastName + ', ' + FirstName AS Name
		FROM Customers;