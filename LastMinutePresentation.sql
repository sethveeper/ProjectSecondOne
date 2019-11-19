USE dj0803805;
GO

-- Set Rowcount demo
SET ROWCOUNT 5;
GO

SELECT * FROM Products;

-- Server Properties Demo
-- https://docs.microsoft.com/en-us/sql/t-sql/functions/serverproperty-transact-sql?view=sql-server-ver15
SELECT  @@SERVERNAME,
  SERVERPROPERTY('MachineName') AS ComputerName,
  SERVERPROPERTY('ServerName') AS InstanceName,  
  SERVERPROPERTY('Edition') AS Edition,
  SERVERPROPERTY('ProductVersion') AS ProductVersion,  
  SERVERPROPERTY('ProductLevel') AS ProductLevel;  
GO  

-- System User / Host Name demo
SELECT SYSTEM_USER AS [System User],
HOST_NAME() AS [Host Name];  
GO 