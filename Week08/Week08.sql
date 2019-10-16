USE dj0803805;
GO

/*1.	Your programming department is writing an application that displays 
the list prices for products in the Guitar Shop. The application needs the 
list price displayed four times: once as it’s regularly stored value, 
once as a decimal using CAST with one decimal place, once as an integer 
using CONVERT and once as an integer using CAST.
*/

SELECT ProductName,
	ListPrice AS [Stored Value],
	CAST(ListPrice AS DECIMAL(5, 1)) AS [Decimal (1 place)],
	CONVERT(INT, ListPrice) AS [Integer (CONVERT)],
	CAST(ListPrice AS INT) AS [Integer (CAST)]
	FROM Products;

/*2.	Your programming department also needs the date the product was 
added to the database for the application.  Write a query that gets the 
date added in three different ways so they can use it in their application. 
They need the date as it’s stored value, the date displayed in the Year, Month, Day 
format using CAST, the date with only the time displayed in 
Hour, Minutes, Seconds using CAST.  They also need the OrderDate column 
with just the Month and Day using CAST.
*/

/*3.	Your programming department also needs some information for their program 
from the Orders table. They need the date of the order in MM/DD/YYYY format using 
CONVERT, The date of the order with the date, with Hours and Minutes on a 12-hour 
clock that has an AM/PM indicator using CONVERT, and the date of the order with 
2-digit hours, minutes and seconds on a 24-hour clock using CONVERT. Use leading zeros 
for all date/time components. 
*/