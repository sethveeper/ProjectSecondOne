USE dj0803805;
GO

-- This statement shows all the customers affected, how many #2's where ordered,
-- and when they were shipped out.
SELECT 
	Orders.OrderID AS [Order ID],
	Customers.LastName + ', ' + Customers.FirstName AS [Customer Name], 
	OrderItems.Quantity AS [Quantity Purchased],
	Orders.ShipDate AS [Date Shipped]
	FROM Orders JOIN OrderItems
		ON Orders.OrderID = OrderItems.OrderID
		JOIN Customers
			ON Orders.CustomerID = Customers.CustomerID
	WHERE ProductID = 2
	ORDER BY Orders.ShipDate DESC;

-- This one only shows the total number of customers affected, 
-- the total number of #2's purchased by them,
-- and the total amount spent this way.
SELECT COUNT(Orders.OrderID) AS [Number of Customers Affected],
	SUM(OrderItems.Quantity) AS [Total Amount of #2's purchased],
	FORMAT(SUM(OrderItems.ItemPrice * OrderItems.Quantity), 'C') AS [Total Cost]
	FROM Orders JOIN OrderItems
		ON Orders.OrderID = OrderItems.OrderID
		JOIN Customers
			ON Orders.CustomerID = Customers.CustomerID
	WHERE ProductID = 2;

-- This one returns the mailing addresses involved.
SELECT 
	Orders.OrderID AS [Order ID],
	Customers.LastName + ', ' + Customers.FirstName AS [Customer Name],
	Line1 + ', ' + Line2 + ', ' + City + ', ' + State + ' ' + ZipCode AS [Shipping Address]
	FROM Orders JOIN OrderItems
		ON Orders.OrderID = OrderItems.OrderID
		JOIN Customers
			ON Orders.CustomerID = Customers.CustomerID
			JOIN Addresses
				ON Orders.ShipAddressID = Addresses.AddressID
	WHERE OrderItems.ProductID = 2
	ORDER BY Orders.ShipDate DESC;