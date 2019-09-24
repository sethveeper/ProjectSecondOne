/*All queries written for Chapter 6 exercises must be created 
using subqueries and not joins.  The use of joins will result 
in a zero for the exercise.
*/
USE dj0803805;
GO

/*1.	Your accounting department has asked: 
Which products have a list price thatís greater than the 
average list price for all products? Create a report that 
contains the name of the product and the list price for each item. 
The report should be sorted by price, descending. 
*/
SELECT ProductName, ListPrice FROM Products
	WHERE ListPrice > 
	(SELECT AVG(ListPrice) FROM Products)
ORDER BY ListPrice DESC;

/*2.	A manager asks how many categories are available that have 
no related products. Write a subquery that gets a list of these categories. 
Note: Use the NOT EXISTS operator
*/
SELECT * FROM Categories
	WHERE NOT EXISTS
	(SELECT * FROM Products
		WHERE Categories.CategoryID = Products.CategoryID);

/*3.	You are writing a report on wholesale prices and need to know 
the how many discount percentages are in use by only one product. 
Write a query that returns those unique discount percentages and 
the associated product name.
*/

-- I'm a little stuck on this one. This query
-- returns the number of products per discount type,
-- but not their names, and it doesn't eliminate any altogether.
SELECT COUNT(ProductID) AS [Instances],
	DiscountPercent
	FROM Products
GROUP BY DiscountPercent;


/*4.	An account manager is trying to find out his customerís oldest orders. 
Create a query for the report that will return one row per customer that 
contains the customerís full name as a single column, customerís email address, 
orderID, and OrderDate for the customerís oldest order.
*/

SELECT * FROM Customers;