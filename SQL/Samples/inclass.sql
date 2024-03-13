USE ZAGIDB;

SELECT productid, (select productname FROM product where @productid = productid ) as 'test stuff'
FROM product;

