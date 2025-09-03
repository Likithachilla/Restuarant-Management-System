-- =========================================================
-- Restaurant Ordering System — Full Project (MySQL 8+)
-- Features:
-- - Self-contained: creates and uses database
-- - 50+ meaningful rows per table
-- - Triggers + procedure keep totals accurate
-- - Indexes for performance
-- - Views for 15 reports (run SELECT * FROM view_name)
-- - Seed tweaked so Q12, Q13, Q14 return data
-- =========================================================

-- ---------------------------------------------------------
-- Create and select database
-- ---------------------------------------------------------
CREATE DATABASE IF NOT EXISTS restaurant_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE restaurant_db;

-- ---------------------------------------------------------
-- Clean drop (children first)
-- ---------------------------------------------------------
DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Menu;
DROP TABLE IF EXISTS Customers;

-- ---------------------------------------------------------
-- Customers
-- ---------------------------------------------------------
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Address VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO Customers (Name, Phone, Email, Address) VALUES
('Aarav Mehta', '9810012345', 'aarav.mehta@example.com', 'Jaipur, Rajasthan'),
('Lakshmi Iyer', '9845011122', 'lakshmi.iyer@example.com', 'Chennai, Tamil Nadu'),
('Arjun Kumar', '9876500001', 'arjun.kumar@example.com', 'Bengaluru, Karnataka'),
('Priya Sharma', '9123456780', 'priya.sharma@example.com', 'New Delhi, Delhi'),
('Rahul Nair', '9988776655', 'rahul.nair@example.com', 'Kochi, Kerala'),
('Sneha Reddy', '8899776655', 'sneha.reddy@example.com', 'Hyderabad, Telangana'),
('Karan Singh', '7788996655', 'karan.singh@example.com', 'Chandigarh, Chandigarh'),
('Ananya Gupta', '9900112233', 'ananya.gupta@example.com', 'Lucknow, Uttar Pradesh'),
('Rohan Das', '9830011122', 'rohan.das@example.com', 'Kolkata, West Bengal'),
('Meera Menon', '9740012345', 'meera.menon@example.com', 'Thiruvananthapuram, Kerala'),
('Siddharth Verma', '9822012345', 'siddharth.verma@example.com', 'Pune, Maharashtra'),
('Nisha Khatri', '9898011122', 'nisha.khatri@example.com', 'Ahmedabad, Gujarat'),
('Vivek Srinivasan', '9443312345', 'vivek.srinivasan@example.com', 'Coimbatore, Tamil Nadu'),
('Deepika Joshi', '9711112233', 'deepika.joshi@example.com', 'Dehradun, Uttarakhand'),
('Aditya Rao', '9480123456', 'aditya.rao@example.com', 'Mangaluru, Karnataka'),
('Pooja Bansal', '9755512345', 'pooja.bansal@example.com', 'Indore, Madhya Pradesh'),
('Harish Patel', '9909912345', 'harish.patel@example.com', 'Vadodara, Gujarat'),
('Kavya Shetty', '9886011122', 'kavya.shetty@example.com', 'Udupi, Karnataka'),
('Manish Tiwari', '9798912345', 'manish.tiwari@example.com', 'Kanpur, Uttar Pradesh'),
('Ritu Chawla', '9133312345', 'ritu.chawla@example.com', 'Bhopal, Madhya Pradesh'),
('Suresh Pillai', '9442211122', 'suresh.pillai@example.com', 'Tiruchirappalli, Tamil Nadu'),
('Aisha Khan', '9930112233', 'aisha.khan@example.com', 'Mumbai, Maharashtra'),
('Varun Malhotra', '9818812345', 'varun.malhotra@example.com', 'Gurugram, Haryana'),
('Neha Kapoor', '9876611122', 'neha.kapoor@example.com', 'Noida, Uttar Pradesh'),
('Rohit Kulkarni', '9823011122', 'rohit.kulkarni@example.com', 'Nagpur, Maharashtra'),
('Shreya Ghosh', '9831212345', 'shreya.ghosh@example.com', 'Howrah, West Bengal'),
('Anil Kumar', '7979912345', 'anil.kumar@example.com', 'Patna, Bihar'),
('Divya Mohan', '8095012345', 'divya.mohan@example.com', 'Mysuru, Karnataka'),
('Sanjay Yadav', '9910012345', 'sanjay.yadav@example.com', 'Varanasi, Uttar Pradesh'),
('Isha Jain', '9726011122', 'isha.jain@example.com', 'Surat, Gujarat'),
('Abhinav Mishra', '7905012345', 'abhinav.mishra@example.com', 'Prayagraj, Uttar Pradesh'),
('Tanvi Desai', '9099012345', 'tanvi.desai@example.com', 'Rajkot, Gujarat'),
('Mohan Krishnan', '9360012345', 'mohan.krishnan@example.com', 'Madurai, Tamil Nadu'),
('Ishita Roy', '9088012345', 'ishita.roy@example.com', 'Siliguri, West Bengal'),
('Prateek Saxena', '8755512345', 'prateek.saxena@example.com', 'Meerut, Uttar Pradesh'),
('Radhika Nair', '9744212345', 'radhika.nair@example.com', 'Kozhikode, Kerala'),
('Amitabh Sinha', '7666612345', 'amitabh.sinha@example.com', 'Ranchi, Jharkhand'),
('Sunita Raut', '9422012345', 'sunita.raut@example.com', 'Nashik, Maharashtra'),
('Jayant Bhatt', '8822212345', 'jayant.bhatt@example.com', 'Udaipur, Rajasthan'),
('Snehal Patil', '8600012345', 'snehal.patil@example.com', 'Aurangabad, Maharashtra'),
('Hemant Joshi', '9999912345', 'hemant.joshi@example.com', 'Jodhpur, Rajasthan'),
('Aditi Kulkarni', '8855512345', 'aditi.kulkarni@example.com', 'Thane, Maharashtra'),
('Parth Shah', '8237012345', 'parth.shah@example.com', 'Gandhinagar, Gujarat'),
('Swati Agarwal', '8010012345', 'swati.agarwal@example.com', 'Bhubaneswar, Odisha'),
('Nitin Arora', '8866112233', 'nitin.arora@example.com', 'Faridabad, Haryana'),
('Leela Menon', '9495012345', 'leela.menon@example.com', 'Kottayam, Kerala'),
('Omkar Pawar', '9035012345', 'omkar.pawar@example.com', 'Kolhapur, Maharashtra'),
('Zoya Ansari', '9310012345', 'zoya.ansari@example.com', 'Aligarh, Uttar Pradesh'),
('Tarun Chandra', '8899012345', 'tarun.chandra@example.com', 'Guntur, Andhra Pradesh'),
('Malini Rao', '7980012345', 'malini.rao@example.com', 'Visakhapatnam, Andhra Pradesh');

