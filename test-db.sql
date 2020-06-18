-- phpMyAdmin SQL Dump
-- version 4.9.5deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 18, 2020 at 12:31 PM
-- Server version: 10.3.22-MariaDB-0ubuntu0.19.10.1
-- PHP Version: 7.3.11-0ubuntu0.19.10.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dnsbl`
--

-- --------------------------------------------------------

--
-- Table structure for table `ips`
--

CREATE TABLE `ips` (
  `ipaddress` varchar(40) NOT NULL DEFAULT '',
  `dateadded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reportedby` varchar(40) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `attacknotes` text DEFAULT NULL,
  `b_or_w` char(1) NOT NULL DEFAULT 'b',
  `gline_type` varchar(10) DEFAULT NULL,
  `remove_request` text DEFAULT NULL,
  `remove_addr` text DEFAULT NULL,
  `remove_email` text DEFAULT NULL,
  `remove_notes` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='dnsbl database';

--
-- Dumping data for table `ips`
--

INSERT INTO `ips` (`ipaddress`, `dateadded`, `reportedby`, `updated`, `attacknotes`, `b_or_w`, `gline_type`, `remove_request`, `remove_addr`, `remove_email`, `remove_notes`) VALUES
('1.2.3.0/24', '2020-06-14 21:17:37', '51.83.185.181', '2020-06-14 21:17:37', '', 'b', '3', 'No', NULL, NULL, NULL),
('188.26.207.46', '2020-06-17 21:01:46', '51.83.185.181', '2020-06-17 21:01:46', '', 'b', '5', 'Yes', '188.26.207.46', 'test@gmal.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
('2001:1:2:3:4:5:7:8', '2020-06-17 06:24:45', '51.83.185.181', '2020-06-17 06:24:45', '', 'b', '3', 'No', NULL, NULL, NULL),
('188.26.207.45', '2020-06-17 21:17:03', '51.83.185.181', '2020-06-17 21:17:03', '', 'b', '7', 'No', NULL, NULL, NULL),
('7.7.7.7', '2020-06-18 00:11:11', '51.83.185.181', '2020-06-18 00:11:11', '', 'b', '11', 'Yes', '188.26.207.46', 'test@gmail.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

-- --------------------------------------------------------

--
-- Table structure for table `web_users`
--

CREATE TABLE `web_users` (
  `memberID` int(11) UNSIGNED NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` varchar(10) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `web_users`
--

INSERT INTO `web_users` (`memberID`, `username`, `password`, `email`, `role`) VALUES
(1, 'Man', '$2y$10$x.p3354fgdhfjgkuyFpVBzCPvMEEZ.0vUsaZe5Rk6pLMQfgfsxGWKXgBcO.HFmxBII1u', 'wildman@undernet.org', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ips`
--
ALTER TABLE `ips`
  ADD PRIMARY KEY (`ipaddress`),
  ADD KEY `dateadded` (`dateadded`),
  ADD KEY `b_or_w` (`b_or_w`);

--
-- Indexes for table `web_users`
--
ALTER TABLE `web_users`
  ADD PRIMARY KEY (`memberID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `web_users`
--
ALTER TABLE `web_users`
  MODIFY `memberID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
