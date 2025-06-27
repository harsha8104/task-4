-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    City VARCHAR(50)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    Amount DECIMAL(10, 2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (CustomerID, Name, Email, Phone, City) VALUES
(1, 'Alice Johnson', 'alice.j@example.com', '111-111-1111', 'New York'),
(2, 'Bob Smith', 'bob.s@example.com', '222-222-2222', 'Los Angeles'),
(3, 'Charlie Lee', 'charlie.l@example.com', '333-333-3333', 'Chicago'),
(4, 'Diana Prince', 'diana.p@example.com', '444-444-4444', 'Houston'),
(5, 'Ethan Brown', 'ethan.b@example.com', '555-555-5555', 'Phoenix'),
(6, 'Fiona Green', 'fiona.g@example.com', '666-666-6666', 'Philadelphia'),
(7, 'George King', 'george.k@example.com', '777-777-7777', 'San Antonio'),
(8, 'Hannah White', 'hannah.w@example.com', '888-888-8888', 'San Diego'),
(9, 'Ian Black', 'ian.b@example.com', '999-999-9999', 'Dallas'),
(10, 'Julia Adams', 'julia.a@example.com', '000-000-0000', 'San Jose');

INSERT INTO Orders (OrderID, OrderDate, Amount, CustomerID) VALUES
(101, '2025-06-01', 250.75, 1),
(102, '2025-06-02', 180.50, 2),
(103, '2025-06-03', 99.99, 3),
(104, '2025-06-04', 340.00, 4),
(105, '2025-06-05', 75.25, 5),
(106, '2025-06-06', 199.99, 1),
(107, '2025-06-07', 420.10, 6),
(108, '2025-06-08', 310.75, 7),
(109, '2025-06-09', 89.90, 8),
(110, '2025-06-10', 150.60, 9),
(111, '2025-06-11', 280.45, 10),
(112, '2025-06-12', 315.20, 2),
(113, '2025-06-13', 129.99, 3),
(114, '2025-06-14', 219.95, 4),
(115, '2025-06-15', 50.00, 5),
(116, '2025-06-16', 350.70, 6),
(117, '2025-06-17', 100.00, 7),
(118, '2025-06-18', 75.50, 8),
(119, '2025-06-19', 190.80, 9),
(120, '2025-06-20', 225.35, 10);

SELECT 
    o.OrderID,
    o.OrderDate,
    o.Amount,
    c.Name AS CustomerName,
    c.City
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.OrderID;




-- Get customers from 'Delhi' and sort by name
SELECT Name, City 
FROM Customers
WHERE City = 'Delhi'
ORDER BY Name;

-- Group total order amount per customer
SELECT CustomerID, SUM(Amount) AS TotalSpent
FROM Orders
GROUP BY CustomerID
ORDER BY TotalSpent DESC;


-- INNER JOIN: Customers with orders
SELECT c.Name, o.OrderID, o.Amount
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

-- LEFT JOIN: All customers, including those with no orders
SELECT c.Name, o.OrderID, o.Amount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- RIGHT JOIN: All orders, including those not linked to a customer (rare, but possible)
SELECT c.Name, o.OrderID, o.Amount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;










-- Customers who spent more than average order amount


-- Average order value
SELECT AVG(Amount) AS AverageOrderValue FROM Orders;

-- Total amount spent by each customer
SELECT CustomerID, SUM(Amount) AS TotalSpent
FROM Orders
GROUP BY CustomerID;


-- View for customer spending summary
CREATE VIEW Customer_Spending AS
SELECT c.CustomerID, c.Name, SUM(o.Amount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name;


SELECT * FROM CustomerSpending WHERE TotalSpent > 100;

-- Add indexes to speed up common queries
CREATE INDEX idx_customer_city ON Customers(City);
CREATE INDEX idx_order_customer ON Orders(CustomerID);
CREATE INDEX idx_order_date ON Orders(OrderDate);


