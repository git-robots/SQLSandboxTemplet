USE ZAGIDB;

SELECT productid, productname, vendorid, productprice
FROM product
WHERE productprice <= 110 AND
              CATEGORYID = 'FW'
ORDER BY productprice DESC;
go

SELECT productid, productname, vendorid, productprice
FROM product
WHERE productprice <= 110 AND
              categoryid = 'FW' 
ORDER BY categoryid, productprice;
go

SELECT productid, productname, categoryid, vendorid, productprice
FROM product
ORDER BY categoryid, productprice;
go

-- AGGREGATE Functions

SELECT count(*)
FROM product;
go

SELECT AVG(productprice)
FROM product;
go

Select count(distinct vendorid)
From product;
go


-- Retrieve the number of products, average product price, lowest product price, and highest product price in the CP product category:

select count(*), avg(productprice), min(Productprice), max(productprice)
from product
where categoryid = 'CP';
go

-- To Specify Decimal Places:
-- Use ROUND:

select count(*), round(avg(productprice), 2), min(Productprice), max(productprice)
from product
where categoryid = 'CP';
go

-- or use TRUNC:

SELECT COUNT(*), left(AVG(productprice), len(AVG(productprice))-4) as "trim Avg" , MIN(Productprice), MAX(productprice)
from product
where categoryid = 'CP';
go