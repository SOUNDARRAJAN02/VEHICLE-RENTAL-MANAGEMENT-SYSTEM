CREATE DATABASE VehicleRentalDB;
USE VehicleRentalDB;

-- Create Tables with Constraints
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) UNIQUE,
    Email VARCHAR(100) UNIQUE,
    Address VARCHAR(255)
);

CREATE TABLE Vehicle (
    VehicleID INT PRIMARY KEY AUTO_INCREMENT,
    VehicleNumber VARCHAR(20) UNIQUE NOT NULL,
    Model VARCHAR(50),
    Manufacturer VARCHAR(50),
    Year INT CHECK (Year >= 2000),
    RentalPricePerDay DECIMAL(10, 2),
    AvailabilityStatus ENUM('Available', 'Rented', 'UnderMaintenance') DEFAULT 'Available'
);

CREATE TABLE Rental (
    RentalID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    VehicleID INT,
    RentalDate DATE,
    ReturnDate DATE,
    RentalStatus ENUM('Active', 'Completed', 'Cancelled') DEFAULT 'Active',
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    RentalID INT,
    PaymentDate DATE,
    AmountPaid DECIMAL(10, 2) CHECK (AmountPaid >= 0),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (RentalID) REFERENCES Rental(RentalID)
);

CREATE TABLE ReturnVehicle (
    ReturnID INT PRIMARY KEY AUTO_INCREMENT,
    RentalID INT,
    ActualReturnDate DATE,
    ExtraCharges DECIMAL(10, 2) DEFAULT 0.00,
    Notes TEXT,
    FOREIGN KEY (RentalID) REFERENCES Rental(RentalID)
);

INSERT INTO Customer (FullName, Phone, Email, Address) VALUES
('John Doe', '9876543210', 'john.doe@example.com', '123 Street, City'),
('Priya Sharma', '9123456789', 'priya.sharma@example.com', '456 Gandhi Road, Madurai'),
('Ravi Kumar', '9012345678', 'ravi.kumar@example.com', '789 MG Street, Salem'),
('Divya Rani', '9988776655', 'divya.rani@example.com', '321 Nehru Street, Coimbatore'),
('Karthik M', '8877665544', 'karthik.m@example.com', '654 Rajaji Nagar, Trichy'),
('Anjali V', '7894561230', 'anjali.v@example.com', '234 TNHB, Chennai'),
('Sunil M', '7001122334', 'sunil.m@example.com', '890 KK Nagar, Madurai'),
('Deepa Iyer', '7676767676', 'deepa.iyer@example.com', '123 Cross Road, Salem'),
('Gokul R', '9898989898', 'gokul.r@example.com', 'RR Street, Erode'),
('Sneha S', '9345678901', 'sneha.s@example.com', 'Lake View Road, Chennai'),
('Rajeev K', '9000012345', 'rajeev.k@example.com', 'Thillai Nagar, Trichy'),
('Meena B', '8112233445', 'meena.b@example.com', 'Kamarajar Street, Tirunelveli'),
('Vignesh N', '7665544332', 'vignesh.n@example.com', 'KK Road, Madurai'),
('Swetha P', '7234567890', 'swetha.p@example.com', 'Main Road, Dindigul'),
('Hari M', '7555666777', 'hari.m@example.com', 'Junction Road, Karur');

-- Insert 15 Vehicle Records
INSERT INTO Vehicle (VehicleNumber, Model, Manufacturer, Year, RentalPricePerDay, AvailabilityStatus) VALUES
('TN01AB1234', 'City', 'Honda', 2020, 1500.00, 'Available'),
('TN02AB5678', 'Swift', 'Maruti', 2019, 1200.00, 'Available'),
('TN03AB9101', 'i20', 'Hyundai', 2021, 1400.00, 'Available'),
('TN04AB1121', 'Creta', 'Hyundai', 2020, 1800.00, 'Available'),
('TN05AB1314', 'Alto', 'Maruti', 2018, 900.00, 'Available'),
('TN06AB1516', 'Innova', 'Toyota', 2022, 2500.00, 'Available'),
('TN07AB1718', 'Ertiga', 'Maruti', 2021, 2200.00, 'Available'),
('TN08AB1920', 'Kwid', 'Renault', 2020, 1100.00, 'Available'),
('TN09AB2122', 'Baleno', 'Maruti', 2019, 1300.00, 'Available'),
('TN10AB2324', 'Venue', 'Hyundai', 2021, 1700.00, 'Available'),
('TN11AB2526', 'XUV300', 'Mahindra', 2022, 2400.00, 'Available'),
('TN12AB2728', 'Tiago', 'Tata', 2018, 1000.00, 'Available'),
('TN13AB2930', 'Ciaz', 'Maruti', 2020, 1600.00, 'Available'),
('TN14AB3132', 'Amaze', 'Honda', 2021, 1500.00, 'Available'),
('TN15AB3334', 'Fortuner', 'Toyota', 2022, 3200.00, 'Available');

