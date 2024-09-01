-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2024 at 05:32 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dam`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `ID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`ID`, `Name`, `Image`) VALUES
(1, 'Xe Đạp', 'xedap.jpg'),
(2, 'Giày', 'giay.png'),
(3, 'Phụ Kiện', 'phukien.png'),
(4, 'Balo', 'balo.png');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `ID` int(11) NOT NULL,
  `ID_Product` int(11) NOT NULL,
  `ID_User` int(11) NOT NULL,
  `Comments` text DEFAULT NULL,
  `Dates` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `ID` int(11) NOT NULL,
  `ID_Product` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Address` text DEFAULT NULL,
  `Create_Date` date NOT NULL,
  `Payment_Method` varchar(255) NOT NULL,
  `Buy_Date` date NOT NULL,
  `Status_Oder` varchar(255) NOT NULL,
  `User_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Price` int(11) NOT NULL,
  `Image` text NOT NULL,
  `Sale` int(11) NOT NULL,
  `Description` text NOT NULL,
  `Detail` text NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `Import_Date` date DEFAULT NULL,
  `Production_Date` date DEFAULT NULL,
  `Expiration_Date` date DEFAULT NULL,
  `Cat_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ID`, `Name`, `Price`, `Image`, `Sale`, `Description`, `Detail`, `Quantity`, `Status`, `Import_Date`, `Production_Date`, `Expiration_Date`, `Cat_ID`) VALUES
(1, 'Xe Đạp Địa Hình Fascino FS126S 26 Inch', 2900000, 'xedapdiahinhfascinofs126s26inch.jpg', 21, '', '', 100, 0, NULL, NULL, NULL, 1),
(2, 'Xe Đạp Địa Hình Trẻ Em Bravewill 16 Inch', 2500000, 'xedapdiahinhtreembravewill16inch.jpg', 24, '', '', 100, 0, NULL, NULL, NULL, 1),
(3, 'GIÀY LEO NÚI CỔ LỬNG NAM HP734', 1180000, 'giayleonuinamhp734.jpg', 20, '', '', 100, 0, NULL, NULL, NULL, 2),
(4, 'GIÀY LEO NÚI CỔ THẤP NAM COLUMBIA LB019', 1300000, 'giayleonuinamcolumbialb019.jpg', 20, '', '', 100, 0, NULL, NULL, NULL, 2),
(5, 'LỀU CẮM TRẠI 10-12 NGƯỜI', 2500000, 'leucamtrai1012nguoi.jpg', 0, '', '', 100, 0, NULL, NULL, NULL, 3),
(6, 'LỀU CẮM TRẠI 8-10 NGƯỜI', 2200000, 'leucamtrai810nguoi.jpg', 0, '', '', 100, 0, NULL, NULL, NULL, 3),
(7, 'BALO OSPREY KESTREL 48', 1660000, 'baloospreykestrel48.jpg', 0, '', '', 100, 0, NULL, NULL, NULL, 4),
(8, 'BALO DEUTER FUTURA PRO 36', 1290000, 'balodeuterfuturapro36.jpg', 0, '', '', 100, 0, NULL, NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `productsreview`
--

CREATE TABLE `productsreview` (
  `ID` int(11) NOT NULL,
  `ID_Product` int(11) NOT NULL,
  `ID_User` int(11) NOT NULL,
  `Rating` int(11) NOT NULL,
  `Review` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Passwords` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Image` text NOT NULL,
  `Phone` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `Username`, `Passwords`, `Name`, `Image`, `Phone`, `Email`, `Role`) VALUES
(1, 'KhanhDuy', 'KhanhDuy', 'Khánh Duy', 'Users1.jpg', '0123456789', 'duyle210425@gmail.com', 0),
(2, 'KhanhDuy1', 'Duy', 'Khánh Duy Lê Nguyễn', 'Users2.webp', '0123456787', 'duyle210420@gmail.com', 2),
(4, 'Banana', 'Khanh', 'Chuối Không Báo', '', '0123456788', 'duyle21042@gmail.com', 2),
(5, 'tuann', '12345678', 'Tuấn', 'Users5.webp', '0378233612', 'thanhtuan30032005@gmail.com', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Product` (`ID_Product`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Product` (`ID_Product`),
  ADD KEY `Order_ID` (`Order_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Cat_id` (`Cat_ID`);

--
-- Indexes for table `productsreview`
--
ALTER TABLE `productsreview`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Product` (`ID_Product`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `productsreview`
--
ALTER TABLE `productsreview`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`ID_Product`) REFERENCES `products` (`ID`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`ID_User`) REFERENCES `users` (`ID`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`ID_Product`) REFERENCES `products` (`ID`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`ID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `Cat` FOREIGN KEY (`Cat_ID`) REFERENCES `categories` (`ID`),
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`Cat_id`) REFERENCES `categories` (`ID`);

--
-- Constraints for table `productsreview`
--
ALTER TABLE `productsreview`
  ADD CONSTRAINT `productsreview_ibfk_1` FOREIGN KEY (`ID_Product`) REFERENCES `products` (`ID`),
  ADD CONSTRAINT `productsreview_ibfk_2` FOREIGN KEY (`ID_User`) REFERENCES `users` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
