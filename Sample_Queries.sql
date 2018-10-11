SELECT orderid, orderdate, custid, empid
FROM Sales.Orders
ORDER BY orderdate, orderid
OFFSET 50 ROWS FETCH NEXT 25 ROWS ONLY;

SELECT orderid, custid, val,
ROW_NUMBER() OVER(PARTITION BY custid
ORDER BY val) AS rownum
FROM Sales.OrderValues
ORDER BY custid, val;

SELECT orderid, productid, qty, unitprice, discount,
qty * unitprice * (1 - discount) AS val
FROM Sales.OrderDetails

SELECT orderid, custid, empid, orderdate
FROM Sales.Orders
WHERE
custid = 1
AND empid IN(1, 3, 5)
OR custid = 85
AND empid IN(2, 4, 6)

SELECT orderid, custid, empid, orderdate
FROM Sales.Orders
WHERE
custid IN (1,85)
AND empid IN(1, 3, 5,2, 4, 6)

SELECT orderid, custid, empid, orderdate
FROM Sales.Orders
WHERE
(custid = 1
AND empid IN(1, 3, 5))
OR
(custid = 85
AND empid IN(2, 4, 6))


SELECT TOP (5) orderid, orderdate, custid, empid
FROM Sales.Orders
ORDER BY orderdate DESC;

SELECT TOP (0.5) PERCENT orderid, orderdate, custid, empid
FROM Sales.Orders
ORDER BY orderdate DESC;

SELECT custid, country, region, city
FROM Sales.Customers
WHERE region = N'WA';

-- The following query attempts to return all customers for whom the region is different than WA.

SELECT custid, country, region, city
FROM Sales.Customers
WHERE region <> N'WA';

-- If you want to return all rows for which region is NULL, do not use the predicate region = NULL,
-- because the expression evaluates to UNKNOWN in all rows—both those in which the value is present
-- and those in which the value is missing (is NULL). The following query returns an empty set.

SELECT custid, country, region, city
FROM Sales.Customers
WHERE region IS NULL

SELECT custid, country, region, city
FROM Sales.Customers
WHERE region <> N'WA' or region IS NULL;

SELECT
orderid,
YEAR(orderdate) AS orderyear,
orderyear + 1 AS nextyear
FROM Sales.Orders;

