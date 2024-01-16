CREATE DATABASE ApplicationDB;
GO

USE ApplicationDB;
GO

CREATE TABLE dbo.Products
(
    Id INT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    Price DECIMAL(18,2) NOT NULL,
    CONSTRAINT PK_Products PRIMARY KEY CLUSTERED (Id ASC)
);
GO

INSERT INTO dbo.Products (Name, Price)  VALUES
('Widget', 25.00),
('Thingy', 15.00);  
GO









