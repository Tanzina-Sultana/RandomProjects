-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2020 at 03:20 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `esutms`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `Assignment_ID` int(11) NOT NULL,
  `Class_ID` int(11) NOT NULL,
  `Assignment_name` varchar(60) NOT NULL,
  `Assignment_type` char(12) NOT NULL,
  `A_Start_date` datetime NOT NULL,
  `END_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `ClassID` int(11) NOT NULL,
  `ModuleID` int(11) DEFAULT NULL,
  `Professor` char(100) DEFAULT NULL,
  `Book` varchar(50) DEFAULT NULL,
  `ClassName` varchar(50) DEFAULT NULL,
  `RoomNumber` varchar(10) DEFAULT NULL,
  `AdditionalNote` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `ContactID` int(11) NOT NULL,
  `ContactName` varchar(200) NOT NULL,
  `ContactPhone` char(10) NOT NULL,
  `ContactEmail` varchar(100) NOT NULL,
  `HotelID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contributor_training`
--

CREATE TABLE `contributor_training` (
  `User_ID` int(11) NOT NULL,
  `TrainingID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `Grade_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Class_ID` int(11) NOT NULL,
  `Assignment_ID` int(11) NOT NULL,
  `Assignment_status` char(12) NOT NULL,
  `Grade_per_assignment` int(11) NOT NULL,
  `Date_time_submission` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `HotelID` int(11) NOT NULL,
  `HLoc` varchar(1000) NOT NULL,
  `HotelName` varchar(1000) NOT NULL,
  `Breakfast` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login_info`
--

CREATE TABLE `login_info` (
  `LOGIN_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Person_Password` varchar(50) NOT NULL,
  `Last_Login_Time` time DEFAULT NULL,
  `Last_Login_Date` date DEFAULT NULL,
  `Last_PwrdChg_Time` time DEFAULT NULL,
  `Last_PwrdChg_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login_info`
--

INSERT INTO `login_info` (`LOGIN_ID`, `User_ID`, `Person_Password`, `Last_Login_Time`, `Last_Login_Date`, `Last_PwrdChg_Time`, `Last_PwrdChg_Date`) VALUES
(200000, 1000000, 'bd462d5d7e7d5f8416515c6b0f3ed640', NULL, NULL, NULL, NULL),
(200001, 1000001, 'bd462d5d7e7d5f8416515c6b0f3ed640', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `ModuleID` int(11) NOT NULL,
  `ModuleName` varchar(50) NOT NULL,
  `TrainingID` int(11) DEFAULT NULL,
  `NumberOfHours` int(11) DEFAULT NULL,
  `MaterialsNeeded` varchar(50) DEFAULT NULL,
  `Notes` varchar(50) DEFAULT NULL,
  `ModuleType` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `User_ID` int(11) NOT NULL,
  `F_Name` char(50) NOT NULL,
  `L_Name` char(50) NOT NULL,
  `M_Name` char(50) DEFAULT NULL,
  `D_O_B` date DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `User_Type` char(50) NOT NULL,
  `Gender` char(6) DEFAULT NULL,
  `Country_Code1` int(11) NOT NULL,
  `Phone_1` varchar(15) NOT NULL,
  `Country_Code2` int(11) DEFAULT NULL,
  `Phone_2` varchar(15) DEFAULT NULL,
  `Home_Institution` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`User_ID`, `F_Name`, `L_Name`, `M_Name`, `D_O_B`, `Email`, `User_Type`, `Gender`, `Country_Code1`, `Phone_1`, `Country_Code2`, `Phone_2`, `Home_Institution`) VALUES
(1000000, '', '', NULL, NULL, 'iokonkwo@g.emporia.edu', '', NULL, 0, '', NULL, NULL, ''),
(1000001, '', '', NULL, NULL, 'cgriffey@emporia.edu', '', NULL, 0, '', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `RestaurantID` int(11) NOT NULL,
  `RLoc` varchar(200) NOT NULL,
  `RName` varchar(50) NOT NULL,
  `Recommend` varchar(10) DEFAULT NULL,
  `DineorCarry` varchar(10) DEFAULT NULL,
  `HalalStatus` varchar(10) NOT NULL,
  `Capacity` varchar(1000) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stayinfo`