-- ---------------------------------------------------------
-- Menu
-- ---------------------------------------------------------
CREATE TABLE Menu (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Base 50 items
INSERT INTO Menu (ItemName, Category, Price) VALUES
('Masala Dosa', 'South Indian', 70.00),
('Plain Dosa', 'South Indian', 50.00),
('Rava Dosa', 'South Indian', 80.00),
('Idli Vada', 'South Indian', 60.00),
('Idli', 'South Indian', 40.00),
('Medu Vada', 'South Indian', 45.00),
('Pongal', 'South Indian', 60.00),
('Upma', 'South Indian', 55.00),
('Poori Masala', 'South Indian', 75.00),
('Bisibele Bath', 'South Indian', 90.00),
('Paneer Butter Masala', 'North Indian', 180.00),
('Dal Makhani', 'North Indian', 150.00),
('Butter Chicken', 'North Indian', 220.00),
('Chole Bhature', 'North Indian', 120.00),
('Veg Thali', 'North Indian', 200.00),
('Tandoori Roti', 'North Indian', 20.00),
('Garlic Naan', 'North Indian', 40.00),
('Jeera Rice', 'North Indian', 90.00),
('Veg Pulao', 'North Indian', 110.00),
('Chicken Biryani', 'North Indian', 240.00),
('Veg Fried Rice', 'Chinese', 120.00),
('Hakka Noodles', 'Chinese', 130.00),
('Veg Manchurian', 'Chinese', 150.00),
('Chicken Manchurian', 'Chinese', 190.00),
('Chilli Chicken', 'Chinese', 200.00),
('Schezwan Fried Rice', 'Chinese', 140.00),
('Veg Spring Roll', 'Chinese', 100.00),
('Momos', 'Chinese', 120.00),
('Mango Lassi', 'Beverages', 90.00),
('Sweet Lassi', 'Beverages', 80.00),
('Buttermilk', 'Beverages', 40.00),
('Lime Soda', 'Beverages', 50.00),
('Filter Coffee', 'Beverages', 40.00),
('Masala Chai', 'Beverages', 30.00),
('Gulab Jamun', 'Desserts', 70.00),
('Jalebi', 'Desserts', 80.00),
('Rasgulla', 'Desserts', 80.00),
('Rava Kesari', 'Desserts', 70.00),
('Payasam', 'Desserts', 90.00),
('Kulfi', 'Desserts', 100.00),
('Samosa', 'Snacks', 30.00),
('Kachori', 'Snacks', 35.00),
('Pav Bhaji', 'Snacks', 100.00),
('Vada Pav', 'Snacks', 40.00),
('Bhel Puri', 'Snacks', 50.00),
('Paneer Pakoda', 'Snacks', 120.00),
('Dahi Puri', 'Snacks', 60.00),
('Dhokla', 'Snacks', 60.00),
('Mysore Pak', 'Desserts', 90.00),
('Rasmalai', 'Desserts', 120.00);

-- Add 6 extra items that no order will reference (for Q14)
INSERT INTO Menu (ItemName, Category, Price) VALUES
('Pani Puri', 'Snacks', 45.00),              -- ItemID 51
('Paneer Tikka', 'North Indian', 180.00),     -- ItemID 52
('Thayir Sadam', 'South Indian', 70.00),      -- ItemID 53
('Green Tea', 'Beverages', 60.00),            -- ItemID 54
('Chocolate Milkshake', 'Beverages', 120.00), -- ItemID 55
('Carrot Halwa', 'Desserts', 110.00);         -- ItemID 56

-- ---------------------------------------------------------
-- Orders
-- ---------------------------------------------------------
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10,2),
    CONSTRAINT fk_orders_customer
      FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
      ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 50 orders. Some customers are repeated; some customers have no orders (to make Q12, Q13 non-empty)
