USE dj0803805;
GO

/*1.	Your accounting department needs a report on your wholesale prices. 
Write a query that gets the retail price for all items in the Guitar Shop. 
They also need to know the discount percentage that is being applied and 
the dollar amount that is being discounted for each item. Use the ROUND 
function to round each result to two decimal places. 
*/

SELECT ProductName,
	ListPrice,
	DiscountPercent,
	ROUND((ListPrice * (DiscountPercent / 100)), 2) AS [Discount Dollar Amount],
	ROUND((ListPrice - (ListPrice * (DiscountPercent / 100))), 2) AS [Retail Price]
	FROM Products;

/*2.	For a billing report, a query is needed that gets information 
about the date an order was placed. The report should contain the date 
the order was placed, a column that shows only the year the order was 
placed and, a column that shows only the month the order was placed. 
A final column needs to be added that shows the date the order invoice 
is due, which is 30 days from the order date. Use the functions 
appropriate for creating each column as requested.
*/

SELECT OrderID,
	OrderDate AS [Full Date],
	DATEPART(year, OrderDate) AS [Year],
	DATEPART(month, OrderDate) AS [Month],
	DATEADD(day, 30, OrderDate) AS [Invoice Due Date],
	DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), DAY(GETDATE())) AS [Today's Date]
	FROM Orders;

/*3.	Your billing department has decided that they want to display the 
customer’s credit card number on the order invoice. The credit card number 
should be obscured into the format of: XXXX-XXXX-XXXX-1234. In other words, 
use Xs for the first 12 digits of the card number and actual numbers for the 
last four digits of the number. For verification, your query should include 
the original card number and the number of digits the original card number contains.
*/

SELECT CustomerID,
	CardNumber AS [Original Number],
	STUFF(CardNumber, 1, (LEN(CardNumber) - 4), 'XXXX-XXXX-XXXX-') AS [Censored Number],
	LEN(CardNumber) AS [Number of Digits]
	FROM Orders
ORDER BY CustomerID;

/*4.	The management at your Guitar Shop has decided that all orders should be shipped 
within two days of the order being placed.  They need a report to see when orders should 
be shipped versus when they were shipped. Create the query that shows the order date, 
the date the order should be shipped and the actual ship date. They would also like a 
column that shows the number of days between the order date and the ship date for verification. 
*/

SELECT OrderID,
	FORMAT (OrderDate, 'd', 'en-US') AS [OrderDate],
	FORMAT (DATEADD(day, 2, OrderDate), 'd', 'en-US') AS [Required Ship Date],
	FORMAT (ShipDate, 'd', 'en-US') AS [Actual Ship Date],
	DATEDIFF(day, OrderDate, ShipDate) AS [Wait Time]
	FROM Orders;