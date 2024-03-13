/*markdown
this is the second half of chapter 5
*/

USE ZAGIDB;

/* Create View Statement 1 */

CREATE VIEW products_more_than_3_sold AS
SELECT productid, productname, productprice
FROM product
WHERE productid IN
	(SELECT productid
	FROM includes
	GROUP BY productid
	HAVING SUM(quantity) > 3);

/* Query 30a */

SELECT *
FROM products_more_than_3_sold;

/* Create View Statement 2 */

CREATE VIEW products_in_multiple_trnsc AS
SELECT productid, productname, productprice
FROM product
WHERE productid IN
	(SELECT productid
	FROM includes
	GROUP BY productid
	HAVING COUNT(*) > 1);

/* Query 31a */

SELECT *
FROM products_in_multiple_trnsc;

/* Query 37 */

SELECT *
FROM products_more_than_3_sold
UNION
SELECT *
FROM products_in_multiple_trnsc;

/* Query 38 */

SELECT *
FROM products_more_than_3_sold
INTERSECT
SELECT *
FROM products_in_multiple_trnsc;

/* Query 39 */

SELECT *
FROM products_more_than_3_sold
EXCEPT
SELECT *
FROM products_in_multiple_trnsc;

/* Query 40 */

USE HAFH;

SELECT c.ccname AS client, r.ccname AS recommender
FROM corpclient c, corpclient r
WHERE r.ccid = c.ccidreferredby;

/* Query 41 */

SELECT a.buildingid, a.aptno, c.ccname
FROM apartment a, corpclient c
WHERE a.ccid = c.ccid;

/* Query 41alt1 */

SELECT a.buildingid, a.aptno, c.ccname
FROM apartment a JOIN corpclient c
ON a.ccid = c.ccid;

/* Query 41alt2 */

SELECT a.buildingid, a.aptno, c.ccname
FROM apartment a INNER JOIN corpclient c
ON a.ccid = c.ccid;

/* Query 42 */

SELECT a.buildingid, a.aptno, c.ccname
FROM apartment a LEFT OUTER JOIN corpclient c
ON a.ccid = c.ccid;

/* Query 43 */

SELECT a.buildingid, a.aptno, c.ccname
FROM apartment a RIGHT OUTER JOIN corpclient c
ON a.ccid = c.ccid;

/* Query 44 */

SELECT a.buildingid, a.aptno, c.ccname
FROM apartment a FULL OUTER JOIN corpclient c
ON a.ccid = c.ccid;

/* Query 45 */

SELECT m.managerid, m.mfname, m.mlname, s.smemberid
FROM manager m, staffmember s
WHERE m.mfname = s.smembername;

/* Query 46 */

SELECT *
FROM manager
WHERE mbonus IS NULL;

/* Query 47 */

SELECT *
FROM corpclient c
WHERE EXISTS
	(SELECT *
	FROM apartment a
	WHERE c.ccid = a.ccid);

/* Query 48 */

SELECT *
FROM corpclient c
WHERE NOT EXISTS
	(SELECT *
	FROM apartment a
	WHERE c.ccid = a.ccid);

/* Query 47alt1 */

SELECT *
FROM corpclient c
WHERE c.ccid IN
	(SELECT cc.ccid
	FROM apartment a, corpclient cc
	WHERE cc.ccid = a.ccid);

/* Query 47alt2 */

SELECT DISTINCT c.ccid, c.ccname, c.ccindustry, c.cclocation, c.ccidreferredby
FROM corpclient c, apartment a
WHERE c.ccid =a.ccid;

/* Create Table Statement 1 */

CREATE TABLE cleaningdenormalized
( 	buildingid 	CHAR(3) 	NOT NULL,
	aptno 		CHAR(5) 	NOT NULL,
	smemberid 	CHAR(4) 	NOT NULL,
	smembername 	VARCHAR(15) 	NOT NULL,
	PRIMARY KEY (buildingid, aptno, smemberid));

/* Insert Statement 2 */

INSERT INTO cleaningdenormalized
SELECT c.buildingid, c.aptno, s.smemberid, s.smembername
FROM cleaning c, staffmember s
WHERE c.smemberid = s.smemberid;

USE ZAGIDB;

/* SQL Query A */
SELECT productid, productname, productprice
FROM product
WHERE productid IN
	(SELECT productid
	FROM includes
	GROUP BY productid
	HAVING SUM(quantity) > 3);

/* SQL Query B */
SELECT productid, productname, productprice
FROM product
WHERE productid IN ('3X3','4X4');