INSERT INTO Orders (CustomerID, OrderDate) VALUES
(1, '2025-06-01 12:15:00'),
(2, '2025-06-01 13:05:00'),
(3, '2025-06-02 09:30:00'),
(4, '2025-06-02 20:10:00'),
(5, '2025-06-03 19:45:00'),
(6, '2025-06-04 08:55:00'),
(7, '2025-06-04 13:20:00'),
(8, '2025-06-05 14:05:00'),
(9, '2025-06-05 20:40:00'),
(10, '2025-06-06 10:15:00'),
(11, '2025-06-06 18:25:00'),
(12, '2025-06-07 12:05:00'),
(13, '2025-06-07 21:10:00'),
(14, '2025-06-08 08:20:00'),
(15, '2025-06-08 13:45:00'),
(16, '2025-06-09 19:10:00'),
(17, '2025-06-10 08:50:00'),
(18, '2025-06-10 21:05:00'),
(19, '2025-06-11 17:30:00'),
(20, '2025-06-11 20:25:00'),
(21, '2025-06-12 09:10:00'),
(22, '2025-06-12 13:55:00'),
(23, '2025-06-13 19:05:00'),
(24, '2025-06-14 08:40:00'),
(25, '2025-06-14 12:50:00'),
(1,  '2025-06-15 18:20:00'),  -- repeat of customer 1 (was 26)
(3,  '2025-06-15 20:35:00'),  -- repeat of customer 3 (was 27)
(28, '2025-06-16 09:00:00'),
(29, '2025-06-16 13:25:00'),
(30, '2025-06-17 19:40:00'),
(31, '2025-06-18 08:35:00'),
(5,  '2025-06-18 21:15:00'),  -- repeat of customer 5 (was 32)
(33, '2025-06-19 17:45:00'),
(34, '2025-06-20 12:30:00'),
(7,  '2025-06-20 20:15:00'),  -- repeat of customer 7 (was 35)
(36, '2025-06-21 09:45:00'),
(37, '2025-06-22 13:10:00'),
(38, '2025-06-22 18:50:00'),
(39, '2025-06-23 12:20:00'),
(9,  '2025-06-23 21:00:00'),  -- repeat of customer 9 (was 40)
(41, '2025-06-24 10:10:00'),
(42, '2025-06-24 19:30:00'),
(43, '2025-06-25 12:55:00'),
(44, '2025-06-25 20:05:00'),
(11, '2025-06-26 09:35:00'),  -- repeat of customer 11 (was 45)
(46, '2025-06-26 13:40:00'),
(47, '2025-06-27 19:25:00'),
(48, '2025-06-28 08:25:00'),
(49, '2025-06-28 13:15:00'),
(1,  '2025-06-29 18:45:00');  -- third order of customer 1 (makes repeats richer)

