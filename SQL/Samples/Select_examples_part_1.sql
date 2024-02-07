USE ZAGIDB;

-- SELECT       <columns, expressions>
-- FROM        <table>

select * from product;
GO

select productid, productname, productPrice, productprice * 1.5 from product;
GO

select DISTINCT vendorid FROM product;
GO

-- A  WHERE clause determines which rows should be retrieved / not retrieved (depending on the values).

SELECT        productid, productname, vendorid, productprice
FROM          product
WHERE        productprice > 100;
GO

-- (other operators:  = Equal to, < Less than, > greater than, <= less than or equal to, >= greater than or equal to, != not equal to, <> not equal to

SELECT productid, productname, vendorid, productprice
FROM product
WHERE productprice <= 110 AND
              CATEGORYID = 'FW' 
ORDER BY productprice;
GO