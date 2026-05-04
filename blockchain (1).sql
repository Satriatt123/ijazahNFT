-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2026 at 04:54 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blockchain`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumni_profiles`
--

CREATE TABLE `alumni_profiles` (
  `id` varchar(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `nim` varchar(50) NOT NULL,
  `prodi_id` int(11) DEFAULT NULL,
  `graduation_year` int(11) DEFAULT NULL,
  `gpa` decimal(3,2) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alumni_profiles`
--

INSERT INTO `alumni_profiles` (`id`, `user_id`, `nim`, `prodi_id`, `graduation_year`, `gpa`, `phone_number`) VALUES
('alumni-uuid-1', 'user-uuid-1', '123456789', 1, NULL, NULL, NULL),
('alumni-uuid-2', 'user-uuid-2', '124250070', 2, NULL, NULL, NULL),
('alumni-uuid-3', 'user-uuid-3', '124250087', 2, NULL, NULL, NULL),
('alumni-uuid-4', 'user-uuid-4', '124250063', 2, NULL, NULL, NULL),
('alumni-uuid-6', 'user-uuid-6', '124250055', 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `diplomas`
--

CREATE TABLE `diplomas` (
  `id` varchar(36) NOT NULL,
  `alumni_id` varchar(36) DEFAULT NULL,
  `certificate_number` varchar(100) NOT NULL,
  `ipfs_hash_image` varchar(100) DEFAULT NULL,
  `ipfs_hash_metadata` varchar(100) DEFAULT NULL,
  `token_id` varchar(100) DEFAULT NULL,
  `tx_hash` varchar(100) DEFAULT NULL,
  `status` enum('PENDING','MINTED','REVOKED') DEFAULT 'PENDING',
  `minted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diplomas`
--

INSERT INTO `diplomas` (`id`, `alumni_id`, `certificate_number`, `ipfs_hash_image`, `ipfs_hash_metadata`, `token_id`, `tx_hash`, `status`, `minted_at`, `created_at`) VALUES
('3b8f939c-ef32-4f3b-a679-4f1df9ccbd98', 'alumni-uuid-2', 'IJZ-001-2026', 'QmWYtGGngxrW7xWvotxSvjbSteCdxu6bjzaMaQpHkcDsyk', 'QmaofdYqK1Hjv1dadrQHv4sdt9pMWUDyDwupaA3HUzWJtj', '0', '0xf0cb2f309350a96092c47c4b4eaa66d3347417d8d7ff7e37fe9b1be48cdfaf69', 'MINTED', '2026-04-30 15:59:39', '2026-04-30 15:59:39'),
('42f70b06-dd12-4d0a-9bbb-07d55af56522', 'alumni-uuid-6', 'IJZ-006-2026', 'QmPNRubR7ptmLK198bmbhBhYWdpWow18nDQXkU7qUrjA4z', 'QmTFgxCUepMA1Aid7SaQpCzCaK1yjAAqZgXucAhpUJFMK5', '1777861808293', '0xee560b5a9d78c09493edd3e45d49709668bcf0ea7c607603cb36f6b51b068f70', 'MINTED', '2026-05-04 02:30:24', '2026-05-04 02:30:24'),
('48c828ca-ad20-44da-9429-448f39fba9a5', 'alumni-uuid-4', 'IJZ-004-2026', 'QmQrbXuxKvnSdwfNjuyTUWLBUmMVPymG2GQUkQcBCbfENV', 'QmZ1CZxm9sytw4g1zK7EDRCzve77P52sZKqGXcaYhi6jQf', '0', '0xc9a4cc40f49401f5258e0b5371b0b56a15e94e1c6ae90dadd7e8e4accd24c60a', 'MINTED', '2026-05-02 09:34:03', '2026-05-02 09:34:03'),
('8bc6ca06-20d4-4187-8b65-a26975be6124', 'alumni-uuid-1', 'IJZ-002-2026', 'QmPNRubR7ptmLK198bmbhBhYWdpWow18nDQXkU7qUrjA4z', 'QmQtVLDqKJ3ruxUF174W7N5HWd1vGnzQwAFmgbhwq6C6mS', '1', '0x24d6bccc9c8c4e53a449cbf35b318d1474b43d4f21f41979fa592099c83ff4d2', 'MINTED', '2026-04-30 16:20:16', '2026-04-30 16:20:16'),
('c5461d50-23a1-4cf8-b100-217f20a8d6da', 'alumni-uuid-4', 'IJZ-005-2026', 'QmPNRubR7ptmLK198bmbhBhYWdpWow18nDQXkU7qUrjA4z', 'QmbmEUQYypZjXSZjfSQvTHeDahgTsNPEKKJ8SnzzisZTVj', '1777727699918', '0x9119b36c407d710fcff33d49056265cbd664e494f4bd9e03dd792e7ce2c53a0d', 'MINTED', '2026-05-02 13:15:27', '2026-05-02 13:15:27'),
('e8382d8a-5351-4ca1-a730-c6a7564cb896', 'alumni-uuid-3', 'IJZ-003-2026', 'QmQrbXuxKvnSdwfNjuyTUWLBUmMVPymG2GQUkQcBCbfENV', 'QmeDJoDioDn9B7kb3tvAnv3oAt5uWXKpkLGLC1AaW2qg1P', '2', '0xa346b85caf04fc13a3a45d0c9941f749f2a4b46031cea2c7c378e17365151076', 'MINTED', '2026-04-30 16:30:03', '2026-04-30 16:30:03');

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `faculty` varchar(100) DEFAULT NULL,
  `major_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`id`, `name`, `faculty`, `major_code`) VALUES
(1, 'Teknik Informatika', NULL, 'TI-001'),
(2, 'Sistem Informasi', NULL, 'TI-002');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(36) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `role` enum('ADMIN','STAFF','ALUMNI') DEFAULT 'ALUMNI',
  `wallet_address` varchar(42) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password_hash`, `full_name`, `role`, `wallet_address`, `created_at`) VALUES
('user-uuid-1', 'budi@kampus.ac.id', 'dummyhash', 'Budi Santoso', 'ALUMNI', NULL, '2026-04-30 15:35:20'),
('user-uuid-2', 'satria@kampus.ac.id', 'dummyhash2', 'Satria Dian', 'ALUMNI', NULL, '2026-04-30 15:42:22'),
('user-uuid-3', 'candra@kampus.ac.id', 'dummyhash3', 'Agustinus Kurnia Candra', 'ALUMNI', NULL, '2026-04-30 16:28:23'),
('user-uuid-4', 'anjas@kampus.ac.id', 'dummyhash4', 'Satria Anjasmara Hammam', 'ALUMNI', NULL, '2026-05-02 08:58:23'),
('user-uuid-6', 'fiki@kampus.ac.id', 'dummyhash6', 'Chairil Fiki', 'ALUMNI', NULL, '2026-05-04 02:29:16');

-- --------------------------------------------------------

--
-- Table structure for table `verification_logs`
--

CREATE TABLE `verification_logs` (
  `id` varchar(36) NOT NULL,
  `diploma_id` varchar(36) DEFAULT NULL,
  `verifier_name` varchar(255) DEFAULT NULL,
  `verified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumni_profiles`
--
ALTER TABLE `alumni_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nim` (`nim`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `prodi_id` (`prodi_id`);

--
-- Indexes for table `diplomas`
--
ALTER TABLE `diplomas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `certificate_number` (`certificate_number`),
  ADD KEY `alumni_id` (`alumni_id`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `major_code` (`major_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `verification_logs`
--
ALTER TABLE `verification_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diploma_id` (`diploma_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alumni_profiles`
--
ALTER TABLE `alumni_profiles`
  ADD CONSTRAINT `alumni_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `alumni_profiles_ibfk_2` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`id`);

--
-- Constraints for table `diplomas`
--
ALTER TABLE `diplomas`
  ADD CONSTRAINT `diplomas_ibfk_1` FOREIGN KEY (`alumni_id`) REFERENCES `alumni_profiles` (`id`);

--
-- Constraints for table `verification_logs`
--
ALTER TABLE `verification_logs`
  ADD CONSTRAINT `verification_logs_ibfk_1` FOREIGN KEY (`diploma_id`) REFERENCES `diplomas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
