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
FROM Sales.Orders;           -- this query gives error

SELECT col1, col2
FROM dbo.T1
WHERE col1 <> 0 AND col2/col1 > 2;  -- this query gives error

SELECT col1, col2
FROM dbo.T1
WHERE
CASE
WHEN col1 = 0 THEN 'no' -- or 'yes' if row should be returned
WHEN col2/col1 > 2 THEN 'yes'
ELSE 'no'
END = 'yes';

SELECT col1, col2
FROM dbo.T1
WHERE (col1 > 0 AND col2 > 2*col1) OR (col1 < 0 AND col2 < 2*col1);


SELECT
orderid,
YEAR(orderdate) AS orderyear
FROM Sales.Orders;


SELECT custid, country, region, city,
country + N',' + region + N',' + city AS location
FROM Sales.Customers;

SELECT custid, country, region, city,
country + COALESCE( N',' + region, N'') + N',' + city AS location
FROM Sales.Customers;

SELECT custid, country, region, city,
CONCAT(country, N',' + region, N',' + city) AS location
FROM Sales.Customers;

SELECT empid, lastname
FROM HR.Employees
WHERE lastname LIKE N'D%';

SELECT empid, lastname
FROM HR.Employees
WHERE lastname LIKE N'_e%';

SELECT empid, lastname
FROM HR.Employees
WHERE lastname LIKE N'[ABC]%';

SELECT empid, lastname
FROM HR.Employees
WHERE lastname LIKE N'[A-E]%';

SELECT empid, lastname
FROM HR.Employees
WHERE lastname LIKE N'[^A-E]%';

SELECT orderid, custid, empid, orderdate
FROM Sales.Orders
WHERE orderdate = '20070212';

SELECT orderid, custid, empid, orderdate
FROM Sales.Orders
WHERE orderdate = CAST('20070212' AS DATETIME);


SELECT CAST('02/12/2007' AS smalldatetime);

SELECT CAST('12:30:15.123' AS DATETIME);

SELECT
DATEFROMPARTS(2012, 02, 12),
DATETIME2FROMPARTS(2012, 02, 12, 13, 30, 5, 1, 7),
DATETIMEFROMPARTS(2012, 02, 12, 13, 30, 5, 997),
DATETIMEOFFSETFROMPARTS(2012, 02, 12, 13, 30, 5, 1, -8, 0, 7),
SMALLDATETIMEFROMPARTS(2012, 02, 12, 13, 30),
TIMEFROMPARTS(13, 30, 5, 1, 7);


SELECT SCHEMA_NAME(schema_id) AS table_schema_name, name AS table_name
FROM sys.tables;


EXEC sys.sp_columns
@table_name = N'Orders',
@table_owner = N'Sales';

select * from Sales.Orders

EXEC sys.sp_helpconstraint
@objname = N'Sales.Orders';

select Sales.Orders.orderid , Sales.Orders.orderdate, Sales.Orders.custid, Sales.Orders.empid 
from Sales.Orders where Year(Sales.Orders.orderdate) = '200706' 

SELECT orderid, orderdate, custid, empid
FROM Sales.Orders
WHERE (orderdate) = 2014

SELECT orderid, orderdate, custid, empid
FROM Sales.Orders
WHERE orderdate = EOMONTH(orderdate);

SELECT HR.Employees.empid, 
HR.Employees.firstname, 
HR.Employees.lastname 
from HR.Employees
WHERE (LEN(HR.Employees.lastname) - LEN(REPLACE(HR.Employees.lastname, 'e', ''))) > 1

SELECT empid, firstname, lastname
FROM HR.Employees
WHERE lastname LIKE '%e%e%';


select * from Sales.OrderDetails

select * from Sales.Orders

select *, (unitprice * qty) as totalIncome from Sales.OrderDetails 
Where (unitprice * qty ) > 10000

select Count(*) order_count, orderid, sum(unitprice * qty) as total_income from Sales.OrderDetails 
group by orderid having (sum(unitprice * qty)) > 10000 order by total_income

select COUNT(*) as ships_to_country,shipcountry from Sales.Orders group by shipcountry

select Top 3 shipcountry, AVG(freight) as avg_freightt from Sales.Orders where YEAR(orderdate) = 2017 group by shipcountry

SELECT TOP (3) shipcountry, AVG(freight) AS avgfreight
FROM Sales.Orders
WHERE orderdate >= '20140101' AND orderdate < '20150101'
GROUP BY shipcountry
ORDER BY avgfreight DESC;

SELECT shipcountry, AVG(freight) AS avgfreight
FROM Sales.Orders
WHERE orderdate >= '20070101' AND orderdate < '20080101'
GROUP BY shipcountry
ORDER BY avgfreight DESC
OFFSET 0 ROWS FETCH FIRST 3 ROWS ONLY;


