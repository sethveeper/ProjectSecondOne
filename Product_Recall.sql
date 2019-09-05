USE dj0803805;
GO

SELECT 
	Orders.OrderID AS [Order ID],
	Customers.LastName + ', ' + Customers.FirstName AS [Customer Name], 
	OrderItems.Quantity AS [Quantity Purchased],
	Orders.ShipDate AS [Date Shipped]
	FROM Orders JOIN OrderItems
		ON Orders.OrderID = OrderItems.OrderID
		JOIN Customers
			ON Orders.CustomerID = Customers.CustomerID
	WHERE ProductID = 2;