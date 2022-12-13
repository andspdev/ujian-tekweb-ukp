-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2022 at 09:06 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_uastekweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `pengiriman`
--

CREATE TABLE `pengiriman` (
  `id` int(11) NOT NULL,
  `nomor_resi` varchar(50) NOT NULL,
  `tanggal_resi` date NOT NULL,
  `jenis_pengiriman` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengiriman`
--

INSERT INTO `pengiriman` (`id`, `nomor_resi`, `tanggal_resi`, `jenis_pengiriman`) VALUES
(3, 'RS-001', '2022-12-10', 0),
(4, 'RS-002', '2022-12-11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pengiriman_detail`
--

CREATE TABLE `pengiriman_detail` (
  `id` int(11) NOT NULL,
  `nomor_resi` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `kota` varchar(50) NOT NULL,
  `keterangan` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengiriman_detail`
--

INSERT INTO `pengiriman_detail` (`id`, `nomor_resi`, `tanggal`, `kota`, `keterangan`) VALUES
(2, 'RS-001', '2022-12-10', 'Jakarta', 'Deposit pengiriman'),
(3, 'RS-002', '2022-12-11', 'Surabaya', 'Pengiriman ditersukan ke penerima'),
(4, 'RS-002', '2022-12-11', 'Surabaya', 'Pengiriman oleh kurir');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_admin` varchar(20) NOT NULL,
  `status_aktif` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nama_admin`, `status_aktif`) VALUES
(1, 'Admin', 'admin', 'Admin', 1),
(4, 'Contoh', '1234', 'Contoh Data', 1),
(5, 'iniedit 2', '1234', 'Ini Merupakan Edit2', 1),
(6, 'ininonaktif', '1234', 'Ini NonAktif', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor_resi` (`nomor_resi`);

--
-- Indexes for table `pengiriman_detail`
--
ALTER TABLE `pengiriman_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nomor_resi` (`nomor_resi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pengiriman`
--
ALTER TABLE `pengiriman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pengiriman_detail`
--
ALTER TABLE `pengiriman_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pengiriman_detail`
--
ALTER TABLE `pengiriman_detail`
  ADD CONSTRAINT `pengiriman_detail_ibfk_1` FOREIGN KEY (`nomor_resi`) REFERENCES `pengiriman` (`nomor_resi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
