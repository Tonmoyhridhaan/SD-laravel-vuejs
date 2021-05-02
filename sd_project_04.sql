-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2021 at 11:18 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sd_project_04`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `semester` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `code`, `credit`, `type`, `semester`, `created_at`, `updated_at`) VALUES
(1, 'ACC', 'ACC 101', '3', 'theory', 1, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(2, 'ICS', 'CSE 110', '2', 'theory', 1, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(3, 'ElectCt-1', 'EEE 101', '3', 'theory', 1, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(4, 'ENG-1', 'ENG 101', '3', 'theory', 1, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(5, 'EM-1', 'MAT 105', '3', 'theory', 1, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(6, 'PHY-1', 'PHY 101', '3', 'theory', 1, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(7, 'DM', 'CSE 103', '3', 'theory', 2, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(8, 'SP', 'CSE 111', '2', 'theory', 2, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(9, 'Elect-1', 'EEE 211', '3', 'theory', 2, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(10, 'ENG-2', 'ENG 103', '2', 'theory', 2, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(11, 'EM-2', 'MAT 107', '3', 'theory', 2, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(12, 'PHY-2', 'PHY 103', '3', 'theory', 2, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(13, 'OOP', 'CSE 211', '3', 'theory', 3, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(14, 'DS', 'CSE 221', '3', 'theory', 3, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(15, 'ECO', 'ECO 201', '3', 'theory', 3, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(16, 'DE', 'EEE 311', '3', 'theory', 3, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(17, 'EM-3', 'MAT 201', '3', 'theory', 3, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(18, 'ADA', 'CSE 225', '3', 'theory', 4, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(19, 'DMS', 'CSE 237', '3', 'theory', 4, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(20, 'SS', 'EEE 201', '3', 'theory', 4, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(21, 'EM-4', 'MAT 203', '3', 'theory', 4, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(22, 'IBM', 'MGT 203', '3', 'theory', 4, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(23, 'MM', 'EEE 371', '3', 'theory', 5, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(24, 'SEISD', 'CSE 305', '4', 'theory', 5, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(25, 'CE', 'EEE 309', '3', 'theory', 5, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(26, 'OB', 'MGT 251', '3', 'theory', 5, '2021-04-21 04:01:41', '0000-00-00 00:00:00'),
(27, 'CMEP', 'CSE 301', '3', 'theory', 5, '2021-04-21 04:01:41', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `student_id`, `course_id`, `type_id`, `section_id`, `teacher_id`, `session_id`, `status`, `created_at`, `updated_at`) VALUES
(12, 19, 24, 1, 13, 16, 3, 1, '2021-04-21 04:02:29', '0000-00-00 00:00:00'),
(13, 20, 24, 1, 14, 16, 3, 1, '2021-04-21 04:02:29', '0000-00-00 00:00:00'),
(14, 22, 24, 1, 15, 16, 3, 1, '2021-04-21 04:02:29', '0000-00-00 00:00:00'),
(15, 23, 24, 1, 13, 16, 3, 1, '2021-04-21 04:02:29', '0000-00-00 00:00:00'),
(16, 24, 24, 1, 13, 16, 3, 1, '2021-04-21 04:02:29', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `marks_assigns`
--

CREATE TABLE `marks_assigns` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `dist_id` int(11) DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marks_assigns`
--

