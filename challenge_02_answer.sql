select Count(distinct custid) as _dist_cus_count,
Year(orderdate) as _order_year,
empid 
from Sales.Orders 
Group by empid, Year(orderdate)

SELECT
empid,
YEAR(orderdate) AS orderyear,
COUNT(DISTINCT custid) AS numcusts
FROM Sales.Orders
GROUP BY empid, YEAR(orderdate);

-- customer_count | year | emp_id
-- 10				2014     1
-- 13				2015	 1

