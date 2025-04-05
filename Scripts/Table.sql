-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Contact VARCHAR(20)
);

-- Create MenuItems table
CREATE TABLE MenuItems (
    ItemID INT PRIMARY KEY,
    Name VARCHAR(100),
    Price DECIMAL(10, 2),
    Category VARCHAR(50)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    ItemID INT,
    Quantity INT,
    OrderDate DATE,
    TotalPrice DECIMAL(10, 2),
    PRIMARY KEY (OrderID, ItemID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ItemID) REFERENCES MenuItems(ItemID)
);
-- Insert Customers
INSERT INTO Customers VALUES 
(1, 'Alice', '1234567890'),
(2, 'Bob', '9876543210'),
(3, 'Charlie', '5554443333');

-- Insert MenuItems
INSERT INTO MenuItems VALUES 
(101, 'Burger', 5.99, 'Fast Food'),
(102, 'Pizza', 8.99, 'Fast Food'),
(103, 'Salad', 4.50, 'Healthy'),
(104, 'Pasta', 7.00, 'Italian'),
(105, 'Sushi', 12.00, 'Japanese');

-- Insert Orders
INSERT INTO Orders VALUES 
(1001, 1, 101, 2, '2025-03-29', 11.98),
(1001, 1, 102, 1, '2025-03-29', 8.99),
(1002, 2, 103, 3, '2025-04-01', 13.50),
(1003, 3, 104, 1, '2025-04-02', 7.00),
(1004, 1, 105, 2, '2025-04-03', 24.00),
(1005, 2, 101, 1, '2025-04-04', 5.99),
(1006, 2, 101, 2, '2025-04-05', 11.98),
(1007, 3, 103, 1, '2025-04-05', 4.50),
(1008, 3, 102, 1, '2025-04-06', 8.99);
