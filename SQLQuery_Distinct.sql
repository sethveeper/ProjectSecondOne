USE dj0803805;
GO

SELECT DISTINCT VendorCity, VendorState
	FROM Vendors;
	-- We have comments!

	-- DISTINCT makes it so we only get one of each of
	-- a particular name, if there's more than one.
	-- (I think.)