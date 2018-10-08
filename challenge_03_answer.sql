SELECT * FROM Production.Products 

Inner join Production.Categories 
on Production.Products.categoryid = Production.Categories.categoryid

SELECT productid, productname, categoryid,
CASE categoryid 
	WHEN 1 THEN 'Beverages'
	WHEN 2 THEN 'Condiments'
	WHEN 3 THEN 'Confections'
	WHEN 4 THEN 'Dairy Products'
	WHEN 5 THEN 'Grains/Cereals'
	WHEN 6 THEN 'Meat/Poultry'
	WHEN 7 THEN 'Produce'
	WHEN 8 THEN 'Seafood'
	ELSE 'Unknown Category'
END AS categoryname
FROM Production.Products 



