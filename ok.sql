-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2022 at 05:08 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ok`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_Fname` varchar(20) NOT NULL,
  `admin_Mname` varchar(20) NOT NULL,
  `admin_Lname` varchar(20) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_username` varchar(20) NOT NULL,
  `admin_password` varchar(20) NOT NULL,
  `admin_phone_no` int(11) NOT NULL,
  `admin_email` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_Fname`, `admin_Mname`, `admin_Lname`, `admin_id`, `admin_username`, `admin_password`, `admin_phone_no`, `admin_email`) VALUES
('Red', 'A', 'Bacher', 1111, 'Red11', 'Red123', 7328183, 'red@gmail.com'),
('Sammy', 'G', 'Hall', 1112, 'sam11', 'sam123', 7336493, 'sammy@gmail.com'),
('Carl', 'E', 'Reedy', 1113, 'carl00', 'carl123', 4637194, 'carl@gmail.com'),
('Naveen', 'D', 'Brew', 1114, 'naveen11', 'nav123', 12403578, 'naveen@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(40) NOT NULL,
  `description` varchar(3000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `description`) VALUES
(5004, 'Appliances', NULL),
(5008, 'Bags', NULL),
(5005, 'Books', NULL),
(5009, 'Consoles', NULL),
(5006, 'Electronics', NULL),
(5010, 'Keyboards', NULL),
(5001, 'Laptop', NULL),
(5000, 'Mobiles', NULL),
(5003, 'Pant', NULL),
(5007, 'Pharmacy', NULL),
(5002, 'Shirt', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_form`
--

CREATE TABLE `contact_form` (
  `customer_id` int(11) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_form`
--

INSERT INTO `contact_form` (`customer_id`, `email`, `message`) VALUES
(3, 'evan@gmail.com', 'messages');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `fname` varchar(15) NOT NULL,
  `minit` varchar(1) DEFAULT NULL,
  `lname` varchar(15) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_phone_no` int(11) NOT NULL,
  `customer_email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`fname`, `minit`, `lname`, `address`, `customer_id`, `customer_phone_no`, `customer_email`) VALUES
('John', 'F', 'Jones', '8794 Garfield, Chicago, IL', 1, 8463856, 'john@gmail.com'),
('Kim', 'C', 'Grace', '6677 Mills Ave, Sacramento, CA', 2, 4273488, 'kim@gmail.com'),
('Evan', 'C', 'Wallace', '450 Stone, Houston, TX', 3, 4247383, 'evan@gmail.com'),
('Alex', 'D', 'Freed', '4333 Pillsbury, Milwaukee, WI', 4, 4628465, 'alex@gmail.com'),
('Jared', 'D', 'James', '134 Pelham, Milwaukee, WI', 5, 5738573, 'jared@gmail.com'),
('Andy', 'C', 'Vile', '123 Peachtree, Atlanta, GA', 6, 4729490, 'andy@gmail.com'),
('John', 'B', 'Smith', '980 Dallas, Houston, TX', 7, 2915903, 'john@gmail.com'),
('Tom', 'G', 'Brand', '5631 Rice, Houston, TX', 8, 3892578, 'tom@gmail.com'),
('Bonnie', 'S', 'Bays', '565 Jordan, Milwaukee, WI', 9, 4729104, 'bonnie@gmail.com'),
('Ramesh', 'K', 'Narayan', '263 Mayberry, Milwaukee, WI', 10, 5784291, 'ramesh@gmail.com');

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `before_customer_update` BEFORE UPDATE ON `customer` FOR EACH ROW INSERT INTO CUSTOMER_AUDIT VALUES(
customer_id=OLD.customer_id,
fname=OLD.fname,
minit=OLD.minit,
lname=OLD.lname,
address=OLD.address,
customer_phone_no=OLD.customer_phone_no,
customer_email=OLD.customer_email)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_audit`
--

CREATE TABLE `customer_audit` (
  `fname` varchar(15) NOT NULL,
  `minit` varchar(1) DEFAULT NULL,
  `lname` varchar(15) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_phone_no` int(11) NOT NULL,
  `customer_email` varchar(20) NOT NULL,
  `changedat` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login_details`
--

CREATE TABLE `login_details` (
  `username` varchar(20) NOT NULL,
  `login_password` varchar(20) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login_details`
--

INSERT INTO `login_details` (`username`, `login_password`, `customer_id`) VALUES
('Alex123', 'Alex900', 4),
('Andy', 'Andy2314', 6),
('Bonnie675', 'Bon123', 9),
('Evan987', 'Evan100', 3),
('Jaredddd', 'Jared123', 5),
('John101', 'John0101', 7),
('john453', 'John123', 1),
('Kim000', 'Kim666', 2),
('Ram123', 'Ramesh992', 10),
('Tom176', 'Tom911', 8);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity_purchased` varchar(10) NOT NULL,
  `order_no` int(11) NOT NULL,
  `order_date` date DEFAULT NULL,
  `order_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`customer_id`, `product_id`, `quantity_purchased`, `order_no`, `order_date`, `order_status`) VALUES
