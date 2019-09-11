USE dj0803805;
GO

/*
1.	Our company needs a listing of each product we sell. Create a query that shows the Category Name, 
Product Name, Description, and Price for each Product. Sort the result set by the Category Name 
and then by the Product Name, in ascending order.
*/
SELECT Categories.CategoryName,
	Products.ProductName,
	Products.Description,
	Products.ListPrice AS [Listed Price],
	Products.ListPrice * (DiscountPercent / 100) AS [Discounted Price]
	FROM Products JOIN Categories
		ON Products.CategoryID = Categories.CategoryID
	ORDER BY Categories.CategoryName ASC, Products.ProductName ASC;

/*
2.	We need to mail an invoice to each one of our customers. 
Create a query that contains the First Name, Last Name, and full mailing address information (Street, City, State, Zip Code). 
Make sure to use billing addresses and not shipping addresses. 
*/
SELECT TOP 8 Customers.LastName + ', ' + Customers.FirstName AS [Name],
	Addresses.Line1 + ' ' + Addresses.Line2 + ' / ' + Addresses.City + ', ' + Addresses.State  + ' / ' + Addresses.ZipCode AS [Billing Address]
	FROM Orders JOIN Customers
		ON Orders.CustomerID = Customers.CustomerID
		JOIN Addresses
			ON Orders.BillingAddressID = Addresses.AddressID;

/*
3.	Our company needs to generate a list of customer sales. 
Create a query for the report that shows the first and last name of the customer, the date of the order, 
the name of the product they ordered, the price of the item, and the quantity. 
Sort the result set by the customer’s last name. Demonstrate the use of aliases for the tables.
*/
SELECT TOP 8 Customers.LastName + ', ' + Customers.FirstName AS [Name],
	CONCAT(OrderItems.ProductID, ': ') + Products.ProductName AS [ID: Name],
	OrderItems.ItemPrice AS [Base Price],
	OrderItems.Quantity,
	(OrderItems.ItemPrice - OrderItems.DiscountAmount) * OrderItems.Quantity AS [Total Price],
	Orders.OrderDate AS [Date Ordered]
	FROM Orders JOIN Customers
		ON Customers.CustomerID = Orders.CustomerID
		JOIN OrderItems
			ON Orders.OrderID = OrderItems.OrderID
			JOIN Products
				ON OrderItems.ProductID = Products.ProductID
	ORDER BY Name ASC;