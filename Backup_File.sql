-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2023 at 06:21 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookhaven`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_transfer_payment`
--

CREATE TABLE `bank_transfer_payment` (
  `paymentId` int(5) NOT NULL,
  `payMethod` varchar(30) DEFAULT NULL,
  `accountNo` varchar(20) NOT NULL,
  `bankIdentifierCode` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank_transfer_payment`
--

INSERT INTO `bank_transfer_payment` (`paymentId`, `payMethod`, `accountNo`, `bankIdentifierCode`) VALUES
(20, 'Cash Deposit', '123456789', 'BIC123ABC'),
(21, 'Bank Draft', '234567890', 'BIC234DEF'),
(23, 'Check', '456789012', 'BIC456JKL'),
(29, 'Cash Deposit', '012345678', 'BIC012BCD'),
(31, 'Check', '234567890', 'BIC234DEF');

-- --------------------------------------------------------

--
-- Table structure for table `book_item`
--

CREATE TABLE `book_item` (
  `itemCode` int(5) NOT NULL,
  `ISBN` varchar(25) NOT NULL,
  `title` varchar(150) NOT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `author` varchar(60) NOT NULL,
  `publisher` varchar(30) NOT NULL,
  `edition` varchar(10) DEFAULT NULL,
  `yearOfPublication` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_item`
--

INSERT INTO `book_item` (`itemCode`, `ISBN`, `title`, `genre`, `author`, `publisher`, `edition`, `yearOfPublication`) VALUES
(101, '978-0-7475-3269-6', 'Harry Potter and the Sorcerer\'s Stone', 'Fantasy', 'J.K. Rowling', 'Bloomsbury', '1st', '1997'),
(102, '978-0-8109-8391-5', 'Diary of a Wimpy Kid', 'Children\'s', 'Jeff Kinney', 'Amulet Books', '1st', '2007'),
(103, '978-1-59474-606-2', 'The Fault in Our Stars', 'Romance', 'John Green', 'Dutton Books', '1st', '2012'),
(104, '978-0-553-41802-6', 'The Martian', 'Science Fiction', 'Andy Weir', 'Crown Publishers', '1st', '2011'),
(105, '978-0-553-44812-2', 'Artemis', 'Science Fiction', 'Andy Weir', 'Crown Publishing Group', '1st', '2017'),
(106, '978-1-4493-9159-2', 'Head First Python', 'Programming', 'Paul Barry', 'O\'Reilly Media', '2nd', '2022'),
(107, '978-0-13-397077-7', 'Fundamentals of Database Systems', 'Database Management', 'Ramez Elmasri', 'Pearson', '7th', '2015'),
(108, '978-0-13-480274-9', 'Database Management Systems', 'Database Management', 'Ramez Elmasri', 'Pearson', '3rd', '2019'),
(109, '978-1-118-98058-3', 'MySQL for Dummies', 'Database Management', 'John Paul Mueller', 'Springer', '8th', '2017'),
(110, '978-0-321-32136-7', 'Introduction to Data Mining', 'Database Management', 'Pang-Ning Tan', 'Springer', '2nd', '2006');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `custId` int(5) NOT NULL,
  `firstName` varchar(15) NOT NULL,
  `secondName` varchar(15) NOT NULL,
  `addLine1` varchar(30) NOT NULL,
  `addLine2` varchar(30) DEFAULT NULL,
  `city` varchar(10) NOT NULL,
  `province` varchar(10) NOT NULL,
  `postalCode` varchar(10) NOT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`custId`, `firstName`, `secondName`, `addLine1`, `addLine2`, `city`, `province`, `postalCode`, `dateOfBirth`, `email`) VALUES