(4, 5, '1', 1, '2022-11-18', 'Picked up'),
(9, 5, '1', 2, '2022-11-16', 'Picked up'),
(7, 6, '1', 3, '2022-11-15', 'Cancelled'),
(1, 7, '1', 4, '2022-11-14', 'Picked up'),
(1, 4, '2', 5, '2022-11-14', 'Picked up'),
(8, 10, '1', 6, '2022-11-13', 'Picked up');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `customer_no` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `transaction_id` varchar(20) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `card_no` int(16) DEFAULT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`customer_no`, `store_id`, `transaction_id`, `payment_date`, `card_no`, `amount`) VALUES
(4, 6, 'ghjfty6757', '2022-11-18', 12353234, 20),
(1, 5, 'hgfyt7654', '2022-11-14', 76424573, 1000),
(9, 7, 'jhguy765', '2022-11-16', 75426456, 200),
(8, 7, 'jkhguy7656', '2022-11-13', 674575497, 20),
(1, 6, 'uyff8765', '2022-11-14', 78647642, 20);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `product_cat` varchar(40) NOT NULL,
  `product_subcat` varchar(40) NOT NULL,
  `product_seller_id` int(11) DEFAULT NULL,
  `product_status` varchar(15) DEFAULT NULL,
  `product_qty` varchar(10) NOT NULL,
  `product_location` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `Serial_no` int(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_cat`, `product_subcat`, `product_seller_id`, `product_status`, `product_qty`, `product_location`, `price`, `Serial_no`) VALUES
(1, 'product1', 'Appliances', 'LG_appliances', 1, 'Available', '4', '122 Ball Street, Dallas, TX', '100.00', 1),
(2, 'product2', 'Appliances', 'Samsung_appliances', 2, 'Available', '5', '417 Hancock Ave, Chicago, IL', '139.00', 2),
(3, 'product3', 'Appliances', 'Samsung_appliances', 2, 'Available', '0', '417 Hancock Ave, Chicago, IL', '130.00', 3),
(4, 'product4', 'Appliances', 'Panasonic_appliances', 6, 'Available', '2', '222 Lincoln, Chicago, IL', '120.00', 4),
(5, 'product5', 'Appliances', 'IFB_appliances', 6, 'Available', '2', '222 Lincoln, Chicago, IL', '200.00', 5),
(6, 'product6', 'Bags', 'American_tourister', 7, 'Available', '4', '1976 Boone Trace, Chicago, IL', '20.00', 6),
(7, 'product7', 'Laptop', 'Apple_Laptop', 5, 'Available', '5', '234 Lincoln, Chicago, IL', '1000.00', 7),
(8, 'product8', 'Keyboards', 'Amkette_keyboards', 8, 'Available', '3', '22 Boone Trace, Chicago, IL', '450.00', 8),
(9, 'product9', 'Books', 'Children_books', 6, 'Available', '9', '222 Lincoln, Chicago, IL', '5.00', 9),
(10, 'product10', 'Shirt', 'Lee', 7, 'Available', '4', '1976 Boone Trace, Chicago, IL', '20.00', 10);

--
-- Triggers `product`
--
DELIMITER $$
CREATE TRIGGER `change_qty` BEFORE UPDATE ON `product` FOR EACH ROW SET new.product_qty= new.product_qty-1
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(30) DEFAULT NULL,
  `store_contact_no` int(11) NOT NULL,
  `store_address` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`store_id`, `store_name`, `store_contact_no`, `store_address`) VALUES
(1, 'LG', 2574924, '122 Ball Street, Dallas, TX'),
(2, 'SAMSUNG', 2532744, '417 Hancock Ave, Chicago, IL'),
(3, 'Dell', 438754, '423 Hancock Ave, Chicago, IL'),
(4, 'Nike', 2532744, '400 Hancock Ave, Chicago, IL'),
(5, 'Apple', 3485329, '234 Lincoln, Chicago, IL'),
(6, 'Walmart', 3485329, '222 Lincoln, Chicago, IL'),
(7, 'Target', 3397628, '1976 Boone Trace, Chicago, IL'),
(8, 'Walmart', 3443058, '22 Boone Trace, Chicago, IL');

-- --------------------------------------------------------

--
-- Table structure for table `store_reviews`
--

CREATE TABLE `store_reviews` (
  `store_id` int(11) DEFAULT NULL,
  `review` varchar(150) DEFAULT NULL,
  `rating` decimal(4,2) DEFAULT NULL,
  `sales_made` int(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store_reviews`
--

INSERT INTO `store_reviews` (`store_id`, `review`, `rating`, `sales_made`) VALUES
(5, 'good service', '4.50', 240),
(3, 'average service', '4.00', 180),
(1, 'quick order ready times', '4.30', 190),
(4, NULL, '4.00', 220),
(2, 'slow service', '2.50', 80),
(7, 'amazing service', '5.00', 350),
(6, 'good services', '4.50', 250),
(8, NULL, '3.80', 200);

--
-- Triggers `store_reviews`
--
DELIMITER $$
CREATE TRIGGER `change_sales` BEFORE UPDATE ON `store_reviews` FOR EACH ROW SET new.sales_made= new.sales_made+1
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `P_ID` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `subcategory_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`P_ID`, `subcategory_id`, `subcategory_name`) VALUES
(1, 5000, 'Samsung'),
(2, 5000, 'Apple'),
(3, 5000, 'Oneplus'),
(4, 5000, 'Oppo'),
(5, 5000, 'Redmi'),
(6, 5000, 'Realme'),
(7, 5000, 'Vivo'),
(8, 5000, 'Nokia'),
(9, 5001, 'Lenovo'),
(10, 5001, 'Asus'),
(11, 5001, 'Acer'),
(12, 5001, 'Dell'),
(13, 5001, 'Apple_Laptop'),
(14, 5001, 'Samsung_Laptop'),
(15, 5001, 'HP'),
(16, 5002, 'Puma'),
(17, 5002, 'Nike'),
(18, 5002, 'Spykar'),
(19, 5002, 'Levis'),
(20, 5002, 'VanHeusen'),
(21, 5002, 'Lee'),
(22, 5003, 'Nike_Pants'),
(23, 5003, 'Puma_Pants'),
(24, 5003, 'Adidas_pants'),
(25, 5004, 'Samsung_appliances'),
(26, 5004, 'LG_appliances'),
(27, 5004, 'Panasonic_appliances'),
(28, 5004, 'IFB_appliances'),
(29, 5004, 'Redmi_appliances'),
(30, 5004, 'Vu_appliances'),
(31, 5005, 'Exam_Books'),
(32, 5005, 'Reading_books'),
(33, 5005, 'Children_books'),
(34, 5006, 'JBL'),
(35, 5006, 'Noise'),
(36, 5006, 'Boat'),
(37, 5006, 'Skullcandy'),
(38, 5006, 'Sony'),
(39, 5006, 'AMD'),
(40, 5007, 'Mylab'),
(41, 5007, 'Dettol'),
(42, 5007, 'Boroline'),
(43, 5007, 'OneTouch'),
(44, 5007, 'Apollo'),
(45, 5007, 'Pro_care'),
(46, 5008, 'American_tourister'),
(47, 5008, 'Skybags'),
(48, 5008, 'Safari'),
(49, 5008, 'Wildcraft'),
(50, 5008, 'Nike_bags'),
(51, 5008, 'Puma_bags'),
(52, 5008, 'Fur_jaden'),
(53, 5009, 'Redgear'),
(54, 5009, 'Evofox'),
(55, 5009, 'New_World'),
(56, 5009, 'GSH'),
(57, 5010, 'Redgear_keyboards'),
(58, 5010, 'HP_keyboards'),
(59, 5010, 'Dell_keyboards'),
(60, 5010, 'Zebronics_keyboards'),
(61, 5010, 'Logitech_keyboards'),
(62, 5010, 'Amkette_keyboards');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_name`),
  ADD UNIQUE KEY `UK_CAT` (`category_id`);