-- ---------------------------------------------------------
-- OrderItems
-- ---------------------------------------------------------
CREATE TABLE OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ItemID INT,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    LineTotal DECIMAL(10,2),
    CONSTRAINT fk_orderitems_order
      FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
      ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_orderitems_item
      FOREIGN KEY (ItemID) REFERENCES Menu(ItemID)
      ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------
-- Stored procedure + triggers for automatic totals
-- ---------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE RecalcOrderTotal(IN p_OrderID INT)
BEGIN
    DECLARE v_sum DECIMAL(10,2) DEFAULT 0.00;
    SELECT COALESCE(SUM(LineTotal), 0.00) INTO v_sum
    FROM OrderItems
    WHERE OrderID = p_OrderID;
    UPDATE Orders SET TotalAmount = v_sum WHERE OrderID = p_OrderID;
END$$

CREATE TRIGGER bi_orderitems
BEFORE INSERT ON OrderItems
FOR EACH ROW
BEGIN
    DECLARE v_price DECIMAL(10,2);
    SELECT Price INTO v_price FROM Menu WHERE ItemID = NEW.ItemID;
    SET NEW.LineTotal = NEW.Quantity * v_price;
END$$

CREATE TRIGGER bu_orderitems
BEFORE UPDATE ON OrderItems
FOR EACH ROW
BEGIN
    DECLARE v_price DECIMAL(10,2);
    SELECT Price INTO v_price FROM Menu WHERE ItemID = NEW.ItemID;
    SET NEW.LineTotal = NEW.Quantity * v_price;
END$$

CREATE TRIGGER ai_orderitems
AFTER INSERT ON OrderItems
FOR EACH ROW
BEGIN
    CALL RecalcOrderTotal(NEW.OrderID);
END$$

CREATE TRIGGER au_orderitems
AFTER UPDATE ON OrderItems
FOR EACH ROW
BEGIN
    CALL RecalcOrderTotal(NEW.OrderID);
END$$

CREATE TRIGGER ad_orderitems
AFTER DELETE ON OrderItems
FOR EACH ROW
BEGIN
    CALL RecalcOrderTotal(OLD.OrderID);
END$$

DELIMITER ;

