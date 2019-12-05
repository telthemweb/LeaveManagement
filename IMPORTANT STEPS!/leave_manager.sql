-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 17, 2018 at 09:33 AM
-- Server version: 5.7.20
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leave_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `accepted_leaves`
--

CREATE TABLE `accepted_leaves` (
  `id` int(11) NOT NULL,
  `leave_id` bigint(20) NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  `leave_type` varchar(250) NOT NULL,
  `num_days` int(11) NOT NULL,
  `date_accepted` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accepted_leaves`
--

INSERT INTO `accepted_leaves` (`id`, `leave_id`, `staff_id`, `leave_type`, `num_days`, `date_accepted`) VALUES
(1, 191521664375, 3201821131600, 'annual', 84, '21-03-2018'),
(2, 191521664375, 3201821131600, 'annual', 8, '21-03-2018'),
(3, 171521752477, 3201821131600, 'long_embark_disembark', 7, '24-03-2018'),
(11, 191521664227, 4201804045945, 'emergency', 75, '25-03-2018'),
(12, 141521664135, 3201821131600, 'annual', 71, '29-03-2018');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `admin_id` bigint(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `fname` varchar(150) NOT NULL,
  `lname` varchar(150) NOT NULL,
  `username` varchar(70) NOT NULL,
  `password` varchar(250) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` int(10) UNSIGNED NOT NULL,
  `date_registered` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `admin_id`, `title`, `fname`, `lname`, `username`, `password`, `email`, `phone`, `date_registered`) VALUES
(1, 152122333134, 'Dr', 'Main', 'Administrator', 'admin', '$2y$10$p3d1dr/FuAkfqQ30EAuqlumWF7c9vy4b0kKkSpx2.janWhzBU5nu6', 'groupone-admin@gmail.com', 500000000, '2018-03-22');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `fname` varchar(150) NOT NULL,
  `lname` varchar(150) NOT NULL,
  `username` varchar(70) NOT NULL,
  `password` varchar(250) NOT NULL,
  `email` varchar(200) NOT NULL,
  `country_code` varchar(4) NOT NULL,
  `phone` int(10) UNSIGNED NOT NULL,
  `supervisor` varchar(200) DEFAULT NULL,
  `staff_level` enum('supervisor','non-supervisor') DEFAULT NULL,
  `date_registered` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `staff_id`, `title`, `fname`, `lname`, `username`, `password`, `email`, `country_code`, `phone`, `supervisor`, `staff_level`, `date_registered`) VALUES
(1, 3201821131600, 'Mr', 'Sample', 'Supervisor', 'supervisor', '$2y$10$WlamRug8jhoNKItvm6b7leFwecCAG14KtzwJ47bp7W4ti7JBbm1jy', 'supervisor@yahoo.com', '+233', 543550008, 'N/A', 'supervisor', '2018-03-21'),
(6, 4201804045945, 'Mrs', 'Alhassan', 'Khadija', 'khadija', '$2y$10$JO4.ykL71kZtIXCNlX0VVuouCJTSN2o46XE4ng8L/fbJcDEEW6q7O', 'khad@gmail.com', '+233', 544344555, 'supervisor', 'non-supervisor', '2018-04-04'),
(7, 4201817073720, 'Mr', 'Normal', 'Staff', 'staff-one', '$2y$10$7OsZw4oh8gnDg322Dp1efO2XFgZUMDmrvh0CkTA8sRiHtAR0TbDii', 'staff@gmail.com', '+214', 537596761, NULL, NULL, '2018-04-17');

-- --------------------------------------------------------

--
-- Table structure for table `job_description`
--

