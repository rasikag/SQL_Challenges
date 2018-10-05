

-- the following code returns the number of distinct (different) customers 
-- handled by each employee in each order year.


Select * from Sales.Orders

select empid, custid, orderdate from Sales.Orders order by empid, custid

select count(distinct custid) as _distinct_custermers, 
YEAR(orderdate) as _order_year, 
empid 
from Sales.Orders
group by empid, Year(orderdate)
order by empid, custid

-- customer_count | year | emp_id
-- 10				2014     1
-- 13				2015	 1