-- 100+ order item rows; LineTotal auto-computed by trigger
INSERT INTO OrderItems (OrderID, ItemID, Quantity) VALUES
(1, 1, 2), (1, 33, 1),
(2, 13, 1), (2, 17, 2),
(3, 21, 1), (3, 29, 1),
(4, 11, 1), (4, 18, 1),
(5, 20, 1), (5, 30, 1),
(6, 14, 1), (6, 31, 2),
(7, 22, 1), (7, 23, 1),
(8, 43, 1), (8, 34, 2),
(9, 24, 1), (9, 32, 1),
(10, 3, 1), (10, 35, 1),
(11, 5, 3), (11, 33, 1),
(12, 25, 1), (12, 27, 1),
(13, 12, 1), (13, 16, 4),
(14, 9, 1), (14, 33, 2),
(15, 15, 1), (15, 19, 1),
(16, 26, 1), (16, 29, 1),
(17, 4, 1), (17, 31, 1),
(18, 28, 1), (18, 29, 1),
(19, 41, 2), (19, 45, 1),
(20, 2, 2), (20, 33, 2),
(21, 6, 2), (21, 38, 1),
(22, 7, 1), (22, 33, 1),
(23, 10, 1), (23, 36, 1),
(24, 8, 1), (24, 35, 1),
(25, 1, 1), (25, 29, 1),
(26, 47, 2), (26, 31, 2),
(27, 44, 2), (27, 43, 1),
(28, 42, 2), (28, 34, 1),
(29, 46, 1), (29, 21, 1),
(30, 39, 1), (30, 48, 1),
(31, 23, 1), (31, 22, 1),
(32, 20, 1), (32, 33, 2),
(33, 14, 1), (33, 29, 1),
(34, 18, 1), (34, 11, 1),
(35, 40, 1), (35, 30, 1),
(36, 37, 1), (36, 28, 1),
(37, 49, 1), (37, 34, 2),
(38, 32, 2), (38, 31, 2),
(39, 27, 2), (39, 21, 1),
(40, 12, 1), (40, 33, 1),
(41, 50, 1), (41, 35, 1),
(42, 25, 1), (42, 22, 1),
(43, 9, 1), (43, 38, 1),
(44, 17, 3), (44, 13, 1),
(45, 43, 1), (45, 47, 1),
(46, 45, 2), (46, 41, 2),
(47, 19, 1), (47, 29, 1),
(48, 26, 1), (48, 24, 1),
(49, 3, 1), (49, 29, 1),
(50, 5, 2), (50, 33, 2);

-- ---------------------------------------------------------
-- Payments
-- ---------------------------------------------------------
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    PaymentMethod ENUM('Cash','Card','UPI') NOT NULL,
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    AmountPaid DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_payments_order
      FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
      ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DELIMITER $$

CREATE TRIGGER bi_payments
BEFORE INSERT ON Payments
FOR EACH ROW
BEGIN
    IF NEW.AmountPaid IS NULL THEN
        SELECT COALESCE(TotalAmount, 0.00) INTO @v_due FROM Orders WHERE OrderID = NEW.OrderID;
        SET NEW.AmountPaid = @v_due;
    END IF;
END$$

DELIMITER ;

-- One payment per order; vary method; payment time ~5 minutes after order
INSERT INTO Payments (OrderID, PaymentMethod, PaymentDate, AmountPaid)
SELECT
    O.OrderID,
    CASE
        WHEN O.OrderID % 3 = 1 THEN 'UPI'
        WHEN O.OrderID % 3 = 2 THEN 'Cash'
        ELSE 'Card'
    END AS PaymentMethod,
    DATE_ADD(O.OrderDate, INTERVAL 5 MINUTE) AS PaymentDate,
    O.TotalAmount
FROM Orders O;

-- ---------------------------------------------------------
-- Helpful indexes
-- ---------------------------------------------------------
CREATE INDEX idx_orders_customer ON Orders(CustomerID);
CREATE INDEX idx_orderitems_order ON OrderItems(OrderID);
CREATE INDEX idx_orderitems_item ON OrderItems(ItemID);
CREATE INDEX idx_payments_order ON Payments(OrderID);
CREATE INDEX idx_menu_category ON Menu(Category);

-- =========================================================
-- Views for 15 named reports (run SELECT * FROM view_name;)
-- These view names will appear in the result tab, giving each
-- output window a meaningful name in most clients.
-- =========================================================

-- V1: All customers
CREATE OR REPLACE VIEW vw_customers_list AS
SELECT
    CustomerID AS `Customer ID`,
    Name AS `Full Name`,
    Phone AS `Mobile Number`,
    Email AS `Email Address`,
    Address AS `City, State`
FROM Customers;

-- V2: Full menu with formatted prices
CREATE OR REPLACE VIEW vw_menu_full AS
SELECT
    ItemID AS `Item ID`,
    ItemName AS `Dish Name`,
    Category AS `Cuisine Category`,
    CONCAT('₹', FORMAT(Price, 2)) AS `Unit Price`
FROM Menu;

