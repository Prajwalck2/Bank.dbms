-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2022 at 01:10 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bms`
--

-- --------------------------------------------------------

--
-- Table structure for table `adetails`
--

CREATE TABLE `adetails` (
  `id` int(11) NOT NULL,
  `anumber` varchar(25) NOT NULL,
  `atype` varchar(25) NOT NULL,
  `aname` varchar(25) NOT NULL,
  `cemail` varchar(25) NOT NULL,
  `agender` varchar(25) NOT NULL,
  `adob` date NOT NULL,
  `aaddress` varchar(50) NOT NULL,
  `aphone` varchar(12) NOT NULL,
  `abalance` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adetails`
--

INSERT INTO `adetails` (`id`, `anumber`, `atype`, `aname`, `cemail`, `agender`, `adob`, `aaddress`, `aphone`, `abalance`) VALUES
(1, 'B24680VS', 'Savings Account', 'Vijay S', 'vijays@gmail.com', 'Male', '2002-09-05', '#45,8th main,Vijaynagar,Mysore', '9373860544', 50000),
(2, 'B24681AK', 'Current Account', 'Akshay Kumar D', 'akshaykumard@gmail.com', 'Male', '1995-05-17', '#5,18th main, Viveknagar, Banglore', '8733669348', 5000),
(3, 'B24682KS', 'Fixed Deposit', 'Kiran S', 'kirans@gmail.com', 'Male', '2002-03-06', '#5,2th cross,T K Layout, Mysore', '73309823467', 10000),
(4, 'B24683SK', 'Current Account', 'Sudeep K', 'sudeepk@gmail.com', 'Male', '1978-09-02', '#5,1st Cross, Jainagar, Banglore', '9008754321', 1000000),
(5, 'B24684AR', 'Savings Account', 'Ashika R', 'ashikar@gmail.com', 'Female', '2002-01-10', '#5,8th main,Vijaynagar,Chickmagalur', '8899098765', 25000),
(6, 'B24685PC', 'Savings Account', 'Prajwal C', 'prajwal@gmail.com', 'Male', '2001-12-03', '#5,7th main,Gandhinagar,Chickmagalur', '9123456432', 5622),
(7, 'B24688RS', 'Savings Account', 'Rethick S', 'rethick@gmail.com', 'Male', '2001-06-30', '#326,17th cross,Chamundeshwari Layout,Mysore', '8431612055', 3400);

-- --------------------------------------------------------

--
-- Table structure for table `adlogin`
--

CREATE TABLE `adlogin` (
  `adid` int(11) NOT NULL,
  `admail` varchar(25) NOT NULL,
  `adpassword` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adlogin`
--

INSERT INTO `adlogin` (`adid`, `admail`, `adpassword`) VALUES
(6, 'rpadmin@gmail.com', 'pbkdf2:sha256:260000$58eS'),
(7, 'bmsadmin@gmail.com', 'pbkdf2:sha256:260000$istE'),
(8, 'hp@gmail.com', 'hp'),
(9, 'rpadmin@gmail.com', 'rpadmin123'),
(10, 'bmsadmin@gmail.com', 'admin@bms456');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `bcode` varchar(25) NOT NULL,
  `address` varchar(50) NOT NULL,
  `bphone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `name`, `bcode`, `address`, `bphone`) VALUES
(1, 'Kuvempunagag,Mysore', 'BKNMY001', '#25,9th Cross,3rd main,Kuvempunagar,Mysore', '9292834756'),
(3, 'Gandhinagar,Chickmagaluru', 'BGNCM002', '#5,9th Cross,2nd main,Gandhinagar,Chickmagaluru', '8427363500'),
(4, 'Jainagar,Banglore', 'BJNBL004', '#235,6th Cross,2nd main,Jainagar,Banglore', '7836281874'),
(5, 'Gokulam,Mysore', 'BGKMY005', '#1,5th Cross,Gokulam,Mysore', '9837002286'),
(6, 'Vijaynagar,Mysore', 'BVNMY006', '#4,5th Cross,Vijaynagar,Mysore', '8362700221');

-- --------------------------------------------------------

--
-- Table structure for table `caccount`
--

