CREATE TABLE [DimCustomer](
	[CustomerID] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[NoHP] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY (CustomerID)
);

CREATE TABLE [DimProduct](
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](255) NOT NULL,
	[ProductCategory] [varchar](255) NOT NULL,
	[ProductUnitPrice] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY (ProductID)
);

CREATE TABLE [DimStatusOrder](
	[StatusID] [int] NOT NULL,
	[StatusOrder] [varchar](50) NOT NULL,
	[StatusOrderDesc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StatusOrder] PRIMARY KEY (StatusID)
);

CREATE TABLE [FactSalesOrder](
	[OrderID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
 CONSTRAINT [PK_SalesOrder] PRIMARY KEY (OrderID),
 CONSTRAINT [FK_Customer] FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID),
 CONSTRAINT [FK_Product] FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID),
 CONSTRAINT [FK_StatusOrder] FOREIGN KEY (StatusID) REFERENCES DimStatusOrder(StatusID)
);