CREATE TABLE `job_description` (
  `id` int(11) NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  `staff_level` enum('supervisor','non-supervisor') NOT NULL,
  `salary_level` decimal(45,2) NOT NULL,
  `date_joined` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job_description`
--

INSERT INTO `job_description` (`id`, `staff_id`, `staff_level`, `salary_level`, `date_joined`) VALUES
(1, 3201821131600, 'supervisor', '1500.00', '2017-10-30'),
(2, 4201804045945, 'non-supervisor', '5000.00', '2018-03-05');

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` int(11) NOT NULL,
  `leave_id` bigint(20) NOT NULL,
  `leave_type` enum('annual','sick','maternity','paternity','study','emergency','casual','special','examinations','sports','absense','short_embark_disembark','long_embark_disembark') NOT NULL,
  `allowed_days` bigint(20) NOT NULL,
  `current_days` int(11) NOT NULL,
  `allowed_monthly_days` bigint(20) NOT NULL,
  `for_staff_level` varchar(200) NOT NULL,
  `auto_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`id`, `leave_id`, `leave_type`, `allowed_days`, `current_days`, `allowed_monthly_days`, `for_staff_level`, `auto_update`) VALUES
(1, 141521664135, 'annual', 30, 30, 15, 'non-supervisor', 1524255725),
(2, 111521664139, 'sick', 0, 0, 30, 'non-supervisor', 1524255729),
(3, 201521664164, 'maternity', 90, 90, 30, 'non-supervisor', 1524255754),
(4, 201521664189, 'paternity', 30, 30, 15, 'non-supervisor', 1524255779),
(5, 191521664208, 'study', 300, 300, 30, 'non-supervisor', 1524255798),
(6, 191521664227, 'emergency', 30, 30, 7, 'non-supervisor', 1524255817),
(7, 131521664254, 'casual', 25, 25, 2, 'non-supervisor', 1524255844),
(8, 161521664278, 'special', 15, 15, 5, 'non-supervisor', 1524255868),
(9, 141521664294, 'examinations', 63, 63, 21, 'non-supervisor', 1524255884),
(10, 191521664322, 'sports', 21, 21, 5, 'non-supervisor', 1524255912),
(11, 131521664341, 'absense', 15, 15, 2, 'non-supervisor', 1524255931),
(12, 191521664359, 'short_embark_disembark', 15, 15, 3, 'non-supervisor', 1524255949),
(13, 191521664375, 'long_embark_disembark', 30, 30, 5, 'non-supervisor', 1524255965),
(14, 171521752477, 'annual', 300, 300, 20, 'supervisor', 1524344067),
(15, 111521833755, 'sick', 0, 0, 30, 'supervisor', 1524425345),
(16, 191521833769, 'maternity', 23, 23, 4, 'supervisor', 1524425359),
(17, 141521833782, 'paternity', 45, 45, 2, 'supervisor', 1524425372);

-- --------------------------------------------------------

--
-- Table structure for table `leave_applications`
--

CREATE TABLE `leave_applications` (
  `id` int(11) NOT NULL,
  `leave_id` bigint(20) NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  `leave_type` varchar(250) NOT NULL,
  `leave_start_date` varchar(25) NOT NULL,
  `leave_end_date` varchar(25) NOT NULL,
  `action` enum('accept','reject') DEFAULT NULL,
  `date_requested` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leave_applications`
--

INSERT INTO `leave_applications` (`id`, `leave_id`, `staff_id`, `leave_type`, `leave_start_date`, `leave_end_date`, `action`, `date_requested`) VALUES
(1, 191521664375, 3201821131600, 'annual', '2018-03-22', '2018-03-30', 'accept', '21-03-2018'),
(4, 201521664189, 3201821131600, 'annual', '2018-03-31', '2018-04-03', 'accept', '24-03-2018'),
(6, 171521752477, 3201821131600, 'long_embark_disembark', '2018-03-24', '2018-03-31', 'accept', '24-03-2018'),
(7, 0, 3201821131600, 'study', '2018-03-26', '2018-03-31', 'reject', '24-03-2018'),
(8, 141521664294, 3201821131600, 'examinations', '2018-03-29', '2018-03-30', 'accept', '22-03-2018'),
(9, 191521664322, 3201821131600, 'sports', '2018-03-29', '2018-04-07', 'accept', '22-03-2018'),
(10, 201521664164, 3201821131600, 'maternity', '2018-03-28', '2018-04-04', 'accept', '22-03-2018'),
(11, 161521664278, 4201804045945, 'special', '2018-03-23', '2018-03-30', 'accept', '22-03-2018'),
(12, 191521664227, 4201804045945, 'emergency', '2018-03-31', '2018-04-06', 'accept', '25-03-2018'),
(13, 111521833755, 3201821131600, 'sick', '2018-04-07', '2018-04-13', 'accept', '29-03-2018'),
(14, 141521664135, 3201821131600, 'annual', '2018-03-30', '2018-04-01', 'accept', '29-03-2018');

-- --------------------------------------------------------

--
-- Table structure for table `password_recovery_meta`
--

CREATE TABLE `password_recovery_meta` (
  `id` int(11) NOT NULL,
  `token` varchar(2000) NOT NULL,
  `expiry` bigint(20) DEFAULT NULL,
  `email` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `recommended_leaves`
--

CREATE TABLE `recommended_leaves` (
  `id` int(11) NOT NULL,
  `leave_id` bigint(20) NOT NULL,
  `leave_type` varchar(250) NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  `recommended_by` varchar(250) NOT NULL,
  `num_days` int(11) NOT NULL,
  `why_recommend` varchar(1000) NOT NULL,
  `date_recommended` varchar(25) NOT NULL,
  `status` enum('accepted','rejected') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recommended_leaves`
--

INSERT INTO `recommended_leaves` (`id`, `leave_id`, `leave_type`, `staff_id`, `recommended_by`, `num_days`, `why_recommend`, `date_recommended`, `status`) VALUES
(1, 201521664189, 'annual', 3201821131600, 'supervisor', 72, 'No reason', '24-03-2018', 'rejected'),
(2, 141521664294, 'examinations', 3201821131600, 'supervisor', 1, 'There is no reason to reject this leave as I\'ve not seen anything wrong with it anywhere.\r\n\r\nHowever, the admin may find reasons that will be enough to reject the leave if he so sees them. But to me, I can\'t see anything wrong with the leave.', '22-03-2018', 'accepted'),
(3, 191521664322, 'sports', 3201821131600, 'supervisor', 78, '', '22-03-2018', 'accepted'),
(8, 191521664227, 'emergency', 4201804045945, 'supervisor', 75, '', '25-03-2018', 'accepted'),
(9, 201521664164, 'maternity', 3201821131600, 'supervisor', 76, '', '25-03-2018', NULL),
(10, 161521664278, 'special', 4201804045945, 'supervisor', 7, '', '25-03-2018', NULL),
(11, 111521833755, 'sick', 3201821131600, 'supervisor', 6, 'For example, on Ubuntu, \'pip\' for one would no longer run correctly unless you directly edited the file and changed the shebang to reference \'#!/usr/bin/env python2.7\'. On RHEL (Red Hat Enterprise Linux) flavors such as Red Hat, Fedora and CentOS, the \'Yum\' command is also dependent on Python 2.7.\r\n\r\nMy point here is that you would cause a significant amount of code to start throwing assertion errors just so you could type \'python\' in the terminal to reference Python 3.x.', '29-03-2018', NULL),
(12, 141521664135, 'annual', 3201821131600, 'supervisor', 71, '', '29-03-2018', 'accepted');

-- --------------------------------------------------------

--
-- Table structure for table `rejected_leaves`
--

CREATE TABLE `rejected_leaves` (
  `id` int(11) NOT NULL,
  `leave_id` bigint(20) NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  `leave_type` varchar(250) NOT NULL,
  `reason_reject` varchar(1000) DEFAULT NULL,
  `date_rejected` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rejected_leaves`
--

INSERT INTO `rejected_leaves` (`id`, `leave_id`, `staff_id`, `leave_type`, `reason_reject`, `date_rejected`) VALUES
(1, 201521664189, 3201821143322, 'annual', 'The end of the working period is almost over. Granting this leave request means that the worker will not be available when the company is going on work vacations.\r\nThis is highly not recommended since the employee may be dismiss as a result of missing vacation day activities.', '24-03-2018'),
(5, 0, 3201821143322, 'study', ' This leave has no ID and so recommending it will be nonsense. If you want your leave to be recommended, try following the right procedure in requesting a leave.\r\n\r\nYou can\'t just request anything and expect me to recommend it. If there is any problem, how do you expect me to reference the leave? How can I justify you followed the right precedure?', '24-03-2018');

-- --------------------------------------------------------

--
-- Table structure for table `user_leave_metadata`
--

CREATE TABLE `user_leave_metadata` (
  `id` int(11) NOT NULL,
  `staff_level` varchar(200) NOT NULL,
  `total_yr_leave_count` bigint(20) NOT NULL,
  `total_month_leave_count` bigint(20) NOT NULL,
  `current_days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_leave_metadata`
--

INSERT INTO `user_leave_metadata` (`id`, `staff_level`, `total_yr_leave_count`, `total_month_leave_count`, `current_days`) VALUES
(1, 'non-supervisor', 300, 25, 300),
(2, 'supervisor', 320, 30, 320);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accepted_leaves`
--
ALTER TABLE `accepted_leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_id` (`admin_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff_id` (`staff_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `job_description`
--
ALTER TABLE `job_description`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `leave_id` (`leave_id`);

--
-- Indexes for table `leave_applications`
--
ALTER TABLE `leave_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_recovery_meta`
--
ALTER TABLE `password_recovery_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recommended_leaves`
--
ALTER TABLE `recommended_leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rejected_leaves`
--
ALTER TABLE `rejected_leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_leave_metadata`
--
ALTER TABLE `user_leave_metadata`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accepted_leaves`
--
ALTER TABLE `accepted_leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `job_description`
--
ALTER TABLE `job_description`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `leave_applications`
--
ALTER TABLE `leave_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `password_recovery_meta`
--
ALTER TABLE `password_recovery_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recommended_leaves`
--
ALTER TABLE `recommended_leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `rejected_leaves`
--
ALTER TABLE `rejected_leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_leave_metadata`
--
ALTER TABLE `user_leave_metadata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