(11, 'John', 'Perera', '89 Main Street', 'Kotahena', 'Colombo', 'Western', '12345', '1985-05-15', 'john.pe@gmail.com'),
(12, 'Jane', 'Rajapaksha', '456 Cinamon Avenue', NULL, 'Kandy', 'Central', '54301', '1998-08-22', 'jane.sm@icloud.com'),
(13, 'Ranil', 'Williams', '789 Jess Lane', 'Silva MW', 'Galle', 'Southern', '60890', '1978-12-10', 'ranil.williams@gmail.com'),
(14, 'Sunil', 'Johnson', '101 Lane', 'Church Road', 'Negombo', 'Western', '99765', '2002-03-28', 'sunil.johnson@yahoo.com'),
(15, 'Roy', 'Drax', '202 Maple Street', NULL, 'Jaffna', 'Northern', '56709', '2005-07-18', 'roydrax@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `customer_telno`
--

CREATE TABLE `customer_telno` (
  `custId` int(5) NOT NULL,
  `telNo` char(15) NOT NULL,
  `telNo2` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_telno`
--

INSERT INTO `customer_telno` (`custId`, `telNo`, `telNo2`) VALUES
(11, '+94 77 1286567', '+94 76 9879843'),
(12, '+94 71 1812233', NULL),
(13, '+94 72 3534455', '+94 72 5555577'),
(14, '+94 76 9676543', NULL),
(15, '+94 70 8865432', '+94 71 2341278');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `deliveryId` int(11) NOT NULL,
  `deliveryMethod` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(10) NOT NULL,
  `province` varchar(10) NOT NULL,
  `postalCode` varchar(10) NOT NULL,
  `deliveryDate` date NOT NULL,
  `deliveryStatus` varchar(30) DEFAULT NULL,
  `trackingNo` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`deliveryId`, `deliveryMethod`, `address`, `city`, `province`, `postalCode`, `deliveryDate`, `deliveryStatus`, `trackingNo`) VALUES
(101, 'Standard', '123 Middle Street', 'Colombo', 'Western', '12345', '2023-10-02', 'Shipped', 987654),
(102, 'Express', '456 Lily Avenue', 'Kandy', 'Central', '54301', '2023-10-05', 'Delivered', 876543),
(103, 'Standard', '789 Pine Lane', 'Galle', 'Southern', '60890', '2023-10-14', 'In Transit', 765432),
(104, 'Express', '101 Lane', 'Negombo', 'Western', '99765', '2023-10-16', 'Delivered', 654321),
(105, 'Standard', '202 Maple Street', 'Jaffna', 'Northern', '56709', '2023-10-20', 'Pending', 543210),
(106, 'Express', '456 Lily Avenue', 'Kandy', 'Central', '54301', '2023-10-25', 'Delivered', 789658),
(107, 'Express', '456 Lily Avenue', 'Kandy', 'Central', '54301', '2023-10-28', 'Delivered', 874567),
(108, 'Standard', '789 Pine Lane', 'Galle', 'Southern', '60890', '2023-11-02', 'Delivered', 456789),
(109, 'Express', '101 Lane', 'Negombo', 'Western', '99765', '2023-11-07', 'Delivered', 654301),
(110, 'Express', '101 Lane', 'Negombo', 'Western', '99765', '2023-11-11', 'Pending', 650321),
(111, 'Express', '101 Lane', 'Negombo', 'Western', '99765', '2023-11-11', 'Pending', 654901),
(112, 'Standard', '123 Middle Street', 'Colombo', 'Western', '12345', '2023-11-15', 'Pending', 987344);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `custId` int(5) NOT NULL,
  `orderId` int(5) NOT NULL,
  `paymentId` int(5) NOT NULL,
  `transactionDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`custId`, `orderId`, `paymentId`, `transactionDate`) VALUES
(11, 300, 20, '2022-09-15'),
(11, 311, 31, '2023-10-15'),
(12, 303, 23, '2023-09-01'),
(12, 308, 29, '2023-10-02'),
(12, 309, 29, '2023-10-15'),
(12, 310, 30, '2023-10-28'),
(13, 302, 22, '2023-09-28'),
(13, 307, 27, '2023-10-15'),
(14, 304, 24, '2023-09-05'),
(15, 301, 21, '2023-09-21'),
(15, 305, 25, '2023-09-30'),
(15, 306, 26, '2023-09-08');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `itemCode` int(5) NOT NULL,
  `name` varchar(150) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `stockLevel` int(6) DEFAULT NULL,
  `reorderLevel` int(6) DEFAULT NULL,
  `ratings` varchar(5) DEFAULT NULL,
  `itemType` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`itemCode`, `name`, `price`, `stockLevel`, `reorderLevel`, `ratings`, `itemType`) VALUES
