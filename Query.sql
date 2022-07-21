CREATE TABLE STAFF (
    StaffID int NOT NULL PRIMARY KEY IDENTITY(1001,1),
    LastName varchar(30) NOT NULL,
    FirstName varchar(30),
    Birthday date,
	Gender char(1),
	PhoneNumber int UNIQUE
);

CREATE TABLE MANAGER (
	StaffID int NOT NULL PRIMARY KEY
);

CREATE TABLE WHOLESALER (
	WholesalerID int NOT NULL PRIMARY KEY IDENTITY(101,1),
	LastName varchar(30) NOT NULL,
    FirstName varchar(30),
	Birthdate date DEFAULT '01-01-1970',
	PhoneNumber nchar(13),
	Adress nchar(50)
);

CREATE TABLE PRODUCT (
	ProductID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	WholesalerID int NOT NULL,
	CargoID int NOT NULL,
	ProductName nchar(30),
	PurchaseDate date,
	ProductType nchar(30),
	Price decimal,
	Piece int
);

CREATE TABLE PAYMENT (
	PaymentID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	ProductID int NOT NULL,
	CustomerID int NOT NULL,
	PaymentType nchar(15),
	PaymentCheck char(1) DEFAULT 'n',
	Adress nchar(50),
	Piece int
);

CREATE TABLE CARGO (
	CargoID int NOT NULL PRIMARY KEY IDENTITY(101,1),
	DeliveryCheck char(1) DEFAULT 'n',
	CargoPrice decimal,
	ProductPrice decimal
);

CREATE TABLE CUSTOMER (
	CustomerID int NOT NULL PRIMARY KEY,
	LastName varchar(30) NOT NULL,
    FirstName varchar(30),
	Age int Check (Age>=18),
	PhoneNumber nchar(13),
	Gender char(1)
);

CREATE TABLE SERVICES (
	CustomerID int NOT NULL PRIMARY KEY,
	CargoID int NOT NULL,
	TypeOfService nchar(30) NOT NULL,
	DeliveryDate date,
	Price decimal,
	DeliveryCheck char(1) DEFAULT 'n',
	DeliveryAddress nchar(50)
);

--------------TRIGGER--------------

--CREATE TRIGGER purchase_date
--on PRODUCT
--after insert
--as
--begin
--	UPDATE PRODUCT
--	SET PurchaseDate = GETDATE()
--	FROM PRODUCT
--end

--create trigger control_piece
--on PAYMENT
--after insert as
--begin
--	declare @ProductID int
--	declare @Piece int
--	select @ProductID=ProductID, @Piece=piece from inserted
--	update PRODUCT set Piece=Piece-@Piece where ProductID=@ProductID
--end

--ALTER TABLE dbo.CARGO ADD TotalPrice AS (CargoPrice + ProductPrice)