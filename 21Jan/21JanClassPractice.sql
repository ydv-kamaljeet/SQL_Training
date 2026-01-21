
use TestDB;
-- Drop if already exists (safe rerun)
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL DROP TABLE dbo.Orders;
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL DROP TABLE dbo.Customers;

-- Customers table
CREATE TABLE dbo.Customers
(
    CustomerId   INT PRIMARY KEY,
    FullName     VARCHAR(100) NOT NULL,
    City         VARCHAR(50)  NOT NULL,
    Segment      VARCHAR(20)  NOT NULL,   -- Retail / Corporate
    IsActive     BIT          NOT NULL,
    CreatedOn    DATE         NOT NULL
);

-- Orders table
CREATE TABLE dbo.Orders
(
    OrderId      INT PRIMARY KEY,
    CustomerId   INT NOT NULL,
    OrderDate    DATE NOT NULL,
    Amount       DECIMAL(10,2) NOT NULL,
    Status       VARCHAR(20) NOT NULL,    -- Delivered/Cancelled/Pending
    PaymentMode  VARCHAR(20) NOT NULL,    -- UPI/Card/Cash
    CONSTRAINT FK_Orders_Customers
        FOREIGN KEY (CustomerId) REFERENCES dbo.Customers(CustomerId)
);

-- Insert Customers
INSERT INTO dbo.Customers (CustomerId, FullName, City, Segment, IsActive, CreatedOn) VALUES
(101, 'Gopi Suresh',   'Coimbatore', 'Retail',    1, '2025-11-12'),
(102, 'Anita Ravi',    'Chennai',    'Corporate', 1, '2025-10-05'),
(103, 'Karthik Mohan', 'Bengaluru',  'Retail',    1, '2025-09-15'),
(104, 'Meena Kumar',   'Chennai',    'Retail',    0, '2024-12-20'),
(105, 'Suresh Babu',   'Hyderabad',  'Corporate', 1, '2025-01-10');

-- Insert Orders
INSERT INTO dbo.Orders (OrderId, CustomerId, OrderDate, Amount, Status, PaymentMode) VALUES
(5001, 101, '2026-01-10', 1200.00, 'Delivered', 'UPI'),
(5002, 101, '2026-01-15',  850.00, 'Pending',   'Card'),
(5003, 102, '2026-01-05', 5000.00, 'Delivered', 'Card'),
(5004, 103, '2025-12-30',  300.00, 'Cancelled', 'Cash'),
(5005, 105, '2026-01-18', 2500.00, 'Delivered', 'UPI'),
(5006, 102, '2026-01-20', 1500.00, 'Pending',   'UPI');




/* 
   SELECT WITH ALIAS (Worked on different table)
 */

SELECT 
    t.Name AS Human_Name,
    t.Age  AS Human_Age
FROM TestTbl t;

/* 
   CROSS JOIN (OLD STYLE)
   Cartesian Product - Use carefully
 */

SELECT *
FROM Customers t1, Customers t2;

/*
   PRACTICE QUERIES
 */

-- Add constant column
SELECT 'ValidRecords' AS MyCol, *
FROM TestTbl;

-- Convert result to JSON
SELECT *
FROM TestTbl
FOR JSON AUTO;

-- Convert result to XML
SELECT *
FROM TestTbl
FOR XML AUTO;

-- Copy table structure & data
SELECT *
INTO CopyTl
FROM TestTbl;

-- Verify copied table
SELECT *
FROM CopyTbl;

-- Expression without table (SQL Server style)
SELECT 10 + 400 AS Result;



/* 
   WHERE CLAUSE EXAMPLES
 */

-- Equal
SELECT *
FROM Customers
WHERE Segment = 'corporate';

-- Not equal
SELECT *
FROM Customers
WHERE Segment <> 'corporate';

-- NOT keyword
SELECT *
FROM Customers
WHERE NOT Segment = 'corporate';

-- AND condition
SELECT *
FROM Customers
WHERE City = 'Pune'
  AND Segment = 'corporate';

-- OR condition
SELECT *
FROM Customers
WHERE City = 'Pune'
   OR Segment = 'corporate';

-- IN clause
SELECT *
FROM Customers
WHERE City IN ('Banglore', 'pune');

-- NOT IN clause
SELECT *
FROM Customers
WHERE City NOT IN ('Banglore', 'pune');

-- BETWEEN
SELECT *
FROM Orders
WHERE Amount BETWEEN 800 AND 1500;


select * from Customers where FullName like 'a%';

-- listing the ouput in descending order
select * from Orders order by Amount desc;  

-- Limiting the number of rows of output
select top 3  *  from Orders order by Amount;

-- Nested Query to find 2nd largest order amount
select top 1 * from (
    select top 2 * from Orders order by Amount desc
)
tt ORDER BY tt.Amount;

