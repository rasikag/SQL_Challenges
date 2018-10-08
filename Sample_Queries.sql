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