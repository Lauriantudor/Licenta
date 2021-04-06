-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2021 at 11:56 AM
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
-- Database: `minecraftdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from` bigint(20) UNSIGNED NOT NULL COMMENT 'Own Id',
  `to` bigint(20) UNSIGNED NOT NULL COMMENT 'Other Id',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `from`, `to`, `message`, `type`, `created_at`, `updated_at`) VALUES
(105, 2, 2, 'scsaax', 1, '2021-04-05 13:52:45', '2021-04-05 13:52:45'),
(107, 1, 2, 'dsa\\', 1, '2021-04-05 13:55:35', '2021-04-05 13:55:35'),
(108, 1, 2, 'daaa', 0, '2021-04-05 14:01:08', '2021-04-05 14:01:08'),
(109, 1, 2, 'daaa', 1, '2021-04-05 14:01:08', '2021-04-05 14:01:08'),
(110, 1, 2, 'dcccxxcz', 0, '2021-04-05 14:06:03', '2021-04-05 14:06:03'),
(111, 1, 2, 'dcccxxcz', 1, '2021-04-05 14:06:03', '2021-04-05 14:06:03'),
(112, 2, 1, 'das', 0, '2021-04-05 14:08:34', '2021-04-05 14:08:34'),
(113, 2, 1, 'das', 1, '2021-04-05 14:08:34', '2021-04-05 14:08:34'),
(114, 1, 2, 'mih', 0, '2021-04-05 14:34:56', '2021-04-05 14:34:56'),
(115, 1, 2, 'mih', 1, '2021-04-05 14:34:56', '2021-04-05 14:34:56'),
(116, 1, 1, 'test', 0, '2021-04-05 14:36:14', '2021-04-05 14:36:14'),
(117, 1, 1, 'test', 1, '2021-04-05 14:36:14', '2021-04-05 14:36:14'),
(118, 1, 2, 'wsasa', 0, '2021-04-05 15:15:06', '2021-04-05 15:15:06'),
(119, 1, 2, 'wsasa', 1, '2021-04-05 15:15:06', '2021-04-05 15:15:06'),
(120, 2, 1, 'sal', 0, '2021-04-06 06:02:27', '2021-04-06 06:02:27'),
(121, 2, 1, 'sal', 1, '2021-04-06 06:02:27', '2021-04-06 06:02:27'),
(122, 1, 1, 'saa', 0, '2021-04-06 06:44:50', '2021-04-06 06:44:50'),
(123, 1, 1, 'saa', 1, '2021-04-06 06:44:50', '2021-04-06 06:44:50'),
(124, 1, 1, 'l', 0, '2021-04-06 06:46:24', '2021-04-06 06:46:24'),
(125, 1, 1, 'l', 1, '2021-04-06 06:46:24', '2021-04-06 06:46:24'),
(126, 2, 1, 'dsa', 0, '2021-04-06 06:49:54', '2021-04-06 06:49:54'),
(127, 2, 1, 'dsa', 1, '2021-04-06 06:49:54', '2021-04-06 06:49:54'),
(128, 1, 1, 'l', 0, '2021-04-06 06:51:42', '2021-04-06 06:51:42'),
(129, 1, 1, 'l', 1, '2021-04-06 06:51:42', '2021-04-06 06:51:42');

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
(4, '2014_10_12_000000_create_users_table', 1),
(5, '2014_10_12_100000_create_password_resets_table', 1),
(6, '2021_03_31_124757_create_messages_table', 1),
(7, '0000_00_00_000000_create_websockets_statistics_entries_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Tudor Laurian', 'tudorel1997@yahoo.com', NULL, '$2y$10$zMsWcFLipu7ApskEZXBJ/.3HE8c9sOZiHznHcH1QtpVU6GzIBou16', NULL, '2021-04-02 14:04:48', '2021-04-02 14:04:48'),
(2, 'Test User', 'test@test.com', NULL, '$2y$10$8fbMUMxgz5ujhv8DlGW0s.HFu3XSbvABeqj67S3B2ifHV2rmzNZNy', NULL, '2021-04-02 14:05:41', '2021-04-02 14:05:41');

-- --------------------------------------------------------

--
-- Table structure for table `websockets_statistics_entries`
--

CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