(1, 'Blue Ballpoint Pen', 10.00, 200, 50, '4.2', 'Stationery'),
(2, 'Pencil Set', 60.00, 150, 30, '4.0', 'Stationery'),
(3, 'Highlighter', 500.00, 100, 20, '4.5', 'Stationery'),
(4, 'Notebook', 450.00, 80, 15, '4.8', 'Stationery'),
(5, 'Eraser Pack', 500.00, 300, 50, '4.4', 'Stationery'),
(6, 'Colored Pencil Set', 1500.00, 120, 25, '4.6', 'Stationery'),
(101, 'Harry Potter and the Sorcerer\'s Stone', 5000.00, 150, 30, '4.9', 'Book'),
(102, 'Diary of a Wimpy Kid', 2700.00, 200, 40, '4.5', 'Book'),
(103, 'The Fault in Our Stars', 4250.00, 120, 25, '4.8', 'Book'),
(104, 'The Martian', 7000.00, 100, 20, '4.7', 'Book'),
(105, 'Artemis', 5000.00, 80, 15, '4.6', 'Book'),
(106, 'Head First Python', 4500.00, 60, 12, NULL, 'Book'),
(107, 'Fundamentals of Database Systems', 5500.00, 90, 18, '4.8', 'Book'),
(108, 'Database Management Systems', 6200.00, 80, 15, '4.6', 'Book'),
(109, 'MySQL for Dummies', 3200.00, 120, 25, '4.5', 'Book'),
(110, 'Introduction to Data Mining', 4800.00, 100, 20, '4.7', 'Book'),
(200, 'Rs 1000 Voucher', 1000.00, 20, 30, '4.7', 'Voucher'),
(201, 'Rs 5000 Voucher', 5000.00, 10, 15, '4.9', 'Voucher');

-- --------------------------------------------------------

--
-- Table structure for table `online_payment`
--

CREATE TABLE `online_payment` (
  `paymentId` int(5) NOT NULL,
  `cardType` varchar(25) DEFAULT NULL,
  `cardNo` varchar(20) NOT NULL,
  `nameOnCard` varchar(25) NOT NULL,
  `expDate` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `online_payment`
--

INSERT INTO `online_payment` (`paymentId`, `cardType`, `cardNo`, `nameOnCard`, `expDate`) VALUES
(22, 'Master', '5105105105105100', 'Anton Smith', '09/27'),
(24, 'AmerExp', '378282246310005', 'Bobby Lashly', '06/24'),
(25, 'Discover', '6011111111111117', 'Alice Perera', '03/25'),
(26, 'Visa', '6759649826438453', 'Chris Dabare', '11/26'),
(27, 'Visa', '3566171111911113', 'Ann Wilson', '08/27'),
(28, 'Master', '30569309025904', 'Pat Lee', '05/26'),
(30, 'Visa', '4111111181111111', 'John Doily', '12/26');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `orderId` int(5) NOT NULL,
  `orderDate` date NOT NULL,
  `orderItems` varchar(100) DEFAULT NULL,
  `deliveryId` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`orderId`, `orderDate`, `orderItems`, `deliveryId`) VALUES
(300, '2022-09-15', 'Book & Stationery', 101),
(301, '2023-09-21', 'Stationery', 102),
(302, '2023-09-28', 'Book', 103),
(303, '2023-09-01', 'Book & Stationery', 104),
(304, '2023-09-05', 'Stationery', 105),
(305, '2023-09-30', 'Book', 106),
(306, '2023-09-08', 'Book & Stationery', 107),
(307, '2023-10-15', 'Book', 108),
(308, '2023-10-02', 'Book & Stationery', 109),
(309, '2023-10-15', 'Stationery', 110),
(310, '2023-10-28', 'Stationery', 111),
(311, '2023-10-15', 'Book', 112);

-- --------------------------------------------------------

--
-- Table structure for table `ordered_item`
--

