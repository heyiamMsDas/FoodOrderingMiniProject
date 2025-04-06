
-- Retrieve all orders placed by a specific customers 

SELECT o.OrderID, m.Name AS ItemName, o.Quantity, o.OrderDate, o.TotalPrice
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN MenuItems m ON o.ItemID = m.ItemID
WHERE c.Name = 'Alice';

-- Find the most popular menu item 


SELECT m.Name, SUM(o.Quantity) AS TotalOrdered
FROM Orders o
JOIN MenuItems m ON o.ItemID = m.ItemID
GROUP BY m.ItemID
ORDER BY TotalOrdered DESC
LIMIT 1;

-- Calculate total revenue generated from orders 



SELECT SUM(TotalPrice) AS TotalRevenue
FROM Orders;

-- List all menu items in a specific category 


SELECT * FROM MenuItems
WHERE Category = 'Fast Food';

-- Count numbers of orders placed in the last week 

SELECT COUNT(DISTINCT OrderID) AS OrdersLastWeek
FROM Orders
WHERE OrderDate >= CURRENT_DATE - INTERVAL 7 DAY;

-- Identify customers who placed the highest number of orders 

SELECT COUNT(DISTINCT OrderID) AS OrdersLastWeek
SELECT c.Name, COUNT(DISTINCT o.OrderID) AS TotalOrders
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalOrders DESC
LIMIT 1;

-- Find the average orders value per customers 

SELECT c.Name, AVG(OrderTotal.Total) AS AvgOrderValue
FROM (
    SELECT OrderID, CustomerID, SUM(TotalPrice) AS Total
    FROM Orders
    GROUP BY OrderID, CustomerID
) AS OrderTotal
JOIN Customers c ON OrderTotal.CustomerID = c.CustomerID
GROUP BY c.CustomerID;

-- Retrieve orders that included multiple items 


SELECT OrderID
FROM Orders
GROUP BY OrderID
HAVING COUNT(ItemID) > 1;

-- Get the total revenue for each menu category 


SELECT m.Category, SUM(o.TotalPrice) AS CategoryRevenue
FROM Orders o
JOIN MenuItems m ON o.ItemID = m.ItemID
GROUP BY m.Category;


-- identify the least ordered item

SELECT m.Name, SUM(o.Quantity) AS TotalOrdered
FROM Orders o
JOIN MenuItems m ON o.ItemID = m.ItemID
GROUP BY m.ItemID
ORDER BY TotalOrdered ASC
LIMIT 1;