CREATE TABLE `caccount` (
  `cid` int(11) NOT NULL,
  `cemail` varchar(50) NOT NULL,
  `cname` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `ctoa` varchar(20) NOT NULL,
  `cdob` date NOT NULL,
  `cib` varchar(50) NOT NULL,
  `cphone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `caccount`
--

INSERT INTO `caccount` (`cid`, `cemail`, `cname`, `gender`, `ctoa`, `cdob`, `cib`, `cphone`) VALUES
(11, 'rethick1@gmail.com', 'pavan1', 'Male1', 'Fixed Deposite1', '2022-01-10', 'mysore1', '8967456432'),
(24, 'None', 'None', 'None', 'None', '0000-00-00', 'None', 'None'),
(25, 'None', 'None', 'None', 'None', '0000-00-00', 'None', 'None');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `empid` int(10) NOT NULL,
  `empname` varchar(50) NOT NULL,
  `empgender` varchar(10) NOT NULL,
  `empdesg` varchar(25) NOT NULL,
  `empaddress` varchar(50) NOT NULL,
  `empphone` varchar(12) NOT NULL,
  `empemail` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`empid`, `empname`, `empgender`, `empdesg`, `empaddress`, `empphone`, `empemail`) VALUES
(112233, 'Akshay Kumar S', 'Male', 'Branch Manager', '#20,8th cross, Mysore', '9087654321', 'akshaykumar@gmail.com'),
(112234, 'Amrutha D', 'Female', 'Internal Auditor', '#10,18th cross, Banglore', '9123456789', 'amrutha@gmail.com'),
(112235, 'Vijay S', 'Male', 'Loan Officier', '#326, 15th cross ,3rd main, hassan', '7265465675', 'vijay@gmail.com'),
(112238, 'Pavan C', 'Male', 'Loan Officier', '#45,7th main,5th Cross,Siddharthnagar,Mysore', '9083461278', 'pavanc@gmail.com'),
(112239, 'Aishwarya k', 'Female', 'Marketing Representative', '#45,5th Cross,Vijaynagar,Shivamogga', '9836579754', 'aishwaryak@gmail.com'),
(112240, 'Raju M', 'Male', 'Bank Teller', '#4,5th Cross,Gokulam,Mysore', '7896543208', 'rajum@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `fid` int(11) NOT NULL,
  `femail` varchar(25) NOT NULL,
  `fname` varchar(25) NOT NULL,
  `ftext` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`fid`, `femail`, `fname`, `ftext`) VALUES
(5, 'prajwal@gmail.com', 'Prajwal C', 'If I had a problem, they fix it right away. I’m loving and I plan on sticking with them for life.'),
(8, 'vijays@gmail.com', 'Vijay S', 'They are professional,kind,and local. Everyone there is so welcoming and they make you feel good'),
(9, 'akshaykumard@gmail.com', 'Akshay Kumar D', 'This bank has an awesome team and a dedicated staff.'),
(10, 'kirans@gmail.com', 'Kiran S', 'Their locations are very clean, comfortable, friendly and beautiful.'),
(11, 'sudeepk@gmail.com', 'Sudeep K ', 'LAZY employees at nearly every branch.');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `tid` int(11) NOT NULL,
  `temail` varchar(25) NOT NULL,
  `taccnum` varchar(20) NOT NULL,
  `tdate` date NOT NULL,
  `ttime` time NOT NULL,
  `ttype` varchar(20) NOT NULL,
  `tamount` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`tid`, `temail`, `taccnum`, `tdate`, `ttime`, `ttype`, `tamount`) VALUES
(101, 'vijays@gmail.com', 'B24680VS', '2022-01-03', '07:10:19', 'Debit', '500'),
(102, 'vijays@gmail.com', 'B24680VS', '2020-02-07', '13:25:09', 'Credit', '2900'),
(103, 'prajwal@gmail.com', 'B24685PC', '2022-01-03', '07:10:19', 'Credit', '670'),
(104, 'prajwal@gmail.com', 'B24685PC', '2022-01-27', '08:08:13', 'Debit', '1230'),
(105, 'vijays@gmail.com', 'B24680VS', '2022-03-09', '06:36:44', 'Credit', '2310'),
(106, 'vijays@gmail.com', 'B24680VS', '2022-03-31', '09:36:44', 'Debit', '580'),
(107, 'vijays@gmail.com', 'B24680VS', '2022-04-02', '12:39:17', 'Credit', '1000'),
(108, 'vijays@gmail.com', 'B24680VS', '2022-04-09', '08:39:17', 'Debit', '789'),
(109, 'prajwal@gmail.com', 'B24685PC', '2022-02-02', '10:42:33', 'Credit', '250'),
(110, 'prajwal@gmail.com', 'B24685PC', '2022-02-28', '09:52:33', 'Debit', '1090'),
(111, 'akshaykumard@gmail.com', 'B24681AK', '2022-02-16', '07:44:21', 'Credit', '4500'),
(112, 'akshaykumard@gmail.com', 'B24681AK', '2022-03-02', '18:44:21', 'Debit', '780'),
(113, 'akshaykumard@gmail.com', 'B24681AK', '2022-03-15', '08:46:02', 'Debit', '6798'),
(114, 'akshaykumard@gmail.com', 'B24681AK', '2022-04-15', '19:46:02', 'Debit', '1000'),
(115, 'kirans@gmail.com', 'B24682KS', '2022-03-01', '08:47:57', 'Credit', '10000'),
(116, 'kirans@gmail.com', 'B24682KS', '2022-04-22', '12:47:47', 'Debit', '100'),
(117, 'kirans@gmail.com', 'B24682KS', '2022-06-09', '12:47:59', 'Credit', '200'),
(118, 'kirans@gmail.com', 'B24682KS', '2022-05-31', '11:11:11', 'Debit', '198'),
(119, 'sudeepk@gmail.com', 'B24683SK', '2022-02-05', '08:52:30', 'Credit', '10000'),
(120, 'sudeepk@gmail.com', 'B24683SK', '2022-03-09', '09:53:34', 'Debit', '5000'),
(121, 'sudeepk@gmail.com', 'B24683SK', '2022-06-30', '08:53:30', 'Debit', '9870'),
(122, 'ashikar@gmail.com', 'B24684AR', '2022-04-02', '06:36:44', 'Credit', '9800'),
(123, 'ashikar@gmail.com', 'B24684AR', '2022-02-16', '07:44:21', 'Debit', '560'),
(124, 'rethick@gmail.com', 'B24688RS', '2022-01-03', '13:25:09', 'Credit', '500'),
(125, 'rethick@gmail.com', 'B24688RS', '2022-02-28', '08:57:07', 'Debit', '1240');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(4, 'rethick', 'rethick@gmail.com', 'pbkdf2:sha256:260000$DSuXqAbPDl7Kt8dE$aea0561aff0d50c7836a96aef44bbfdd3e27b3cb745828fe7e743ee874e65cb5'),
(5, 'prajwal', 'prajwal@gmail.com', 'pbkdf2:sha256:260000$O7CxF37I36NqOCZg$b8d08bbd1047fbc542604dc8c02d8b6ad4aefe0f65748ad62fe6cfa7525b55ec'),
(9, 'Vijay S', 'vijays@gmail.com', 'pbkdf2:sha256:260000$eY8UHrNjRJOtRDXL$2b0b02522789bbfcd6d7e014ce844c90ddc2ce6369993e0d5848808a2fec73ce'),
(10, 'Akshay Kumar D', 'akshaykumard@gmail.com', 'pbkdf2:sha256:260000$mGQw51zz0dPntDmp$aab26766afd277d1d16a7b3f994ac160d1577dbf910c031e2cf4124eba5cd916'),
(11, 'Kiran S', 'kirans@gmail.com', 'pbkdf2:sha256:260000$3nycjMnNY08MCwaw$014fbeed62fc3f4d3c1f7a68f21b471a4cb57317c9fb4509ce70a5acf9192a89'),
(12, 'Sudeep K', 'sudeepk@gmail.com', 'pbkdf2:sha256:260000$8E7YfWRxmDLhfNcy$061d29296a50cb5129a891e35c3a0f47d8115be846433247896c4962fe7342a3'),
(13, 'Ashika R', 'ashikar@gmail.com', 'pbkdf2:sha256:260000$twZFL5EoAWinlp2V$b601b1f0803a011659700d6535ace34a895ae6392ed6124e561a8dd3c27c1896');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adetails`
--
ALTER TABLE `adetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adlogin`
--
ALTER TABLE `adlogin`
  ADD PRIMARY KEY (`adid`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `caccount`
--
ALTER TABLE `caccount`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`empid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adetails`
--
ALTER TABLE `adetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `adlogin`
--
ALTER TABLE `adlogin`
  MODIFY `adid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `caccount`
--
ALTER TABLE `caccount`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `empid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112241;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
