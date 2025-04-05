SELECT o.OrderID, m.Name AS ItemName, o.Quantity, o.OrderDate, o.TotalPrice
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN MenuItems m ON o.ItemID = m.ItemID
WHERE c.Name = 'Alice';


SELECT m.Name, SUM(o.Quantity) AS TotalOrdered
FROM Orders o
JOIN MenuItems m ON o.ItemID = m.ItemID
GROUP BY m.ItemID
ORDER BY TotalOrdered DESC
LIMIT 1;


SELECT SUM(TotalPrice) AS TotalRevenue
FROM Orders;


SELECT * FROM MenuItems
WHERE Category = 'Fast Food';


SELECT COUNT(DISTINCT OrderID) AS OrdersLastWeek
FROM Orders
WHERE OrderDate >= CURRENT_DATE - INTERVAL 7 DAY;


SELECT COUNT(DISTINCT OrderID) AS OrdersLastWeek
SELECT c.Name, COUNT(DISTINCT o.OrderID) AS TotalOrders
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalOrders DESC
LIMIT 1;


SELECT c.Name, AVG(OrderTotal.Total) AS AvgOrderValue
FROM (
    SELECT OrderID, CustomerID, SUM(TotalPrice) AS Total
    FROM Orders
    GROUP BY OrderID, CustomerID
) AS OrderTotal
JOIN Customers c ON OrderTotal.CustomerID = c.CustomerID
GROUP BY c.CustomerID;


SELECT OrderID
FROM Orders
GROUP BY OrderID
HAVING COUNT(ItemID) > 1;


SELECT m.Category, SUM(o.TotalPrice) AS CategoryRevenue
FROM Orders o
JOIN MenuItems m ON o.ItemID = m.ItemID
GROUP BY m.Category;


SELECT m.Name, SUM(o.Quantity) AS TotalOrdered
FROM Orders o
JOIN MenuItems m ON o.ItemID = m.ItemID
GROUP BY m.ItemID
ORDER BY TotalOrdered ASC
LIMIT 1;

