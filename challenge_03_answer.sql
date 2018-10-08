SELECT * FROM Production.Products 

Inner join Production.Categories 
on Production.Products.categoryid = Production.Categories.categoryid

SELECT productid, productname, categoryid,
CASE categoryid 
	WHEN 1 THEN 'Beverages'
	WHEN 2 THEN 'Condiments'
	WHEN 3 THEN ''
	WHEN 4 THEN ''
	WHEN 5 THEN ''
	WHEN 6 THEN ''
	WHEN 7 THEN ''
	WHEN 8 THEN ''
END AS categoryname
FROM Production.Products 