-- Insert 15 Rental Records
INSERT INTO Rental (CustomerID, VehicleID, RentalDate, ReturnDate, RentalStatus) VALUES
(1, 1, '2025-06-01', '2025-06-03', 'Completed'),
(2, 2, '2025-06-02', '2025-06-04', 'Completed'),
(3, 3, '2025-06-03', '2025-06-05', 'Completed'),
(4, 4, '2025-06-04', '2025-06-06', 'Completed'),
(5, 5, '2025-06-05', '2025-06-07', 'Completed'),
(6, 6, '2025-06-06', '2025-06-08', 'Completed'),
(7, 7, '2025-06-07', '2025-06-09', 'Completed'),
(8, 8, '2025-06-08', '2025-06-10', 'Completed'),
(9, 9, '2025-06-09', '2025-06-11', 'Completed'),
(10, 10, '2025-06-10', '2025-06-12', 'Completed'),
(11, 11, '2025-06-11', '2025-06-13', 'Completed'),
(12, 12, '2025-06-12', '2025-06-14', 'Completed'),
(13, 13, '2025-06-13', '2025-06-15', 'Completed'),
(14, 14, '2025-06-14', '2025-06-16', 'Completed'),
(15, 15, '2025-06-15', '2025-06-17', 'Completed');

-- Insert 15 Payment Records
INSERT INTO Payment (RentalID, PaymentDate, AmountPaid, PaymentMethod) VALUES
(1, '2025-06-03', 3000.00, 'Cash'),
(2, '2025-06-04', 2400.00, 'UPI'),
(3, '2025-06-05', 2800.00, 'Card'),
(4, '2025-06-06', 3600.00, 'Cash'),
(5, '2025-06-07', 1800.00, 'UPI'),
(6, '2025-06-08', 5000.00, 'Cash'),
(7, '2025-06-09', 4400.00, 'UPI'),
(8, '2025-06-10', 2200.00, 'Card'),
(9, '2025-06-11', 2600.00, 'Cash'),
(10, '2025-06-12', 3400.00, 'UPI'),
(11, '2025-06-13', 4800.00, 'Card'),
(12, '2025-06-14', 2000.00, 'Cash'),
(13, '2025-06-15', 3200.00, 'UPI'),
(14, '2025-06-16', 3000.00, 'Cash'),
(15, '2025-06-17', 6400.00, 'Card');

-- Insert 15 ReturnVehicle Records
INSERT INTO ReturnVehicle (RentalID, ActualReturnDate, ExtraCharges, Notes) VALUES
(1, '2025-06-03', 0.00, 'Returned on time'),
(2, '2025-06-04', 0.00, 'Returned on time'),
(3, '2025-06-05', 0.00, 'Returned on time'),
(4, '2025-06-06', 0.00, 'Returned on time'),
(5, '2025-06-07', 0.00, 'Returned on time'),
(6, '2025-06-08', 0.00, 'Returned on time'),
(7, '2025-06-09', 0.00, 'Returned on time'),
(8, '2025-06-10', 0.00, 'Returned on time'),
(9, '2025-06-11', 0.00, 'Returned on time'),
(10, '2025-06-12', 0.00, 'Returned on time'),
(11, '2025-06-13', 0.00, 'Returned on time'),
(12, '2025-06-14', 0.00, 'Returned on time'),
(13, '2025-06-15', 0.00, 'Returned on time'),
(14, '2025-06-16', 0.00, 'Returned on time'),
(15, '2025-06-17', 0.00, 'Returned on time');

-- TCL 
START TRANSACTION;
UPDATE Vehicle SET AvailabilityStatus = 'UnderMaintenance'
WHERE VehicleID = 3;
ROLLBACK;

START TRANSACTION;
UPDATE Customer SET FullName = 'Updated Name' 
WHERE CustomerID = 1;
COMMIT;

-- Aggregates 
SELECT PaymentMethod, COUNT(*) AS TotalPayments FROM Payment 
GROUP BY PaymentMethod;


SELECT CustomerID, SUM(AmountPaid) AS TotalPaid FROM Rental R 
JOIN Payment P ON R.RentalID = P.RentalID 
GROUP BY CustomerID;


