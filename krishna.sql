--

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



--
-- Database: `krishna`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bookid` varchar(5) NOT NULL,
  `pub_id` varchar(5) DEFAULT NULL,
  `price` decimal(10,3) NOT NULL,
  `type` char(10) DEFAULT NULL,
  `title` varchar(40) NOT NULL
) ;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bookid`, `pub_id`, `price`, `type`, `title`) VALUES
('102', '[103]', '580.000', 'novel', 'math'),
('120', '[102]', '150.000', 'science', 'Enjoy the science'),
('123', '[101]', '120.000', 'kids', 'Enjoy the book');

-- --------------------------------------------------------

--
-- Table structure for table `book_loans1`
--

CREATE TABLE `book_loans1` (
  `loanID` int(5) NOT NULL,
  `cardno` varchar(5) DEFAULT NULL,
  `bookid` varchar(5) DEFAULT NULL,
  `emp_id` varchar(5) DEFAULT NULL,
  `dateout` date DEFAULT NULL,
  `penalty` decimal(3,0) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book_loans1`
--

INSERT INTO `book_loans1` (`loanID`, `cardno`, `bookid`, `emp_id`, `dateout`, `penalty`) VALUES
(103, '102', '123', '[103]', '2022-07-01', '0'),
(122, '109', '120', '[102]', '2022-06-15', '25'),
(140, '108', '120', '[104]', '2022-06-08', '10'),
(145, '104', '102', '[101]', '2022-05-18', '12'),
(155, '104', '123', '[102]', '2022-05-04', '50');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_id` varchar(5) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `birthday_date` date DEFAULT NULL,
  `emp_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `surname`, `name`, `birthday_date`, `emp_date`) VALUES
('[101]', '[sapkota]', '[krishna]', '2000-03-31', '2018-04-06'),
('[102]', '[sapkota]', '[sagun]', '2000-04-07', '2019-07-12'),
('[103]', '[sharma]', '[sujan]', '2002-01-18', '2020-04-06'),
('[104]', '[sharma]', '[hari]', '2004-06-09', '2022-07-04'),
('[105]', '[sharma]', '[shyam]', '2001-07-24', '2022-01-02');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `cardno` varchar(5) NOT NULL,
  `surname` varchar(15) NOT NULL,
  `name` varchar(15) NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `gender` enum('F','M') DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`cardno`, `surname`, `name`, `address`, `phone_no`, `gender`, `email_id`) VALUES
('102', 'karki', 'naran', 'bharatpur', '9874561230', 'M', NULL),
('104', 'kandel', 'prabin', 'bharatpur', '3216457801', 'M', NULL),
('108', 'devkota', 'suman', 'chitwan', '1234567890', 'M', NULL),
('109', 'chalise', 'binod', 'bharatpur', '9874561230', 'M', NULL),
('150', 'kandel', 'sandesh', 'lamjung', '9876541230', 'M', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `publisers`
--

CREATE TABLE `publisers` (
  `pub_id` varchar(5) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Phone_No` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `publisers`
--

INSERT INTO `publisers` (`pub_id`, `Name`, `City`, `Phone_No`) VALUES
('[101]', '[sunil sir]', '[kathmandu]', '[9865358300]'),
('[102]', '[krishna]', '[bharatpur]', '[9865358324]'),
('[103]', '[naran]', '[bharatpur]', '[9865358302]'),
('[104]', '[bishal]', '[gaindakot]', '[9865358303]'),
('[105]', '[diwas]', '[chitwan]', '[9865358304]');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookid`),
  ADD KEY `pub_id` (`pub_id`);

--
-- Indexes for table `book_loans1`
--
ALTER TABLE `book_loans1`
  ADD PRIMARY KEY (`loanID`),
  ADD KEY `cardno` (`cardno`),
  ADD KEY `bookid` (`bookid`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`cardno`);

--
-- Indexes for table `publisers`
--
ALTER TABLE `publisers`
  ADD PRIMARY KEY (`pub_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`pub_id`) REFERENCES `publisers` (`pub_id`);

--
-- Constraints for table `book_loans1`
--
ALTER TABLE `book_loans1`
  ADD CONSTRAINT `book_loans1_ibfk_1` FOREIGN KEY (`cardno`) REFERENCES `members` (`cardno`),
  ADD CONSTRAINT `book_loans1_ibfk_2` FOREIGN KEY (`bookid`) REFERENCES `books` (`bookid`),
  ADD CONSTRAINT `book_loans1_ibfk_3` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`);
COMMIT;


