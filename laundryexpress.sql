-- Create the database
CREATE DATABASE laundryexpress;
-- Use the created database
USE laundryexpress;

-- Create Users table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserType ENUM('Client', 'HouseHelp', 'Admin') NOT NULL,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    PhoneNumber CHAR(10) NOT NULL CHECK (PhoneNumber REGEXP '^[0-9]{10}$'),
    DateRegistered DATETIME DEFAULT CURRENT_TIMESTAMP,
    LastLogin DATETIME,
    Status ENUM('Active', 'Inactive', 'Suspended') DEFAULT 'Active'
);

-- Create Profiles table
CREATE TABLE Profiles (
    ProfileID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    Address VARCHAR(255),
    City VARCHAR(100),
    ProfilePictureURL VARCHAR(255),
    Bio TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create HouseHelpDetails table
CREATE TABLE HouseHelpDetails (
    DetailID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    AvailabilitySchedule TEXT,
    BaseRate DECIMAL(10, 2),
    IdentificationNumber CHAR(8) NOT NULL CHECK (LENGTH(IdentificationNumber) BETWEEN 7 AND 8 AND IdentificationNumber REGEXP '^[0-9]+$'),
    ProfilePictureURL VARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Bookings table
CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    ClientID INT NOT NULL,
    HouseHelpID INT NOT NULL,
    BookingDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    Status ENUM('Pending', 'Confirmed', 'Completed', 'Cancelled') DEFAULT 'Pending',
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (ClientID) REFERENCES Users(UserID),
    FOREIGN KEY (HouseHelpID) REFERENCES Users(UserID)
);

-- Create Services table
CREATE TABLE Services (
    ServiceID INT AUTO_INCREMENT PRIMARY KEY,
    ServiceName VARCHAR(100) NOT NULL,
    Description TEXT,
    BasePrice DECIMAL(10, 2) NOT NULL
);

-- Create BookingServices table
CREATE TABLE BookingServices (
    BookingServiceID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT NOT NULL,
    ServiceID INT NOT NULL,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

-- Create Ratings table
CREATE TABLE Ratings (
    RatingID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT NOT NULL,
    RaterID INT NOT NULL,
    RatedID INT NOT NULL,
    Rating DECIMAL(3, 2) NOT NULL,
    Comment TEXT,
    DateRated DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    FOREIGN KEY (RaterID) REFERENCES Users(UserID),
    FOREIGN KEY (RatedID) REFERENCES Users(UserID)
);

-- Create Payments table
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    PaymentMethod VARCHAR(50) NOT NULL,
    TransactionID VARCHAR(100) UNIQUE NOT NULL,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

-- Create Messages table
CREATE TABLE Messages (
    MessageID INT AUTO_INCREMENT PRIMARY KEY,
    SenderID INT NOT NULL,
    ReceiverID INT NOT NULL,
    MessageContent TEXT NOT NULL,
    Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    ReadStatus BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (SenderID) REFERENCES Users(UserID),
    FOREIGN KEY (ReceiverID) REFERENCES Users(UserID)
);

-- Create Notifications table
CREATE TABLE Notifications (
    NotificationID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    NotificationType VARCHAR(50) NOT NULL,
    Content TEXT NOT NULL,
    Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    ReadStatus BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
