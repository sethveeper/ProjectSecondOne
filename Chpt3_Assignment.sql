USE dj0803805;
GO

-- Question 1
SELECT ProductCode AS Code, 
		ProductName AS [Product Name], 
		ListPrice AS [Listed Price], 
		DiscountPercent AS Discount 
		FROM PRODUCTS
		ORDER BY ListPrice DESC;

-- Question 2
SELECT LastName + ', ' + FirstName AS Name
		FROM Customers;

-- Question 3
SELECT ProductName AS [Product Name], 
		ListPrice AS [Listed Price], 
		DateAdded AS Date
		FROM PRODUCTS
		WHERE ListPrice > 500 AND ListPrice < 2000
		ORDER BY ListPrice DESC;

-- Question 4
SELECT ProductName AS [Product Name], 
		ListPrice AS [Listed Price], 
		DiscountPercent AS [Discount Percent],
		ListPrice * (DiscountPercent / 100) AS [Discount Amount],
		ListPrice - (ListPrice * (DiscountPercent / 100)) AS [Discount Price]
		FROM PRODUCTS;

-- Question 5
SELECT OrderID AS [Order ID], OrderDate AS [Order Date], ShipDate AS [Ship Date] 
	FROM Orders
	WHERE ShipDate IS NULL;