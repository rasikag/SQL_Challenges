use TSQLV4

SELECT D3.digit * 100 + D2.digit * 10 + D1.digit + 1 AS n 
FROM 
dbo.Digits AS D1
CROSS JOIN dbo.Digits AS D2
CROSS JOIN dbo.Digits AS D3 ORDER BY n
