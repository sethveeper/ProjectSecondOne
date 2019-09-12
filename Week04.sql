USE dj0803805;
GO

/*1. You are building a report of information on current orders. 
Create a query that shows the number of orders placed and 
the total amount collected in shipping fees.
*/

SELECT COUNT(*) AS [Orders Placed],
	FORMAT(SUM(ShipAmount), 'C') AS [Shipping Fees]
	FROM Orders;


/*2. A manager wants to know the email address, number of orders, 
and the total amount of purchases made by each customer. Create 
a summary query that returns these three items for each 
customer that has orders. 

Hint: The total is the price minus the discount, 
multiplied by the quantity.
*/

SELECT Customers.EmailAddress AS [Email],
	COUNT(Orders.OrderID) AS [Total Orders],
	FORMAT(SUM((OrderItems.ItemPrice - OrderItems.DiscountAmount) * OrderItems.Quantity), 'C') AS [Total Purchases]
	FROM Orders JOIN Customers
		ON Orders.CustomerID = Customers.CustomerID
		JOIN OrderItems
			ON Orders.OrderID = OrderItems.OrderID
	GROUP BY Customers.EmailAddress;

/*3. Your accounting department needs to know the total amount ordered 
for each product in the Guitar Shop. They want a report with the product’s 
name and the total dollar amount for each product.
*/

SELECT DISTINCT Products.ProductID,
	Products.ProductName,
	SUM(OrderItems.Quantity) AS [Quantity Purchased],
	FORMAT(SUM((OrderItems.ItemPrice - OrderItems.DiscountAmount) * OrderItems.Quantity) , 'C') AS [Total Spent]
	FROM Products RIGHT JOIN OrderItems
		ON Products.ProductID = OrderItems.ProductID
	GROUP BY Products.ProductID, Products.ProductName
	ORDER BY Products.ProductID;

/*4. During a meeting you are asked to find out which customers have ordered 
more than one product. Create a query that returns the email address and 
the number of distinct products from the customer’s orders. 
*/