-- V3: Orders with customer names and totals
CREATE OR REPLACE VIEW vw_orders_with_customers AS
SELECT
    O.OrderID AS `Order Number`,
    C.Name AS `Customer Name`,
    O.OrderDate AS `Order Date & Time`,
    CONCAT('₹', FORMAT(O.TotalAmount, 2)) AS `Order Total`
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID;

-- V4: Detailed order items (line-level)
CREATE OR REPLACE VIEW vw_order_items_detailed AS
SELECT
    O.OrderID AS `Order No.`,
    C.Name AS `Customer Name`,
    M.ItemName AS `Dish`,
    OI.Quantity AS `Quantity`,
    CONCAT('₹', FORMAT(M.Price, 2)) AS `Unit Price`,
    CONCAT('₹', FORMAT(OI.LineTotal, 2)) AS `Line Total`
FROM OrderItems OI
JOIN Orders O ON OI.OrderID = O.OrderID
JOIN Customers C ON O.CustomerID = C.CustomerID
JOIN Menu M ON OI.ItemID = M.ItemID;

-- V5: Payments with method and amount
CREATE OR REPLACE VIEW vw_payments_with_customers AS
SELECT
    P.PaymentID AS `Payment ID`,
    P.OrderID AS `Order Number`,
    C.Name AS `Customer Name`,
    P.PaymentMethod AS `Payment Method`,
    CONCAT('₹', FORMAT(P.AmountPaid, 2)) AS `Amount Paid`,
    P.PaymentDate AS `Payment Date & Time`
FROM Payments P
JOIN Orders O ON P.OrderID = O.OrderID
JOIN Customers C ON O.CustomerID = C.CustomerID;

-- V6: Daily revenue summary
CREATE OR REPLACE VIEW vw_daily_revenue AS
SELECT
    DATE(O.OrderDate) AS `Order Date`,
    COUNT(*) AS `Orders Count`,
    CONCAT('₹', FORMAT(SUM(O.TotalAmount), 2)) AS `Revenue`
FROM Orders O
GROUP BY DATE(O.OrderDate);

-- V7: Top 10 best-selling dishes (by quantity and revenue)
CREATE OR REPLACE VIEW vw_top_dishes AS
SELECT
    M.ItemName AS `Dish Name`,
    M.Category AS `Category`,
    SUM(OI.Quantity) AS `Total Qty Sold`,
    CONCAT('₹', FORMAT(SUM(OI.LineTotal), 2)) AS `Total Revenue`
FROM OrderItems OI
JOIN Menu M ON OI.ItemID = M.ItemID
GROUP BY M.ItemID, M.ItemName, M.Category
ORDER BY SUM(OI.Quantity) DESC, SUM(OI.LineTotal) DESC
LIMIT 10;

-- V8: Top 10 customers by total spend
CREATE OR REPLACE VIEW vw_top_customers AS
SELECT
    C.CustomerID AS `Customer ID`,
    C.Name AS `Customer Name`,
    COUNT(O.OrderID) AS `Orders Placed`,
    CONCAT('₹', FORMAT(SUM(O.TotalAmount), 2)) AS `Total Spend`
FROM Customers C
JOIN Orders O ON O.CustomerID = C.CustomerID
GROUP BY C.CustomerID, C.Name
ORDER BY SUM(O.TotalAmount) DESC
LIMIT 10;

-- V9: Payment method performance
CREATE OR REPLACE VIEW vw_payment_method_stats AS
SELECT
    P.PaymentMethod AS `Payment Method`,
    COUNT(*) AS `Payments`,
    CONCAT('₹', FORMAT(AVG(P.AmountPaid), 2)) AS `Average Ticket`,
    CONCAT('₹', FORMAT(SUM(P.AmountPaid), 2)) AS `Total Collected`
FROM Payments P
GROUP BY P.PaymentMethod
ORDER BY SUM(P.AmountPaid) DESC;