CREATE TABLE `ordered_item` (
  `orderId` int(5) NOT NULL,
  `itemCode` int(5) NOT NULL,
  `quantity` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ordered_item`
--

INSERT INTO `ordered_item` (`orderId`, `itemCode`, `quantity`) VALUES
(300, 4, 2),
(300, 107, 1),
(301, 1, 1),
(302, 110, 1),
(303, 3, 2),
(303, 103, 1),
(304, 6, 1),
(305, 106, 1),
(306, 2, 1),
(306, 101, 1),
(306, 102, 1),
(307, 102, 1),
(308, 4, 1),
(308, 103, 1),
(309, 5, 3),
(310, 1, 20),
(311, 107, 2);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentId` int(5) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `paymentType` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentId`, `amount`, `paymentType`) VALUES
(20, 6400.00, 'Bank'),
(21, 10.00, 'Bank'),
(22, 4800.00, 'Online'),
(23, 5250.00, 'Bank'),
(24, 1500.00, 'Online'),
(25, 4500.00, 'Online'),
(26, 7760.00, 'Online'),
(27, 2700.00, 'Online'),
(28, 4700.00, 'Online'),
(29, 1500.00, 'Bank'),
(30, 200.00, 'Online'),
(31, 11000.00, 'Bank');

-- --------------------------------------------------------

--
-- Table structure for table `stationery_item`
--

CREATE TABLE `stationery_item` (
  `itemCode` int(5) NOT NULL,
  `brand` varchar(20) DEFAULT NULL,
  `model` varchar(20) DEFAULT NULL,
  `numberOfPieces` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stationery_item`
--

INSERT INTO `stationery_item` (`itemCode`, `brand`, `model`, `numberOfPieces`) VALUES
(1, 'BIC', 'Cristal Xtra Smooth', 1),
(2, 'Dixon', 'Ticonderoga', 12),
(3, 'Sharpie', 'Clear View', 3),
(4, 'Promate', 'Spiral Bound', 1),
(5, 'Paper Mate', 'Pink Pearl', 3),
(6, 'Atles', 'Pre-sharpened', 24);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supId` int(5) NOT NULL,
  `supType` enum('Individual','Company') NOT NULL,
  `email` varchar(50) NOT NULL,
  `repName` varchar(40) NOT NULL,
  `company` varchar(50) DEFAULT NULL,
  `addLine1` varchar(20) NOT NULL,
  `addLine2` varchar(20) DEFAULT NULL,
  `city` varchar(15) NOT NULL,
  `productSupplied` varchar(30) NOT NULL,
  `quantity` int(8) DEFAULT NULL,
  `paymentDetails` varchar(30) DEFAULT NULL,
  `telNo` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supId`, `supType`, `email`, `repName`, `company`, `addLine1`, `addLine2`, `city`, `productSupplied`, `quantity`, `paymentDetails`, `telNo`) VALUES
(50, 'Company', 'RoyalBooks@gmail.com', 'Mic Peter', 'Royal Publishers', '567 Mid Street', 'Sunil MW', 'Colombo', 'Books', 100, 'Bank Transfer', '077 1234567'),
(51, 'Company', 'kandysupp@gmail.com', 'Stan Smith', 'Kandy Suppliers', '345 perera street', NULL, 'Kandy', 'Books', 80, 'Credit Card', '071 1712333'),
(52, 'Company', 'gallesuppku@icloud.com', 'Nimal Bimsara', 'Quick Supplies', '276 Cactus Lane', 'Jo street', 'Galle', 'Stationery', 150, 'Cash On Delivery', '072 3384455'),
(53, 'Company', 'supplierchane@hji.net', 'Megan Johnson', 'Stationery Paradise', '101 Ala para', NULL, 'Negombo', 'Stationery', 120, 'Bank Transfer', '076 9876543'),
(54, 'Company', 'royalsupp@gmail.com', 'Ryan Davis', 'Royal Books', '202 Maple Street', NULL, 'Kandana', 'Books', 200, 'Credit Card', '070 8768432'),
(201, 'Individual', 'jo.cumm@gmail.com', 'Jo Cummins', NULL, '15 Mid Street', NULL, 'Colombo', 'Books', 100, 'Bank Transfer', '077 9520597'),
(202, 'Individual', 'ann.karu@gmail.com', 'Ann Karunarathna', NULL, '456 Lake Lane', NULL, 'Kandy', 'Books', 80, 'Credit Card', '072 3456798'),
(203, 'Individual', 'kasu.dd@icloud.com', 'Kasun Perera', NULL, '789 Apple Park', 'Mid lane', 'Galle', 'Stationery', 150, 'Cash On Delivery', '078 8555843'),
(204, 'Individual', 'patCumm@icloud.com', 'Pat Cummins', NULL, '101 Flower Road', 'Maawawa', 'Negombo', 'Stationery', 120, 'Bank Transfer', '079 0967898'),
(205, 'Individual', 'royfdo@gmail.com', 'Roy Fernando', NULL, '202 Silva Street', NULL, 'Jaffna', 'Books', 200, 'Credit Card', '076 5784930');

