

-- 1. CREATE TABLE AND DISPLAY SCHEMA


CREATE TABLE Sales (
    SaleID INT,
    Product VARCHAR(50),
    Category VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2)
);

INSERT INTO Sales VALUES
(1, 'Laptop', 'Electronics', 2, 50000),
(2, 'Phone', 'Electronics', 3, 20000),
(3, 'Chair', 'Furniture', 5, 3000),
(4, 'Table', 'Furniture', 2, 8000),
(5, 'Laptop', 'Electronics', 1, 50000);

PRINT '1. SALES TABLE SCHEMA';
EXEC sp_help 'Sales';

SELECT * FROM Sales;



-- 2. FILTERING, GROUPING AND AGGREGATION


PRINT '2. FILTERING';
SELECT * FROM Sales
WHERE Price > 10000;

PRINT 'GROUPING AND AGGREGATION';
SELECT Category,
       COUNT(*) AS TotalProducts,
       SUM(Quantity) AS TotalQuantity,
       AVG(Price) AS AveragePrice
FROM Sales
GROUP BY Category;



-- 3. REMOVE DUPLICATE RECORDS


CREATE TABLE DuplicateData (
    ID INT,
    Name VARCHAR(50)
);

INSERT INTO DuplicateData VALUES
(1, 'Rahul'),
(2, 'Priya'),
(1, 'Rahul'),
(3, 'Amit'),
(2, 'Priya');

WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY ID, Name
               ORDER BY ID
           ) AS RowNum
    FROM DuplicateData
)
DELETE FROM CTE
WHERE RowNum > 1;

PRINT '3. DATA AFTER REMOVING DUPLICATES';
SELECT * FROM DuplicateData;



-- 4. JOIN TWO DATASETS


CREATE TABLE Customers (
    CustomerID INT,
    CustomerName VARCHAR(50)
);

INSERT INTO Customers VALUES
(1, 'Rahul'),
(2, 'Priya'),
(3, 'Amit');

CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    Amount DECIMAL(10,2)
);

INSERT INTO Orders VALUES
(101, 1, 5000),
(102, 2, 8000),
(103, 1, 3000);

PRINT '4. CUSTOMER AND ORDER JOIN';
SELECT Customers.CustomerName,
       Orders.OrderID,
       Orders.Amount
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;



-- 5. AVERAGE SALES BY PRODUCT CATEGORY

PRINT '5. AVERAGE SALES BY CATEGORY';

SELECT Category,
       AVG(Quantity * Price) AS AverageSales
FROM Sales
GROUP BY Category;

PRINT 'ALL FIVE PRACTICALS COMPLETED';