--

CREATE TABLE `stayinfo` (
  `User_ID` int(11) NOT NULL,
  `HotelID` int(11) NOT NULL,
  `Roomnum` varchar(30) NOT NULL,
  `DOA` date NOT NULL,
  `EventID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

CREATE TABLE `training` (
  `TrainingID` int(11) NOT NULL,
  `TrainingTitle` varchar(50) NOT NULL,
  `T_Length` char(10) DEFAULT NULL,
  `T_Location` varchar(50) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `NumberOfStudents` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `travel_info`
--

CREATE TABLE `travel_info` (
  `Passport_Num` varchar(50) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Country_Origin` char(50) NOT NULL,
  `Deprt_Date` date NOT NULL,
  `Deprt_Time` time DEFAULT NULL,
  `Deprt_City` char(50) NOT NULL,
  `Arrival_Date` date NOT NULL,
  `Arrival_Time` time NOT NULL,
  `Arrival_Airport` varchar(50) NOT NULL,
  `Dorm_Name` char(50) DEFAULT NULL,
  `Room_Number` varchar(15) DEFAULT NULL,
  `Meal_Pref` varchar(500) DEFAULT NULL,
  `Special_Needs` varchar(500) DEFAULT NULL,
  `Additional_Notes` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_events`
--

CREATE TABLE `t_events` (
  `EventID` int(11) NOT NULL,
  `E_Location` varchar(50) NOT NULL,
  `E_Date` datetime NOT NULL,
  `StartTime` varchar(8) DEFAULT NULL,
  `EndTime` varchar(8) DEFAULT NULL,
  `TripType` varchar(15) DEFAULT NULL,
  `PhoneNumber` char(10) DEFAULT NULL,
  `Duration` char(1) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `ModuleID` int(11) DEFAULT NULL,
  `Attendance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_events_restaurant`
--

CREATE TABLE `t_events_restaurant` (
  `RestaurantID` int(11) NOT NULL,
  `EventID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_schedule`
--

CREATE TABLE `t_schedule` (
  `Schedule_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Training_ID` int(11) NOT NULL,
  `days_of_week` datetime NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`Assignment_ID`),
  ADD UNIQUE KEY `AssignmentAK1` (`Assignment_type`),
  ADD KEY `ClassFK1` (`Class_ID`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`ClassID`),
  ADD KEY `ModuleID` (`ModuleID`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`ContactID`),
  ADD UNIQUE KEY `AK_Contact` (`ContactEmail`),
  ADD KEY `FK_Contact` (`HotelID`);

--
-- Indexes for table `contributor_training`
--
ALTER TABLE `contributor_training`
  ADD PRIMARY KEY (`User_ID`,`TrainingID`),
  ADD KEY `FK_Training` (`TrainingID`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`Grade_ID`),
  ADD KEY `UserFK2` (`User_ID`),
  ADD KEY `ClassFK2` (`Class_ID`),
  ADD KEY `AssignFK` (`Assignment_ID`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`HotelID`),
  ADD UNIQUE KEY `AK_Hotel` (`HLoc`) USING HASH;

--
-- Indexes for table `login_info`
--
ALTER TABLE `login_info`
  ADD PRIMARY KEY (`LOGIN_ID`),
  ADD UNIQUE KEY `LOGIN_INFO_AK1` (`User_ID`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`ModuleID`),
  ADD KEY `TrainingID` (`TrainingID`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `PERSON_AK1` (`F_Name`,`L_Name`,`M_Name`,`D_O_B`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`RestaurantID`),
  ADD UNIQUE KEY `AK_Restaurant` (`RLoc`);

--
-- Indexes for table `stayinfo`
--
ALTER TABLE `stayinfo`
  ADD PRIMARY KEY (`User_ID`,`HotelID`),
  ADD KEY `FK_HotelID` (`HotelID`);

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`TrainingID`);

--
-- Indexes for table `travel_info`
--
ALTER TABLE `travel_info`
  ADD PRIMARY KEY (`Passport_Num`),
  ADD KEY `PERSON_FK` (`User_ID`);

--
-- Indexes for table `t_events`
--
ALTER TABLE `t_events`
  ADD PRIMARY KEY (`EventID`),
  ADD KEY `ModuleID` (`ModuleID`);

--
-- Indexes for table `t_events_restaurant`
--
ALTER TABLE `t_events_restaurant`
  ADD PRIMARY KEY (`RestaurantID`,`EventID`),
  ADD KEY `FK_Events` (`EventID`);

--
-- Indexes for table `t_schedule`
--
ALTER TABLE `t_schedule`
  ADD PRIMARY KEY (`Schedule_ID`),
  ADD KEY `UserFK1` (`User_ID`),
  ADD KEY `TrainingFK` (`Training_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `Assignment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100000;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `ClassID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20000;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `ContactID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4500;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `Grade_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2000000;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `HotelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4000;

--
-- AUTO_INCREMENT for table `login_info`
--
ALTER TABLE `login_info`
  MODIFY `LOGIN_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200002;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `ModuleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000003;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `RestaurantID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3000;

--
-- AUTO_INCREMENT for table `training`
--
ALTER TABLE `training`
  MODIFY `TrainingID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_events`
--
ALTER TABLE `t_events`
  MODIFY `EventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500;

--
-- AUTO_INCREMENT for table `t_schedule`
--
ALTER TABLE `t_schedule`
  MODIFY `Schedule_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignment`
--
ALTER TABLE `assignment`
  ADD CONSTRAINT `ClassFK1` FOREIGN KEY (`Class_ID`) REFERENCES `class` (`ClassID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`ModuleID`) REFERENCES `module` (`ModuleID`);

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `FK_Contact` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`);

--
-- Constraints for table `contributor_training`
--
ALTER TABLE `contributor_training`
  ADD CONSTRAINT `FK_Training` FOREIGN KEY (`TrainingID`) REFERENCES `training` (`TrainingID`),
  ADD CONSTRAINT `FK_User` FOREIGN KEY (`User_ID`) REFERENCES `person` (`User_ID`);

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `AssignFK` FOREIGN KEY (`Assignment_ID`) REFERENCES `assignment` (`Assignment_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ClassFK2` FOREIGN KEY (`Class_ID`) REFERENCES `class` (`ClassID`),
  ADD CONSTRAINT `UserFK2` FOREIGN KEY (`User_ID`) REFERENCES `person` (`User_ID`);

--
-- Constraints for table `login_info`
--
ALTER TABLE `login_info`
  ADD CONSTRAINT `LOGIN_INFO_FK` FOREIGN KEY (`User_ID`) REFERENCES `person` (`User_ID`);

--
-- Constraints for table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `module_ibfk_1` FOREIGN KEY (`TrainingID`) REFERENCES `training` (`TrainingID`);

--
-- Constraints for table `stayinfo`
--
ALTER TABLE `stayinfo`
  ADD CONSTRAINT `FK_HotelID` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`),
  ADD CONSTRAINT `FK_UserID` FOREIGN KEY (`User_ID`) REFERENCES `person` (`User_ID`);

--
-- Constraints for table `travel_info`
--
ALTER TABLE `travel_info`
  ADD CONSTRAINT `PERSON_FK` FOREIGN KEY (`User_ID`) REFERENCES `person` (`User_ID`);

--
-- Constraints for table `t_events`
--
ALTER TABLE `t_events`
  ADD CONSTRAINT `t_events_ibfk_1` FOREIGN KEY (`ModuleID`) REFERENCES `module` (`ModuleID`);

--
-- Constraints for table `t_events_restaurant`
--
ALTER TABLE `t_events_restaurant`
  ADD CONSTRAINT `FK_Events` FOREIGN KEY (`EventID`) REFERENCES `t_events` (`EventID`),
  ADD CONSTRAINT `FK_Restaurant` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`);

--
-- Constraints for table `t_schedule`
--
ALTER TABLE `t_schedule`
  ADD CONSTRAINT `TrainingFK` FOREIGN KEY (`Training_ID`) REFERENCES `training` (`TrainingID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `UserFK1` FOREIGN KEY (`User_ID`) REFERENCES `person` (`User_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
