-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2019 at 07:53 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineshop`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, '3B PUTTY'),
(2, '3M'),
(3, 'ABUS'),
(4, 'ABSORBENT SPECIALTY PRODUCTS'),
(5, 'ABUS'),
(6, 'ALTEK SPECTACLE KITS');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Electronics & Batteries'),
(2, 'Security'),
(3, 'Safety'),
(4, 'Lab supplies'),
(5, 'Personal Protective Equipments'),
(6, 'Gloves/Spectacles'),
(7, 'Electronics Gadgets');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com');


-- --------------------------------------------------------
--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------


--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Puneeth', 'puneethreddy951@gmail.com', 'Bangalore, Kumbalagodu, Karnataka', 'Bangalore', 'Karnataka', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--
INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'Battery', 2, 'very affordable', 'small.png', 'battery electronics'),
(2, 1, 3, 'Inverter Battery', 3, 'Visit and buy at cool prices', 'big.png', 'inverter Battery electronics'),
(3, 1, 3, 'Small batteries', 4, 'electronics and battery brand', 'colored.png', 'battery electronics '),
(4, 1, 3, 'Automative Battery', 320, 'Automative Battery at a cool price ', 'black.png', 'Battery electronics automative'),
(5, 1, 2, 'Inverter transparent Battery', 10, 'transparent Battery', 'exide.png', 'transparent battery inverter'),
(6, 1, 1, 'Consumer Electronics', 350, 'Home appliance consumer washing machine', 'gad.png', 'washing machine home appliance '),
(7, 1, 1, 'Transparent Electronic Home', 50, 'Audio and Video Appliances', 'fri.png', 'Video Audio Appliances'),
(8, 1, 4, 'Electronic', 40, 'Transparent', 'things.png', 'Electronics'),
(9, 2, 6, 'CCTV Security Camera', 1000, 'CCTV white security camera', 'red dress1026.jpg', 'CCTV camera Security '),
(10, 2, 6, 'Home Security', 1200, 'DIY Home security Systems', 'images1126.jpg', 'security systems'),
(12, 2, 6, 'C&J Security Systems', 150, 'LLC Security', 'closed-circuit-television-camera-wireless-security-camera-clip-art-png-favpng-kWM13rmJGhS1iUK7qhSH772x1_t.jpg', 'Security System'),
(13, 2, 6, 'SpringAutumnDress', 1200, 'girls dress', 'c.jpg', 'girl dress'),
(14, 3, 6, 'Comem RIS Integrated Safety Detector', 14, 'detector insulator', 'ABB+Comem+RIS2+Integrated+Safety+Device.png', 'insulect safety device'),
(15, 3, 6, 'Cellular Lone safety device', 1500, 'girl dress', 'loner900_web2.png', 'Cellular Lone Worker safety device'),
(16, 2, 6, 'Fire alarm', 60, '2012-Winter-Sweater-for-Men-for-better-outlook', 'png-clipart-alarm-device-tyco-international-security-surveillance-fire-alarm-notification-appliance-intrusion-electronics-service.png', 'safety alarm device fire'),
(17, 3, 6, 'Home Safey ', 10, 'gents formal look', '6.png', 'Safet device'),
(19, 3, 6, 'RIS', 30, 'ad', 'ABB+Comem+RIS+integrated+safety+device.png', 'RIS safety device'),
(20, 3, 6, 'Loneworker', 12, 'jg', 'diagram.png', 'loneworker safety '),
(21, 3, 6, 'Beacon', 800, 'ssds', 'Capture-wander2-5739809.png', 'safety device personal'),
(22, 4, 6, 'Lab Equipment ', 100, 'yello t shirt with pant', '86-862625_lab-medical-lab-equipment-png.png', 'lab medical supplies'),
(23, 4, 6, 'Medical tools', 10, 'sadsf', 'pngtree-medical-tools-laboratory-equipment-png-image_2755816.jpg', 'lab tools'),
(24, 4, 6, 'Transparent lab', 70, 'g', '86-862625_lab-medical-lab-equipment-png (1).png', 'lab equipment'),
(25, 4, 6, 'Science lab', 750, 'as', 'science-lab-equipment-jni.png', 'science lab equipment'),
(27, 4, 6, 'Labornetzteil', 690, 'sd', 'png-clipart-power-supply-unit-electronics-power-converters-switched-mode-power-supply-electrical-network-laboratory-equipment-electronics-electronic-device.png', 'equipments lab labornetzteil'),
(32, 5, 0, 'PPE', 250, 'book shelf', 'png-clipart-headphones-hearing-personal-protective-equipment-earmuffs-headphones-electronics-sound.png', 'Personal Protective Equipment'),
(33, 6, 2, 'Safety glasses', 30, 'Refrigerator', 'png-transparent-goggles-glasses-safety-scientist-glasses-s-angle-laboratory-sports-equipment.png', 'glasses gloves'),
(34, 6, 4, 'Side Shields for glasses', 1000, 'Emergency Light', 'Side_Shields_for_Glasses_Australia_USA_Made_Safety_Optical_Services_SOS_SunSafe_Australia.png', 'sunsafe spectacle'),
(35, 6, 0, 'Safety googles', 6, 'Vaccum Cleaner', 'png-clipart-goggles-sunglasses-construction-site-safety-focal-segmental-glomerulosclerosis-safety-goggles-quality-glasses-thumbnail.png', 'googles safety'),
(36, 6, 5, 'gloves', 1, 'gj', 'MA1911.png', 'gloves'),
(37, 6, 5, 'Spectacles', 20, 'LED TV', 'png-transparent-spectacles-glasses-eyeglasses-frame-eyewear-accessory-lens-optic-specs-optical.png', 'spectacles '),
(38, 6, 4, 'Driving gloves', 30, 'Microwave Oven', 'f73a1ae7d5ab0fae0831f9377ae766fe.png', 'gloves'),
(39, 6, 5, 'Mixer Prot glove elastic cuff', 2500, 'Mixer Grinder', 'MA1828B0.png', 'gloves chainsaw'),
(40, 2, 6, 'Mask', 1.5, 'Formal girls dress', 'pngtree-medical-mask-surgical-mask-n95-mask-for-coronavirus-png-image_2164083.jpg', 'mask'),
(45, 1, 2, 'White Face Mask', 10, '0', 'White_Face_Mask_PNG_Clipart-3285.png', 'mask'),
(46, 1, 2, 'Nose mask', 10, '', 'pngtree-medical-mask-watercolor-blue-side-face-png-image_2162719.jpg', 'mask'),
(47, 4, 6, 'Mask', 650, 'nbk', 'png-clipart-dust-mask-clothing-accessories-surgical-mask-mask-face-fashion-thumbnail.png', 'Nose'),
(48, 1, 7, 'Face Mask', 1, 'Headphones', 'Face-Mask-Download-PNG-Image.png', 'Face mask'),
(49, 1, 7, 'Black Mask', 2, 'Headphones', '5374e43074e77c4879c4c80052619538.jpg', 'Black mask'),
(50, 3, 6, 'Face mask', 3, 'shirts', 'face-shield-regular-fit.png', 'face shield '),
(51, 3, 6, 'plastic face shield', 27, 'shirts', 'Upright-Face-Shield_2-sm-web-280x300.png', 'plastic face shields'),
(52, 3, 6, 'PPE', 453, 'shirts', 'png-transparent-personal-protective-equipment-safety-graphy-hazard-fall-protection-others-miscellaneous-hat-sports-equipment.png', 'PPE'),
(53, 3, 6, 'PPE', 220, 'shirts', 'png-clipart-occupational-safety-and-health-personal-protective-equipment-fire-safety-construction-site-safety-health-outdoor-shoe-sports-equipment.png', 'suit PPE'),
(54, 3, 6, 'PPE', 290, 'shirts', 'png-clipart-personal-protective-equipment-architectural-engineering-construction-site-safety-occupational-safety-and-health-construction-worker-building-building-general-contractor.png', 'suit PPE'),
(55, 3, 6, 'PPE', 259, 'shirts', '506-5064663_health-and-safety-in-the-workplace-personal-protective.png', 'suit PPE'),
(56, 3, 6, 'PPE', 299, 'shirts', '380-3806078_personal-protective-equipment.png', 'suit PPE'),
(57, 3, 6, 'PPE', 260, 'shirts', 'food-personal-protective-equipment-chef-clothing-workwear-png-favpng-CbkMqynCcEf5Ls0rMPJjS52N2.jpg', 'suit PPE'),
(58, 3, 6, 'PPE', 350, 'shirts', 'occupational-safety-and-health-personal-protective-equipment-security-png-favpng-f9CvUbihgKw4RfmG3ujBkjTNm.jpg', 'suit PPE'),
(59, 3, 6, 'PPE', 855, 'shirts', 'transparent-cartoon-construction-worker-personal-protective-eq-5ddfb6ba4f7964.7206027315749423943255.jpg', 'suit PPE'),
(60, 3, 6, 'PPE', 150, 'shirts', 'pngtree-illustration-of-health-worker-close-up-using-protective-equipments-png-image_6624621.jpg', 'suit PPE'),
(61, 3, 6, 'PPE', 215, 'shirts', 'standard-construction-safety-equipment-E7D3N2.jpg', 'suit PPE'),
(62, 3, 6, 'PPE', 299, 'shirts', 'imgbin-stock-photography-safety-laborer-construction-worker-personal-protective-equipment-construction-workers-Cf5FWUanv5SFLqVQH472y7Cdd.jpg', 'suit PPE'),
(63, 3, 6, 'PPE', 550, 'Pants', 'pngtree-medical-personnel-in-ppe-kit-collecting-coronavirus-sample-png-image_6940276.png', 'PPE'),
(64, 3, 6, 'PPE', 460, 'pants', '3S-Lift-Full-Body-Harness-Personal-Protective-Equipment-4-Grey-1-aspect-ratio-657-542-mask-1.png', 'PPE'),
(65, 3, 6, 'PPE', 470, 'pants', 'safety-helmet-png-transparent-picture-personal-protective-equipment-helmet-1156329123961zgjexsh2.png', 'PPE'),
(66, 3, 6, 'PPE', 480, 'pants', 'High-Quality-Personal-Protective-Equipment.jpg', 'PPE'),
(67, 3, 6, 'PPE', 360, 'pants', 'ppe---800x315.png', 'PPE'),
(68, 3, 6, 'PPE', 550, 'pants', 'pngtree-protective-equipment-helmet-hard-hat-png-image_6204860.jpg', 'PPE'),
(69, 3, 6, 'PPE', 390, 'pants', '380-3804995_worker-using-ppe-equipment-personal-protective-equipment.png', 'PPE'),
(70, 3, 6, 'PPE', 399, 'pants', 'transparent-hard-hat-yellow-personal-protective-equipment-helm-5d8e86277e8230.7466482215696215435182.jpg', 'PPE'),
(71, 1, 2, 'Doctor PPE', 5, 'Samsung galaxy s7', 'Doctor-wear-ppe-suit-with-n95-mask-face-on-transparent-background-PNG.png', 'PPE mobile electronics'),
(72, 7, 2, 'Nose Mask', 30, 'sony Headphones', 'mask.png', 'sony Headphones electronics gadgets'),
(73, 7, 2, 'Machine Industry pipe', 15, 'samsung Headphones', 'machine-576435_1280.png', 'pipes electronics gadgets'),
(74, 1, 1, 'Industrial Equipment', 5500, 'HP i5 laptop', 'material-design-for-industrial-equipment-plan-png_98604.jpg', 'HP i5 laptop electronics'),
(75, 1, 1, 'Cleaning Equipment', 5500, 'HP i7 laptop 8gb ram', 'SS_Industrial_Aree_Comuni_img_0.png', 'HP i7 laptop 8gb ram electronics'),
(76, 1, 5, 'Fire protection equipment', 40, 'sony note 6gb ram', 'industrial-safety-system-health-fire-protection-personal-protective-equipment-risk.jpg', 'sony note 6gb ram mobile electronics'),
(77, 1, 4, 'Automation Equipment', 59, 'MSV laptop 16gb ram', 'automation-equipment.png', 'MSV laptop 16gb ram NVIDEA Graphics electronics'),
(78, 1, 5, 'Fire Accessories', 4579, 'dell laptop 8gb ram intel integerated Graphics', '770-7704109_fire-accessories-car-kit-fire-safety-equipments-png.png', 'dell laptop 8gb ram intel integerated Graphics electronics'),
(79, 7, 2, 'Fire Blanket', 2569, 'camera with 3D pixels', 'imgbin-personal-protective-equipment-fire-safety-fire-blanket-fire-extinguishers-business-cMPpfVaMVnWcpZRiFjt75LDex.jpg', 'camera with 3D pixels camera electronics gadgets'),
(80, 1, 1, 'safety devices', 12343, 'sdfhgh', 'safety-comit-d-hygi-ne-de-s-curit-et-des-conditions-de-travail-labor-personal-protective-equipment-png-favpng-JmRFBYRxQGVfAL2h5cNwY1fuN.jpg', 'dfgh'),
(81, 4, 6, 'transparent safety devices', 300, 'blue dress', 'kisspng-occupational-safety-and-health-environment-health-safety-5aba258248ae55.8237184415221487382977.jpg', 'kids blue dress');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--
CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Dumping data for table `user_info`
--


INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', 'puneeth', '9448121558', '123456789', 'sdcjns,djc'),
(15, 'hemu', 'ajhgdg', 'puneethreddy951@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', '123456789', '9448121558', '123456789', 'sdcjns,djc'),
(14, 'hemanthu', 'reddy', 'hemanthreddy951@gmail.com', '123456788', '6526436723', 's,dc wfjvnvn', 'b efhfhvvbr'),
(15, 'hemu', 'ajhgdg', 'keeru@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(20, 'pramod', 'vh', 'pramod@gmail.com', '124335353', '9767645653', 'ksbdfcdf', 'sjrgrevgsib'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu');

--

-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
