-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2022 at 08:00 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `money_record`
--

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id_history` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  `total` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `created_at` varchar(50) NOT NULL,
  `updated_at` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id_history`, `id_user`, `type`, `date`, `total`, `details`, `created_at`, `updated_at`) VALUES
(1, 2, 'Pengeluaran', '2022-06-18', '7500.0', '[{\"name\":\"Cireng\",\"price\":\"2000\"},{\"name\":\"Bala-Bala\",\"price\":\"3000\"},{\"name\":\"Cimol\",\"price\":\"1000\"},{\"name\":\"Es Teh\",\"price\":\"1500\"}]', '2022-06-19T01:12:19.355228', '2022-06-19T11:36:44.850295'),
(2, 2, 'Pengeluaran', '2022-06-19', '15000.0', '[{\"name\":\"Es teh manis\",\"price\":\"4000\"},{\"name\":\"bakso\",\"price\":\"6000\"},{\"name\":\"Jus\",\"price\":\"5000\"}]', '2022-06-19T01:17:02.151015', '2022-06-19T11:34:04.975636'),
(4, 2, 'Pemasukan', '2022-06-20', '300000.0', '[{\"name\":\"aplikasi Touring\",\"price\":\"300000\"}]', '2022-06-20T22:27:22.694317', '2022-06-20T22:27:22.701227'),
(6, 2, 'Pengeluaran', '2022-06-20', '5000.0', '[{\"name\":\"Cilok\",\"price\":\"5000\"}]', '2022-06-20T23:53:12.115511', '2022-06-20T23:53:12.115686'),
(7, 2, 'Pengeluaran', '2022-06-21', '12000.0', '[{\"name\":\"Cimol\",\"price\":\"7000\"},{\"name\":\"Cipeng\",\"price\":\"5000\"}]', '2022-06-21T00:27:40.241810', '2022-06-21T00:40:04.123565');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` varchar(50) NOT NULL,
  `updated_at` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '202cb962ac59075b964b07152d234b70', '2022-01-09 02:17:44', '2022-01-09 02:17:44'),
(2, 'indra', 'indra@gmail.com', '202cb962ac59075b964b07152d234b70', '2022-06-17T16:44:58.031049', '2022-06-17T16:44:58.031193');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id_history`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id_history` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
