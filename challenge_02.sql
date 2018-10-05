

-- the following code returns the number of distinct (different) customers 
-- handled by each employee in each order year.


Select * from Sales.Orders

select empid, 
Count(distinct custid), 
Year(orderdate) as _year 
from Sales.Orders 
order by empid, 
custid





-- customer_count | year | emp_id
-- 10				2014     1
-- 13				2015	 1