INSERT INTO `marks_assigns` (`id`, `student_id`, `teacher_id`, `course_id`, `section_id`, `session_id`, `dist_id`, `marks`, `created_at`, `updated_at`) VALUES
(6, 19, 16, 24, 13, 3, 43, 9, '2021-04-21 04:02:58', '0000-00-00 00:00:00'),
(7, 19, 16, 24, 13, 3, 44, 8, '2021-04-21 04:02:58', '0000-00-00 00:00:00'),
(8, 19, 16, 24, 13, 3, 45, 8, '2021-04-21 04:02:58', '0000-00-00 00:00:00'),
(9, 19, 16, 24, 13, 3, 46, 16, '2021-04-21 04:02:58', '0000-00-00 00:00:00'),
(10, 19, 16, 24, 13, 3, 47, 45, '2021-04-21 04:02:58', '0000-00-00 00:00:00'),
(11, 20, 16, 24, 14, 3, 39, 40, '2021-04-21 04:02:58', '0000-00-00 00:00:00'),
(12, 20, 16, 24, 14, 3, 40, 45, '2021-04-21 04:02:58', '0000-00-00 00:00:00'),
(13, 22, 16, 24, 15, 3, 41, 0, '2021-04-21 04:02:58', '0000-00-00 00:00:00'),
(14, 22, 16, 24, 15, 3, 42, 0, '2021-04-21 04:02:58', '0000-00-00 00:00:00'),
(15, 23, 16, 24, 13, 3, 43, 0, '2021-04-21 04:02:58', '0000-00-00 00:00:00'),
(16, 23, 16, 24, 13, 3, 44, 0, '2021-04-21 04:02:58', '0000-00-00 00:00:00'),
(17, 23, 16, 24, 13, 3, 45, 0, '2021-04-21 04:02:58', '0000-00-00 00:00:00'),
(18, 23, 16, 24, 13, 3, 46, 0, '2021-04-21 04:02:58', '0000-00-00 00:00:00'),
(19, 23, 16, 24, 13, 3, 47, 0, '2021-04-21 04:02:58', '0000-00-00 00:00:00'),
(20, 24, 16, 24, 13, 3, 43, 0, '2021-04-21 04:02:58', '0000-00-00 00:00:00'),
(21, 24, 16, 24, 13, 3, 44, 0, '2021-04-21 04:02:58', '0000-00-00 00:00:00'),
(22, 24, 16, 24, 13, 3, 45, 0, '2021-04-21 04:02:58', '0000-00-00 00:00:00'),
(23, 24, 16, 24, 13, 3, 46, 0, '2021-04-21 04:02:58', '0000-00-00 00:00:00'),
(24, 24, 16, 24, 13, 3, 47, 0, '2021-04-21 04:02:58', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `num_dists`
--

CREATE TABLE `num_dists` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `catagory_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `num_dists`
--

INSERT INTO `num_dists` (`id`, `course_id`, `teacher_id`, `section_id`, `session_id`, `catagory_name`, `marks`, `created_at`, `updated_at`) VALUES
(1, 5, 3, 1, 7, 'ct-1', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(2, 5, 3, 1, 7, 'ct-2', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(3, 5, 3, 1, 7, 'attendance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(4, 5, 3, 1, 7, 'assignment', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(5, 5, 3, 1, 7, 'mid', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(6, 5, 3, 1, 7, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(7, 11, 3, 4, 8, 'attendance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(8, 11, 3, 4, 8, 'assignment', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(9, 11, 3, 4, 8, 'ct', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(10, 11, 3, 4, 8, 'mid', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(11, 11, 3, 4, 8, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(12, 18, 12, 10, 2, 'attendance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(13, 18, 12, 10, 2, 'ct', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(14, 18, 12, 10, 2, 'assignment', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(15, 18, 12, 10, 2, 'mid', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(16, 18, 12, 10, 2, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(17, 21, 3, 10, 2, 'assignment', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(18, 21, 3, 10, 2, 'mid', 30, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(19, 21, 3, 10, 2, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(39, 24, 16, 14, 3, 'mid', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(40, 24, 16, 14, 3, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(41, 24, 16, 15, 3, 'mid', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(42, 24, 16, 15, 3, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(43, 24, 16, 13, 3, 'attendance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(44, 24, 16, 13, 3, 'assignment', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(45, 24, 16, 13, 3, 'ct', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(46, 24, 16, 13, 3, 'mid', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(47, 24, 16, 13, 3, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(48, 3, 2, 1, 7, 'attendance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(49, 3, 2, 1, 7, 'assignment ', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(50, 3, 2, 1, 7, 'ct', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(51, 3, 2, 1, 7, 'mid', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(52, 3, 2, 1, 7, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(62, 9, 9, 4, 8, 'attendance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(63, 9, 9, 4, 8, 'assignment', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(64, 9, 9, 4, 8, 'ct-1', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(65, 9, 9, 4, 8, 'ct-2', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(66, 9, 9, 4, 8, 'mid', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(67, 9, 9, 4, 8, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(68, 20, 14, 10, 2, 'attendance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(69, 20, 14, 10, 2, 'assignment', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(70, 20, 14, 10, 2, 'mid', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(71, 20, 14, 10, 2, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(72, 4, 6, 1, 7, 'attendance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(73, 4, 6, 1, 7, 'ct-1', 2, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(74, 4, 6, 1, 7, 'ct-2', 2, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(75, 4, 6, 1, 7, 'ct-3', 2, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(76, 4, 6, 1, 7, 'ct-4', 2, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(77, 4, 6, 1, 7, 'ct-5', 2, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(78, 4, 6, 1, 7, 'performance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(79, 4, 6, 1, 7, 'mid', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(80, 4, 6, 1, 7, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(81, 10, 6, 4, 8, 'attendance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(82, 10, 6, 4, 8, 'ct-1', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(83, 10, 6, 4, 8, 'ct-2', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(84, 10, 6, 4, 8, 'performance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(85, 10, 6, 4, 8, 'mid', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(86, 10, 6, 4, 8, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(87, 2, 5, 1, 7, 'attendance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(88, 2, 5, 1, 7, 'performance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(89, 2, 5, 1, 7, 'report', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(90, 2, 5, 1, 7, 'test', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(91, 2, 5, 1, 7, 'final', 60, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(92, 8, 8, 4, 8, 'attendance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(93, 8, 8, 4, 8, 'ct', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(94, 8, 8, 4, 8, 'assignment', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(95, 8, 8, 4, 8, 'mid', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(96, 8, 8, 4, 8, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(97, 6, 7, 1, 7, 'attendance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(98, 6, 7, 1, 7, 'assignment-1', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(99, 6, 7, 1, 7, 'assignment-2', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(100, 6, 7, 1, 7, 'ct', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(101, 6, 7, 1, 7, 'mid', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(102, 6, 7, 1, 7, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(103, 13, 12, 7, 1, 'attendance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(104, 13, 12, 7, 1, 'ct-1', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(105, 13, 12, 7, 1, 'ct-2', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(106, 13, 12, 7, 1, 'assignment', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(107, 13, 12, 7, 1, 'mid', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(108, 13, 12, 7, 1, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(109, 7, 12, 4, 3, 'attendance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(110, 7, 12, 4, 3, 'assignment-1', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(111, 7, 12, 4, 3, 'assignment-2', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(112, 7, 12, 4, 3, 'ct-1', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(113, 7, 12, 4, 3, 'ct-2', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(114, 7, 12, 4, 3, 'mid', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(115, 7, 12, 4, 3, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(116, 1, 4, 1, 7, 'attendance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(117, 1, 4, 1, 7, 'ct', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(118, 1, 4, 1, 7, 'assignment', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(119, 1, 4, 1, 7, 'mid', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(120, 1, 4, 1, 7, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(121, 17, 15, 7, 1, 'attendance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(122, 17, 15, 7, 1, 'ct-1', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(123, 17, 15, 7, 1, 'ct-2', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(124, 17, 15, 7, 1, 'assignment', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(125, 17, 15, 7, 1, 'mid', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(126, 17, 15, 7, 1, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(127, 27, 15, 13, 3, 'attendance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(128, 27, 15, 13, 3, 'ct-1', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(129, 27, 15, 13, 3, 'ct-2', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(130, 27, 15, 13, 3, 'assignment-1', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(131, 27, 15, 13, 3, 'assignment-2', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(132, 27, 15, 13, 3, 'mid-2', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(133, 27, 15, 13, 3, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(134, 19, 13, 10, 2, 'attendance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(135, 19, 13, 10, 2, 'assignment', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(136, 19, 13, 10, 2, 'ct', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(137, 19, 13, 10, 2, 'oral test', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(138, 19, 13, 10, 2, 'mid', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(139, 19, 13, 10, 2, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(140, 14, 11, 7, 1, 'attendance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(141, 14, 11, 7, 1, 'assignment', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(142, 14, 11, 7, 1, 'ct', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(143, 14, 11, 7, 1, 'mid', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(144, 14, 11, 7, 1, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(145, 23, 18, 13, 3, 'attendance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(146, 23, 18, 13, 3, 'ct-1', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(147, 23, 18, 13, 3, 'ct-2', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(148, 23, 18, 13, 3, 'assignment', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(149, 23, 18, 13, 3, 'mid', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(150, 23, 18, 13, 3, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(151, 25, 17, 13, 3, 'attendance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(152, 25, 17, 13, 3, 'ct', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(153, 25, 17, 13, 3, 'assignment-1', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(154, 25, 17, 13, 3, 'assignment-2', 5, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(155, 25, 17, 13, 3, 'mid', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(156, 25, 17, 13, 3, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(157, 2, 3, 1, 5, 'ct', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(158, 2, 3, 1, 5, 'assifnment', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(159, 2, 3, 1, 5, 'mid', 20, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(160, 2, 3, 1, 5, 'final', 50, '2021-04-21 04:03:50', '0000-00-00 00:00:00'),
(161, 2, 3, 1, 5, 'attendance', 10, '2021-04-21 04:03:50', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `semester` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `name`, `semester`, `created_at`, `updated_at`) VALUES
(1, 'C1A', '1', '2021-04-21 04:04:18', '0000-00-00 00:00:00'),
(2, 'C1B', '1', '2021-04-21 04:04:18', '0000-00-00 00:00:00'),
(3, 'C1C', '1', '2021-04-21 04:04:18', '0000-00-00 00:00:00'),
(4, 'C2A', '2', '2021-04-21 04:04:18', '0000-00-00 00:00:00'),
(5, 'C2B', '2', '2021-04-21 04:04:18', '0000-00-00 00:00:00'),
(6, 'C2C', '2', '2021-04-21 04:04:18', '0000-00-00 00:00:00'),
(7, 'C3A', '3', '2021-04-21 04:04:18', '0000-00-00 00:00:00'),
(8, 'C3B', '3', '2021-04-21 04:04:18', '0000-00-00 00:00:00'),
(9, 'C3C', '3', '2021-04-21 04:04:18', '0000-00-00 00:00:00'),
(10, 'C4A', '4', '2021-04-21 04:04:18', '0000-00-00 00:00:00'),
(11, 'C4B', '4', '2021-04-21 04:04:18', '0000-00-00 00:00:00'),
(12, 'C4C', '4', '2021-04-21 04:04:18', '0000-00-00 00:00:00'),
(13, 'C5A', '5', '2021-04-21 04:04:18', '0000-00-00 00:00:00'),
(14, 'C5B', '5', '2021-04-21 04:04:18', '0000-00-00 00:00:00'),
(15, 'C5C', '5', '2021-04-21 04:04:18', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Spring 2019', 0, '2021-04-21 04:04:44', '0000-00-00 00:00:00'),
(2, 'fall 2019', 0, '2021-04-21 04:04:44', '0000-00-00 00:00:00'),
(3, 'Spring 2020', 1, '2021-04-21 04:04:44', '0000-00-00 00:00:00'),
(4, 'fall 2020', 0, '2021-04-21 04:04:44', '0000-00-00 00:00:00'),
(5, 'Spring 2021', 1, '2021-04-21 04:04:44', '0000-00-00 00:00:00'),
(6, 'fall 2021', 0, '2021-04-21 04:04:44', '0000-00-00 00:00:00'),
(7, 'spring 2018', 0, '2021-04-21 04:04:44', '0000-00-00 00:00:00'),
(8, 'fall 2018', 0, '2021-04-21 04:04:44', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_assigns`
--

CREATE TABLE `teacher_assigns` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teacher_assigns`
--

INSERT INTO `teacher_assigns` (`id`, `teacher_id`, `section_id`, `course_id`, `session_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 5, 7, 1, '2021-04-21 04:05:21', '0000-00-00 00:00:00'),
(2, 3, 4, 11, 8, 1, '2021-04-21 04:05:21', '0000-00-00 00:00:00'),
(3, 3, 10, 21, 2, 1, '2021-04-21 04:05:21', '0000-00-00 00:00:00'),
(4, 12, 4, 7, 3, 1, '2021-04-21 04:05:21', '0000-00-00 00:00:00'),
(5, 12, 10, 18, 2, 1, '2021-04-21 04:05:21', '0000-00-00 00:00:00'),
(7, 12, 7, 13, 1, 1, '2021-04-21 04:05:21', '0000-00-00 00:00:00'),
(8, 15, 13, 27, 3, 1, '2021-04-21 04:05:21', '0000-00-00 00:00:00'),
(9, 16, 14, 24, 3, 1, '2021-04-26 19:08:57', '0000-00-00 00:00:00'),
(10, 17, 13, 25, 3, 1, '2021-04-21 04:05:21', '0000-00-00 00:00:00'),
(11, 18, 13, 23, 3, 1, '2021-04-25 20:19:47', '0000-00-00 00:00:00'),
(12, 16, 13, 24, 3, 1, '2021-04-26 19:08:57', '0000-00-00 00:00:00'),
(13, 16, 15, 24, 3, 1, '2021-04-27 10:30:43', '0000-00-00 00:00:00'),
(14, 2, 1, 3, 7, 1, '2021-04-21 04:05:21', '0000-00-00 00:00:00'),
(16, 4, 1, 1, 7, 1, '2021-04-21 04:05:21', '0000-00-00 00:00:00'),
(17, 5, 1, 2, 7, 1, '2021-04-21 04:05:21', '0000-00-00 00:00:00'),
(18, 6, 1, 4, 7, 1, '2021-04-21 04:05:21', '0000-00-00 00:00:00'),
(19, 7, 1, 6, 7, 1, '2021-04-21 04:05:21', '0000-00-00 00:00:00'),
(20, 8, 4, 8, 8, 1, '2021-04-21 04:05:21', '0000-00-00 00:00:00'),
(21, 9, 4, 9, 8, 1, '2021-04-21 04:05:21', '0000-00-00 00:00:00'),
(24, 6, 4, 10, 8, 1, '2021-04-21 04:05:21', '0000-00-00 00:00:00'),
(28, 11, 7, 14, 1, 1, '2021-04-21 04:05:21', '0000-00-00 00:00:00'),
(29, 15, 7, 17, 1, 1, '2021-04-21 04:05:21', '0000-00-00 00:00:00'),
(35, 13, 10, 19, 2, 1, '2021-04-21 04:05:21', '0000-00-00 00:00:00'),
(36, 14, 10, 20, 2, 1, '2021-04-21 04:05:21', '0000-00-00 00:00:00'),
(37, 3, 1, 2, 5, 1, '2021-04-21 20:55:16', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Regular', 1, '2021-04-21 04:05:47', '0000-00-00 00:00:00'),
(2, 'Retake', 0, '2021-04-21 04:05:47', '0000-00-00 00:00:00'),
(3, 'Recourse', 1, '2021-04-21 04:05:47', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'admin', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(2, 'Mohammad Arif ', 'arif@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'teacher', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(3, 'Akramul Kabir Khan', 'akram@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'teacher', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(4, 'Sumon Sen ', 'sumon@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'teacher', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(5, 'Toufiq sayed', 'toufiq@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'teacher', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(6, 'Iftekhar Khan', 'iftekhar@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'teacher', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(7, 'Nusrat Shirin', 'nusrat@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'teacher', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(8, 'Faisal ahmed', 'faisal@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'teacher', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(9, 'KMH hamim', 'hamim@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'teacher', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(10, 'Rukon Uddin', 'rukon@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'teacher', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(11, 'Farhana shirin', 'shirin@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'teacher', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(12, 'Minhaz hossen', 'minhaz@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'teacher', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(13, 'Mehedi hassan', 'mehedi@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'teacher', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(14, 'minhaz Rahat', 'rahat@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'teacher', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(15, 'Tania noor', 'tania@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'teacher', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(16, 'Anik sen', 'anik@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'teacher', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(17, 'tanni Dhoom', 'tanni@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'teacher', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(18, 'kingshuk dhar', 'king@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'teacher', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(19, 'student1', 'std1@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'student', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(20, 'student2', 'std2@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'student', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(21, 'student3', 'std3@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'student', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(22, 'student4', 'std4@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'student', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(23, 'student5', 'std5@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'student', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(24, 'Srabosthy Das Prama', 'srabosthy@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'student', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(25, 'Mohsin Riad', 'morteen@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'student', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(26, 'Tonmoy Barua', 'tonmoy@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'student', '2021-04-21 03:46:16', '0000-00-00 00:00:00'),
(27, 'Kallol Dey', 'kallol@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'teacher', '2021-04-20 21:49:21', '2021-04-20 21:49:21'),
(28, 'Asma Joshita Trisha', 'trisha@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'teacher', '2021-04-20 21:56:12', '2021-04-20 21:56:12'),
(29, 'Student6', 'std6@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'student', '2021-04-20 22:00:44', '2021-04-20 22:00:44'),
(30, 'Student7', 'std7@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'student', '2021-04-20 22:06:27', '2021-04-20 22:06:27'),
(33, 'Sarith Dhar', 'sarith@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'teacher', '2021-04-20 22:24:22', '2021-04-20 22:24:22'),
(34, 'Faisal Ahmed', 'faisal@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 'teacher', '2021-04-20 22:26:06', '2021-04-20 22:26:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `marks_assigns`
--
ALTER TABLE `marks_assigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `dist_id` (`dist_id`);

--
-- Indexes for table `num_dists`
--
ALTER TABLE `num_dists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_assigns`
--
ALTER TABLE `teacher_assigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `marks_assigns`
--
ALTER TABLE `marks_assigns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `num_dists`
--
ALTER TABLE `num_dists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `teacher_assigns`
--
ALTER TABLE `teacher_assigns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `enrollments_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `enrollments_ibfk_4` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`),
  ADD CONSTRAINT `enrollments_ibfk_5` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`),
  ADD CONSTRAINT `enrollments_ibfk_6` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`);

--
-- Constraints for table `marks_assigns`
--
ALTER TABLE `marks_assigns`
  ADD CONSTRAINT `marks_assigns_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `marks_assigns_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`),
  ADD CONSTRAINT `marks_assigns_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `marks_assigns_ibfk_4` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `marks_assigns_ibfk_5` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`),
  ADD CONSTRAINT `marks_assigns_ibfk_6` FOREIGN KEY (`dist_id`) REFERENCES `num_dists` (`id`);

--
-- Constraints for table `num_dists`
--
ALTER TABLE `num_dists`
  ADD CONSTRAINT `num_dists_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `num_dists_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `num_dists_ibfk_3` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`),
  ADD CONSTRAINT `num_dists_ibfk_4` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`);

--
-- Constraints for table `teacher_assigns`
--
ALTER TABLE `teacher_assigns`
  ADD CONSTRAINT `teacher_assigns_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `teacher_assigns_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`),
  ADD CONSTRAINT `teacher_assigns_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `teacher_assigns_ibfk_4` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