-- V10: Category-wise revenue and share
CREATE OR REPLACE VIEW vw_category_share AS
WITH cat_rev AS (
    SELECT M.Category, SUM(OI.LineTotal) AS revenue
    FROM OrderItems OI
    JOIN Menu M ON OI.ItemID = M.ItemID
    GROUP BY M.Category
),
tot AS (
    SELECT SUM(revenue) AS grand_total FROM cat_rev
)
SELECT
    c.Category AS `Cuisine Category`,
    CONCAT('₹', FORMAT(c.revenue, 2)) AS `Revenue`,
    CONCAT(ROUND(100 * c.revenue / t.grand_total, 2), '%') AS `Share`
FROM cat_rev c CROSS JOIN tot t
ORDER BY c.revenue DESC;

-- V11: Orders by time-of-day bucket
CREATE OR REPLACE VIEW vw_time_of_day_buckets AS
SELECT
    CASE
        WHEN HOUR(OrderDate) BETWEEN 6 AND 11 THEN 'Breakfast'
        WHEN HOUR(OrderDate) BETWEEN 12 AND 16 THEN 'Lunch'
        WHEN HOUR(OrderDate) BETWEEN 17 AND 22 THEN 'Dinner'
        ELSE 'Late Night'
    END AS `Service Window`,
    COUNT(*) AS `Orders`,
    CONCAT('₹', FORMAT(SUM(TotalAmount), 2)) AS `Revenue`
FROM Orders
GROUP BY 1
ORDER BY SUM(TotalAmount) DESC;

-- V12: Repeat customers (more than one order)
CREATE OR REPLACE VIEW vw_repeat_customers AS
SELECT
    C.CustomerID AS `Customer ID`,
    C.Name AS `Customer Name`,
    COUNT(O.OrderID) AS `Orders Count`,
    CONCAT('₹', FORMAT(SUM(O.TotalAmount), 2)) AS `Total Spend`
FROM Customers C
JOIN Orders O ON O.CustomerID = C.CustomerID
GROUP BY C.CustomerID, C.Name
HAVING COUNT(O.OrderID) > 1
ORDER BY COUNT(O.OrderID) DESC, SUM(O.TotalAmount) DESC;

-- V13: Customers with no orders
CREATE OR REPLACE VIEW vw_customers_no_orders AS
SELECT
    C.CustomerID AS `Customer ID`,
    C.Name AS `Customer Name`,
    C.Phone AS `Mobile Number`,
    C.Address AS `City, State`
FROM Customers C
LEFT JOIN Orders O ON O.CustomerID = C.CustomerID
WHERE O.OrderID IS NULL
ORDER BY C.CustomerID;

-- V14: Menu items never ordered
CREATE OR REPLACE VIEW vw_never_ordered_items AS
SELECT
    M.ItemID AS `Item ID`,
    M.ItemName AS `Dish Name`,
    M.Category AS `Category`,
    CONCAT('₹', FORMAT(M.Price, 2)) AS `Unit Price`
FROM Menu M
LEFT JOIN OrderItems OI ON OI.ItemID = M.ItemID
WHERE OI.OrderItemID IS NULL
ORDER BY M.Category, M.ItemName;

-- V15: High-value orders (₹300+)
CREATE OR REPLACE VIEW vw_high_value_orders AS
SELECT
    O.OrderID AS `Order Number`,
    C.Name AS `Customer Name`,
    O.OrderDate AS `Order Date & Time`,
    CONCAT('₹', FORMAT(O.TotalAmount, 2)) AS `Order Total`
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE O.TotalAmount >= 300.00
ORDER BY O.TotalAmount DESC, O.OrderDate DESC;

-- =========================================================
-- Run these to see named outputs (each tab shows the view):
-- =========================================================
-- Show all reports after build
SELECT * FROM vw_customers_list;
SELECT * FROM vw_menu_full;
SELECT * FROM vw_orders_with_customers;
SELECT * FROM vw_order_items_detailed;
SELECT * FROM vw_payments_with_customers;
SELECT * FROM vw_daily_revenue;
SELECT * FROM vw_top_dishes;
SELECT * FROM vw_top_customers;
SELECT * FROM vw_payment_method_stats;
SELECT * FROM vw_category_share;
SELECT * FROM vw_time_of_day_buckets;
SELECT * FROM vw_repeat_customers;
SELECT * FROM vw_customers_no_orders;
SELECT * FROM vw_never_ordered_items;
SELECT * FROM vw_high_value_orders;