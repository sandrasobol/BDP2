-- a)
SELECT OrderDate, COUNT(OrderDate) AS Order_cnt FROM FactInternetSales GROUP BY OrderDate HAVING COUNT (OrderDateKey) <100 ORDER BY Orders_cnt DESC; 

-- b)
SELECT a.OrderDate, a.UnitPrice FROM 
(SELECT OrderDate, UnitPrice, ROW_NUMBER() OVER(PARTITION BY OrderDate ORDER BY UnitPrice DESC) AS w
FROM FactInternetSales) a 
WHERE w<4 ORDER BY OrderDate;