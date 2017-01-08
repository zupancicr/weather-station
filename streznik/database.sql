-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jan 01, 2017 at 08:37 PM
-- Server version: 5.6.34
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `suhokran_vreme`
--
CREATE DATABASE IF NOT EXISTS `suhokran_vreme` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `suhokran_vreme`;

-- --------------------------------------------------------

--
-- Table structure for table `vreme`
--

CREATE TABLE IF NOT EXISTS `vreme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cas` datetime NOT NULL,
  `temperatura` float NOT NULL,
  `vlaga` float NOT NULL,
  `tlak` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1020 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