--
-- Indexes for table `contact_form`
--
ALTER TABLE `contact_form`
  ADD KEY `fk_contact_form` (`customer_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `login_details`
--
ALTER TABLE `login_details`
  ADD PRIMARY KEY (`username`),
  ADD KEY `fk_login` (`customer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_no`),
  ADD KEY `fk_orders_customer` (`customer_id`),
  ADD KEY `fk_order_product` (`product_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `fk_payment_store` (`store_id`),
  ADD KEY `fk_payment` (`customer_no`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `uk_product` (`Serial_no`),
  ADD KEY `fk_cat_product` (`product_cat`),
  ADD KEY `fk_store_product` (`product_seller_id`),
  ADD KEY `fk_subcat_product` (`product_subcat`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `store_reviews`
--
ALTER TABLE `store_reviews`
  ADD KEY `fk_store_reviews` (`store_id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`P_ID`),
  ADD UNIQUE KEY `uk_subcat` (`subcategory_name`),
  ADD KEY `fk_sub_category` (`subcategory_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1115;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `P_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contact_form`
--
ALTER TABLE `contact_form`
  ADD CONSTRAINT `fk_contact_form` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `login_details`
--
ALTER TABLE `login_details`
  ADD CONSTRAINT `fk_login` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_order_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `fk_orders_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment` FOREIGN KEY (`customer_no`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `fk_payment_customer` FOREIGN KEY (`customer_no`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `fk_payment_store` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_cat_product` FOREIGN KEY (`product_cat`) REFERENCES `category` (`category_name`),
  ADD CONSTRAINT `fk_store_product` FOREIGN KEY (`product_seller_id`) REFERENCES `store` (`store_id`),
  ADD CONSTRAINT `fk_subcat_product` FOREIGN KEY (`product_subcat`) REFERENCES `subcategory` (`subcategory_name`);

--
-- Constraints for table `store_reviews`
--
ALTER TABLE `store_reviews`
  ADD CONSTRAINT `fk_store_reviews` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`);

--
-- Constraints for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `fk_sub_category` FOREIGN KEY (`subcategory_id`) REFERENCES `category` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
