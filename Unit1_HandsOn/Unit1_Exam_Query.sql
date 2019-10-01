USE dj0803805;
GO

/*1.	Write a SELECT statement that returns these columns from the Orders table:
OrderID		The OrderID column
OrderDate	The OrderDate column
ShipDate	The ShipDate column
Return only the rows where the ShipDate column contains a null value.
*/

SELECT OrderID,
	OrderDate,
	ShipDate
	FROM Orders
	WHERE ShipDate IS NULL;

/*2.	Write a SELECT statement that answers this question: Which customers have ordered more than one product? 
Return these columns:
The email address from the Customers table
The count of distinct products from the customer’s orders
*/

SELECT DISTINCT Customers.EmailAddress AS [E-Mail],
	COUNT(DISTINCT OrderItems.ProductID) AS [Distinct Products Ordered]
	FROM Customers JOIN Orders
		ON Customers.CustomerID = Orders.CustomerID
		JOIN OrderItems
			ON Orders.OrderID = OrderItems.OrderID
GROUP BY Customers.EmailAddress;

/*3.	Write a SELECT statement that answers this question: 
Which products have a list price that’s less than the average list price for all products?
Return the ProductName and ListPrice columns for each product.
Sort the results by the ListPrice column in descending sequence.
*/

SELECT ProductName AS [Product], 
	ListPrice AS [Listed Price] 
	FROM Products
	WHERE ListPrice < 
	(SELECT AVG(ListPrice) FROM Products)
ORDER BY ListPrice DESC;