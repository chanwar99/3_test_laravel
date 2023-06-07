-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2023 at 06:10 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_project_chaerul`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2023_06_06_083922_create_clients_table', 1),
(5, '2023_06_06_084642_create_project_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_m_client`
--

CREATE TABLE `tb_m_client` (
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `client_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_m_client`
--

INSERT INTO `tb_m_client` (`client_id`, `client_name`, `client_address`, `created_at`, `updated_at`) VALUES
(1, 'NEC', 'Jakarta', '2023-06-06 07:57:05', '2023-06-06 07:57:05'),
(2, 'TAM', 'Jakarta', '2023-06-06 07:57:05', '2023-06-06 07:57:05'),
(3, 'TUA', 'Bandung', '2023-06-06 07:57:05', '2023-06-06 07:57:05');

-- --------------------------------------------------------

--
-- Table structure for table `tb_m_project`
--

CREATE TABLE `tb_m_project` (
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `project_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `project_start` date NOT NULL,
  `project_end` date NOT NULL,
  `project_status` char(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_m_project`
--

INSERT INTO `tb_m_project` (`project_id`, `project_name`, `client_id`, `project_start`, `project_end`, `project_status`, `created_at`, `updated_at`) VALUES
(79, 'WMS', 1, '2022-07-28', '2022-08-28', 'OPEN', '2023-06-06 20:12:21', '2023-06-06 20:12:21'),
(80, 'FILMS', 2, '2022-06-01', '2022-08-31', 'DOING', '2023-06-06 20:12:21', '2023-06-06 20:12:21'),
(81, 'DOC', 2, '2022-01-01', '2022-04-30', 'DONE', '2023-06-06 20:12:21', '2023-06-06 20:12:21'),
(82, 'POS', 3, '2022-05-01', '2022-08-31', 'DOING', '2023-06-06 20:12:21', '2023-06-06 20:12:21'),
(83, 'WMS', 1, '2022-07-28', '2022-08-28', 'OPEN', '2023-06-06 20:12:23', '2023-06-06 20:12:23'),
(84, 'FILMS', 2, '2022-06-01', '2022-08-31', 'DOING', '2023-06-06 20:12:24', '2023-06-06 20:12:24'),
(85, 'DOC', 2, '2022-01-01', '2022-04-30', 'DONE', '2023-06-06 20:12:24', '2023-06-06 20:12:24'),
(86, 'POS', 3, '2022-05-01', '2022-08-31', 'DOING', '2023-06-06 20:12:24', '2023-06-06 20:12:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_m_client`
--
ALTER TABLE `tb_m_client`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `tb_m_project`
--
ALTER TABLE `tb_m_project`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `tb_m_project_client_id_foreign` (`client_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_m_client`
--
ALTER TABLE `tb_m_client`
  MODIFY `client_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_m_project`
--
ALTER TABLE `tb_m_project`
  MODIFY `project_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_m_project`
--
ALTER TABLE `tb_m_project`
  ADD CONSTRAINT `tb_m_project_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `tb_m_client` (`client_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
