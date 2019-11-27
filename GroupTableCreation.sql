USE dj0803805
GO

-- Creating Tables

CREATE TABLE g_Patients
(
	PatientID			INT	NOT NULL IDENTITY (1, 1) PRIMARY KEY,
	NameFirst			VARCHAR(50),
	NameLast			VARCHAR(50),
	Address1			VARCHAR(50),
	Address2			VARCHAR(50),
	City				VARCHAR(50),
	[State]				VARCHAR(50),
	Zip					VARCHAR(50),
);


CREATE TABLE g_Invoices
(
	InvoiceID			INT	NOT NULL IDENTITY (1, 1) PRIMARY KEY,
	PatientID			INT NOT NULL REFERENCES g_Patients(PatientID),
	DateAdmitted		Date,
	DateDischarged		Date,
	DateBilled			Date,
	BalanceDue			DECIMAL,
	BalanceTotal		DECIMAL
);

CREATE TABLE g_Departments
(
	DepartmentID		INT	NOT NULL PRIMARY KEY,
	DepartmentName		VARCHAR(50)
);

CREATE TABLE g_Services
(
	ServiceID			INT	NOT NULL PRIMARY KEY,
	DepartmentID		INT NOT NULL REFERENCES g_Departments(DepartmentID),
	[Description]		VARCHAR(50),
	Cost				DECIMAL
);

CREATE TABLE g_InvoiceLineItems
(
	LineItemID			INT	NOT NULL IDENTITY (1, 1) PRIMARY KEY,
	InvoiceID			INT NOT NULL REFERENCES g_Invoices(InvoiceID),
	ServiceID			INT NOT NULL REFERENCES g_Services(ServiceID),
	DateAdded			Date,
	CostRecorded		DECIMAL
);
-- End of Creating Tables


-- Inserting Known Departments
INSERT INTO g_Departments
	VALUES(100, 'Room & Board')

INSERT INTO g_Departments
	VALUES(110, 'Laboratory')

INSERT INTO g_Departments
	VALUES(125, 'Radiology')

-- End of Inserting Departments


-- Inserting Known Services
	-- Department 100 Room & Board
INSERT INTO g_Services
	VALUES(2000, 100, 'Semi-prv room', 200.0)

INSERT INTO g_Services
	VALUES(2005, 100, 'Television', 5.0)

	-- Department 110 Laboratory
INSERT INTO g_Services
	VALUES(1580, 110, 'Glucose', 25.0)

INSERT INTO g_Services
	VALUES(1585, 110, 'Culture', 20.0)

	-- Department 125 Radiology
INSERT INTO g_Services
	VALUES(3010, 125, 'X-ray chest', 30.0)

-- End of Inserting Services


-- Inserting Patients
INSERT INTO g_Patients
	VALUES('Mary', 'Baker', '300 Oak Street', NULL, 'Boulder', 'CO', '80638')

INSERT INTO g_Patients
	VALUES('John', 'Maker', '8896 Goodman Road', NULL, 'Denver', 'CO', '80014')

INSERT INTO g_Patients
	VALUES('Colton', 'Smith', '125 Xenon Street', NULL, 'Broomfield', 'CO', '80234')

INSERT INTO g_Patients
	VALUES('Amy', 'Reed', '1653 Love Street', NULL, 'Loveland', 'CO', '80537')

-- End of Inserting Patients


-- Inserting Invoices
INSERT INTO g_Invoices
	VALUES(1, '7/14/08', '7/17/08', '7/20/08', 680.0, 680.0)

INSERT INTO g_Invoices
	VALUES(2, '2/08/11', '2/08/11', '2/12/11', 200.0, 200.0)

INSERT INTO g_Invoices
	VALUES(3, '6/5/14', '6/10/14', '6/18/14', 1265.0, 1265.0)

INSERT INTO g_Invoices
	VALUES(3, '7/17/14', '7/17/14', '7/23/14', 30.0, 30.0)

INSERT INTO g_Invoices
	VALUES(4, '10/24/15', '10/24/15', '11/01/15', 75.0, 75.0)

