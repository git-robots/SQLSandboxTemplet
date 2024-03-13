/* Prior to executing the code in this file, the code in the following files must be executed: 	*/
/* SQLCodeCreatePopulate_ZAGI_SQLServer.txt and SQLCodeCreatePopulate_HAFH_SQLServer.txt 	*/
/* I.e. the code in this file works on created and populated ZAGI and HAFH databases	      	*/
/* The statements in this file are listed in the same order as in the textbook		      	*/
/* Contact Nenad Jukic at njukic@luc.edu with any questions or suggestions		      	*/


USE ZAGIDB;

/* Query 1 */

SELECT productid, productname, productprice, vendorid, categoryid
FROM product;

/* Query 1a */

SELECT *
FROM product;

/* Query 2 */

SELECT productname, productid, vendorid, categoryid, productprice
FROM product;

/* Query 3 */

SELECT productid, productprice
FROM product;

/* Query 3a */

SELECT productid, productprice, productprice * 1.1
FROM product;

/* Query 4 */

SELECT productid, productname, vendorid, productprice
FROM product
WHERE productprice > 100;

/* Query 5 */

SELECT productid, productname, vendorid, productprice
FROM product
WHERE productprice <= 110 AND categoryid = 'FW';

/* Query 6 */

SELECT vendorid
FROM product;

/* Query 7 */

SELECT DISTINCT vendorid
FROM product;

/* Query 8 */

SELECT productid, productname, categoryid, productprice
FROM product
WHERE categoryid = 'FW'
ORDER BY productprice;

/* Query 9 */

SELECT productid, productname, categoryid, productprice
FROM product
WHERE categoryid = 'FW'
ORDER BY productprice DESC;

/* Query 10 */

SELECT productid, productname, categoryid, productprice
FROM product
ORDER BY categoryid, productprice;

/* Query 11 */

SELECT *
FROM product
WHERE productname LIKE '%Boot%';

/* Query 12 */

SELECT AVG(productprice)
FROM product;

/* Query 13 */

SELECT COUNT(*)
FROM product;

/* Query 14 */

SELECT COUNT(DISTINCT vendorid)
FROM product;

/* Query 15 */

SELECT COUNT(*), AVG(productprice), MIN(productprice), MAX(productprice)
FROM product
WHERE categoryid = 'CP';

/* Query 16 */

SELECT vendorid, COUNT(*), AVG(productprice)
FROM product
GROUP BY vendorid;

/* Query 17 */

SELECT COUNT(*), AVG(productprice)
FROM product
GROUP BY vendorid;

/* Query 18 */

SELECT vendorid, COUNT(*)
FROM product
WHERE productprice >= 100
GROUP BY vendorid;

/* Query 19 */

SELECT vendorid, categoryid, COUNT(*), AVG(productprice)
FROM product
group BY vendorid, categoryid
ORDER BY  categoryid;

/* Query 20 */

SELECT productid, SUM(quantity)
FROM includes
GROUP BY productid;

/* Query 21 */

SELECT productid, COUNT(*)
FROM includes
GROUP BY productid;

/* Query 22 */

SELECT vendorid, categoryid, COUNT(*), AVG(productprice)
FROM product
GROUP BY vendorid, categoryid
HAVING COUNT(*) > 1;

/* Query 23 */

SELECT vendorid, categoryid, COUNT(*), AVG(productprice)
FROM product
WHERE productprice >= 50
GROUP BY vendorid, categoryid
HAVING COUNT(*) > 1;

/* Query 24 */

SELECT productid, SUM(quantity)
FROM includes
GROUP BY productid
HAVING SUM(quantity) > 3;

/* Query 25 */

SELECT productid, COUNT(*)
FROM includes
GROUP BY productid
HAVING COUNT(*) > 1;

/* Query 26 */

SELECT productid
FROM includes
GROUP BY productid
HAVING SUM(quantity) > 3;

/* Query 27 */

SELECT productid
FROM includes
GROUP BY productid
HAVING COUNT(*) > 1;

/* Query 28 */

SELECT productid, productname, productprice
FROM product
WHERE productprice < (SELECT AVG (productprice)
		      FROM product);

/* Query 29 */

SELECT productid, productname, productprice
FROM product
WHERE productid = '1X1' OR productid = '2X2'
OR productid = '3X3';

/* Query 29 alt */

SELECT productid, productname, productprice
FROM product
WHERE productid IN ('1X1', '2X2', '3X3');

/* Query 30 */

SELECT productid, productname, productprice
FROM product
WHERE productid IN
	(SELECT productid
	FROM includes
	GROUP BY productid
	HAVING SUM(quantity) > 3);

/* Query 31 */

SELECT productid, productname, productprice
FROM product
WHERE productid IN
	(SELECT productid
	FROM includes
	GROUP BY productid
	HAVING COUNT(tid) > 1);

/* Query 32 */

SELECT productid, productname, vendorname, productprice
FROM product, vendor
WHERE product.vendorid = vendor.vendorid;

/* Query 33 */

SELECT productid, productname, vendorname, productprice
FROM product, vendor;

/* Query 34 */

SELECT *
FROM product, vendor;

/* Query 35 */

SELECT *
FROM product, vendor
WHERE product.vendorid = vendor.vendorid;

/* Query 32a */

SELECT p.productid, p.productname, v.vendorname, p.productprice
FROM product p, vendor v
WHERE p.vendorid = v.vendorid;

/* Query 32b */

SELECT p.productid pid, p.productname pname, v.vendorname vname, p.productprice pprice
FROM product p, vendor v
WHERE p.vendorid = v.vendorid;

/* Query 32c */

SELECT p.productid AS pid, p.productname
AS pname,v.vendorname AS vname,
p.productprice AS pprice
FROM product p, vendor v
WHERE p.vendorid = v.vendorid;

/* Query 36 */

SELECT t.tid, t.tdate, p.productname, i.quantity, (i.quantity * p.productprice) AS amount
FROM product p, salestransaction t, includes i
WHERE i.productid = p.productid AND i.tid = t.tid
ORDER BY t.tid;

/* Alter Statement 1 */

ALTER TABLE vendor ADD vendorphonenumber CHAR(12);
go
/* Alter Statement 2 */

ALTER TABLE vendor DROP COLUMN vendorphonenumber;
go;
/* Insert Statement 1 */

INSERT INTO product VALUES ('7X7','Airy Sock',1000,'MK','FW');

/* Update Statement 1 */

UPDATE product
SET productprice = 10
WHERE productid = '7X7';

/* Alter Statement 3 */

ALTER TABLE product ADD discount NUMERIC(2,2);
go;
/* Update Statement 2 */

UPDATE product 
SET discount = 0.2;

/* Update Statement 3 */

UPDATE product
SET discount = 0.3
WHERE vendorid = 'MK';

/* Alter Statement 4 */

ALTER TABLE product DROP COLUMN discount;
go
/* Delete Statement 1 */

DELETE FROM product
WHERE productid = '7X7';