-- --------------------------------------------------------

--
-- Table structure for table `suppling_item`
--

CREATE TABLE `suppling_item` (
  `supId` int(5) NOT NULL,
  `itemCode` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppling_item`
--

INSERT INTO `suppling_item` (`supId`, `itemCode`) VALUES
(50, 101),
(50, 107),
(51, 102),
(51, 108),
(52, 1),
(52, 5),
(53, 2),
(53, 6),
(54, 103),
(54, 109),
(54, 110),
(201, 104),
(201, 200),
(202, 105),
(203, 3),
(204, 4),
(205, 106),
(205, 201);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_transfer_payment`
--
ALTER TABLE `bank_transfer_payment`
  ADD PRIMARY KEY (`paymentId`);

--
-- Indexes for table `book_item`
--
ALTER TABLE `book_item`
  ADD PRIMARY KEY (`itemCode`),
  ADD UNIQUE KEY `ISBN` (`ISBN`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`custId`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `customer_telno`
--
ALTER TABLE `customer_telno`
  ADD PRIMARY KEY (`custId`,`telNo`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`deliveryId`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`custId`,`orderId`,`paymentId`,`transactionDate`),
  ADD KEY `in_oid_fk` (`orderId`),
  ADD KEY `in_pid_fk` (`paymentId`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`itemCode`);

--
-- Indexes for table `online_payment`
--
ALTER TABLE `online_payment`
  ADD PRIMARY KEY (`paymentId`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `o_did_fk` (`deliveryId`);

--
-- Indexes for table `ordered_item`
--
ALTER TABLE `ordered_item`
  ADD PRIMARY KEY (`orderId`,`itemCode`),
  ADD KEY `oi_ic_fk` (`itemCode`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentId`);

--
-- Indexes for table `stationery_item`
--
ALTER TABLE `stationery_item`
  ADD PRIMARY KEY (`itemCode`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supId`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `suppling_item`
--
ALTER TABLE `suppling_item`
  ADD PRIMARY KEY (`supId`,`itemCode`),
  ADD KEY `sui_ic_fk` (`itemCode`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank_transfer_payment`
--
ALTER TABLE `bank_transfer_payment`
  ADD CONSTRAINT `btp_pid_fk` FOREIGN KEY (`paymentId`) REFERENCES `payment` (`paymentId`);

--
-- Constraints for table `book_item`
--
ALTER TABLE `book_item`
  ADD CONSTRAINT `bi_ic_fk` FOREIGN KEY (`itemCode`) REFERENCES `item` (`itemCode`);

--
-- Constraints for table `customer_telno`
--
ALTER TABLE `customer_telno`
  ADD CONSTRAINT `ct_cid_fk` FOREIGN KEY (`custId`) REFERENCES `customer` (`custId`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `in_cid_fk` FOREIGN KEY (`custId`) REFERENCES `customer` (`custId`),
  ADD CONSTRAINT `in_oid_fk` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`),
  ADD CONSTRAINT `in_pid_fk` FOREIGN KEY (`paymentId`) REFERENCES `payment` (`paymentId`);

--
-- Constraints for table `online_payment`
--
ALTER TABLE `online_payment`
  ADD CONSTRAINT `op_pid_fk` FOREIGN KEY (`paymentId`) REFERENCES `payment` (`paymentId`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `o_did_fk` FOREIGN KEY (`deliveryId`) REFERENCES `delivery` (`deliveryId`);

--
-- Constraints for table `ordered_item`
--
ALTER TABLE `ordered_item`
  ADD CONSTRAINT `oi_ic_fk` FOREIGN KEY (`itemCode`) REFERENCES `item` (`itemCode`),
  ADD CONSTRAINT `oi_oid_fk` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`);

--
-- Constraints for table `stationery_item`
--
ALTER TABLE `stationery_item`
  ADD CONSTRAINT `si_ic_fk` FOREIGN KEY (`itemCode`) REFERENCES `item` (`itemCode`);

--
-- Constraints for table `suppling_item`
--
ALTER TABLE `suppling_item`
  ADD CONSTRAINT `si_sid_fk` FOREIGN KEY (`supId`) REFERENCES `supplier` (`supId`),
  ADD CONSTRAINT `sui_ic_fk` FOREIGN KEY (`itemCode`) REFERENCES `item` (`itemCode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