SELECT PaymentMethod, MAX(AmountPaid) AS MaxPaid FROM Payment 
GROUP BY PaymentMethod;


SELECT R.VehicleID, AVG(P.AmountPaid) AS AvgAmount
FROM Payment P
JOIN Rental R ON P.RentalID = R.RentalID
GROUP BY R.VehicleID
HAVING AVG(P.AmountPaid) > 2000;


-- Operators 
SELECT * FROM Vehicle 
WHERE RentalPricePerDay 
BETWEEN 1000 AND 2000;

SELECT * FROM Customer 
WHERE FullName LIKE '%a%';

SELECT * FROM Rental 
WHERE RentalDate >= '2025-06-05' AND ReturnDate <= '2025-06-10';

-- Joins 
SELECT C.FullName, V.Model FROM Customer C 
JOIN Rental R ON C.CustomerID = R.CustomerID 
JOIN Vehicle V ON R.VehicleID = V.VehicleID;

SELECT C.FullName, P.AmountPaid FROM Customer C 
JOIN Rental R ON C.CustomerID = R.CustomerID 
JOIN Payment P ON R.RentalID = P.RentalID;

SELECT R.RentalID, RV.ActualReturnDate FROM Rental R 
JOIN ReturnVehicle RV ON R.RentalID = RV.RentalID;

-- Subqueries 
SELECT * FROM Vehicle 
WHERE VehicleID IN (SELECT VehicleID FROM Rental WHERE RentalStatus = 'Completed');

SELECT * FROM Payment 
WHERE AmountPaid > (SELECT AVG(AmountPaid) FROM Payment);

-- advance sql
CREATE VIEW CustomerRentalSummary AS
SELECT C.FullName, COUNT(R.RentalID) AS TotalRentals, SUM(P.AmountPaid) AS TotalAmount
FROM Customer C
JOIN Rental R ON C.CustomerID = R.CustomerID
JOIN Payment P ON R.RentalID = P.RentalID
GROUP BY C.CustomerID;

CREATE VIEW AvailableVehicles AS
SELECT VehicleID, VehicleNumber, Model, Manufacturer
FROM Vehicle
WHERE AvailabilityStatus = 'Available';

CREATE VIEW HighPayingCustomers AS
SELECT C.FullName, SUM(P.AmountPaid) AS TotalPaid
FROM Customer C
JOIN Rental R ON C.CustomerID = R.CustomerID
JOIN Payment P ON R.RentalID = P.RentalID
GROUP BY C.CustomerID
HAVING SUM(P.AmountPaid) > 6000;

-- Stored Procedures
DELIMITER $$
CREATE PROCEDURE GetRentalsByCustomer(IN inputCustomerID INT)
BEGIN
    SELECT R.RentalID, V.VehicleNumber, R.RentalDate, R.ReturnDate, R.RentalStatus
    FROM Rental R
    JOIN Vehicle V ON R.VehicleID = V.VehicleID
    WHERE R.CustomerID = inputCustomerID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE GetCustomerPayments(IN cid INT)
BEGIN
    SELECT P.* FROM Payment P JOIN Rental R ON P.RentalID = R.RentalID WHERE R.CustomerID = cid;
END $$

DELIMITER ;

CALL GetRentalsByCustomer(1);
CALL GetCustomerPayments(2);

-- Triggers 
DELIMITER $$
CREATE TRIGGER AfterRentalInsert
AFTER INSERT ON Rental
FOR EACH ROW
BEGIN
    UPDATE Vehicle SET AvailabilityStatus = 'Rented' WHERE VehicleID = NEW.VehicleID;
END $$
DELIMITER ;

SELECT * FROM vehiclerentaldb.customer;INSERT INTO Rental (CustomerID, VehicleID, RentalDate, ReturnDate, RentalStatus)
VALUES (3, 2, '2025-06-20', '2025-06-22', 'Active');
SELECT VehicleID, AvailabilityStatus FROM Vehicle WHERE VehicleID = 2;


-- Functions 
DELIMITER $$
CREATE FUNCTION CheckVehicleStatus(yearInput INT) RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE status VARCHAR(50);
    IF yearInput >= 2022 THEN
        SET status = 'New';
    ELSEIF yearInput >= 2019 THEN
        SET status = 'Moderate';
    ELSE
        SET status = 'Old';
    END IF;
    RETURN status;
END $$
DELIMITER ;

SELECT CheckVehicleStatus(2021) AS VehicleStatus;