-- End of Inserting Invoices


-- Inserting InvoiceLineItems

-- Patient 1
-- InvoiceLineItems for Room & Board
INSERT INTO g_InvoiceLineItems
	VALUES(1, 2000, '7/14/08', 200.0)

INSERT INTO g_InvoiceLineItems
	VALUES(1, 2005, '7/14/08', 5.0)

INSERT INTO g_InvoiceLineItems
	VALUES(1, 2000, '7/15/08', 200.0)

INSERT INTO g_InvoiceLineItems
	VALUES(1, 2000, '7/16/08', 200.0)

	-- InvoiceLineItems for Laboratory
INSERT INTO g_InvoiceLineItems
	VALUES(1, 1580, '7/14/08', 25.0)

INSERT INTO g_InvoiceLineItems
	VALUES(1, 1585, '7/15/08', 20.0)

	-- InvoiceLineItems for Radiology
INSERT INTO g_InvoiceLineItems
	VALUES(1, 3010, '7/15/08', 30.0)


-- Patient 2
INSERT INTO g_InvoiceLineItems
	VALUES(2, 2000, '2/8/11', 200.0)


-- Patient 3
INSERT INTO g_InvoiceLineItems
	VALUES(3, 2000, '6/5/14', 200.0)

INSERT INTO g_InvoiceLineItems
	VALUES(3, 2005, '6/6/14', 5.0)

INSERT INTO g_InvoiceLineItems
	VALUES(3, 2000, '6/6/14', 200.0)

INSERT INTO g_InvoiceLineItems
	VALUES(3, 3010, '6/6/14', 30.0)

INSERT INTO g_InvoiceLineItems
	VALUES(3, 2000, '6/7/14', 200.0)

INSERT INTO g_InvoiceLineItems
	VALUES(3, 2000, '6/8/14', 200.0)

INSERT INTO g_InvoiceLineItems
	VALUES(3, 2000, '6/9/14', 200.0)

INSERT INTO g_InvoiceLineItems
	VALUES(3, 3010, '6/9/14', 30.0)

INSERT INTO g_InvoiceLineItems
	VALUES(3, 2000, '6/10/14', 200.0)

INSERT INTO g_InvoiceLineItems
	VALUES(4, 2000, '7/17/14', 30.0)


-- Patient 4
INSERT INTO g_InvoiceLineItems
	VALUES(5, 1580, '10/24/15', 25.0)
	
INSERT INTO g_InvoiceLineItems
	VALUES(5, 1585, '10/24/15', 20.0)
	
INSERT INTO g_InvoiceLineItems
	VALUES(5, 3010, '10/24/15', 30.0)

-- End of inserting InvoiceLineItems

SELECT  ALL g_Patients.PatientID,(NameFirst + ' ' + NameLast) AS PatientName,
		g_Invoices.InvoiceID,
		g_InvoiceLineItems.LineItemID, DateAdded,
		g_Services.ServiceID, [Description], CostRecorded,
		g_Departments.DepartmentID, DepartmentName
	FROM g_Patients
	JOIN g_Invoices ON g_Patients.PatientID = g_Invoices.PatientID
	JOIN g_InvoiceLineItems ON g_Invoices.InvoiceID = g_InvoiceLineItems.InvoiceID
	JOIN g_Services ON g_InvoiceLineItems.ServiceID = g_Services.ServiceID
	JOIN g_Departments ON g_Services.DepartmentID = g_Departments.DepartmentID
	ORDER BY PatientID

SELECT *
	FROM g_Patients
	JOIN g_Invoices ON g_Patients.PatientID = g_Invoices.PatientID
	JOIN g_InvoiceLineItems ON g_Invoices.InvoiceID = g_InvoiceLineItems.InvoiceID
	JOIN g_Services ON g_InvoiceLineItems.ServiceID = g_Services.ServiceID
	JOIN g_Departments ON g_Services.DepartmentID = g_Departments.DepartmentID
	ORDER BY g_Patients.PatientID