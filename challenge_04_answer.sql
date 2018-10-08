select orderid,
val,
CASE 
	WHEN val < 1000THEN 'less than 1000'
	WHEN val BETWEEN 1000.00 AND 3000.00 THEN 'between 1000 and 3000'
	WHEN val > 3000 THEN 'more than 3000' 
	ELSE 'unknown range'
END AS val_description
from [Sales].[OrderValues]
