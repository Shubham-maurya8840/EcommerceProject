-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2025 at 09:21 AM
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
-- Database: `ecommerce_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `productId` int(11) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `customerId` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2025_07_25_060406_create_users_table', 1),
(2, '2025_07_26_143402_create_sessions_table', 2),
(3, '2025_07_27_132947_create_posts_table', 3),
(4, '2025_08_04_042624_create_carts_table', 4),
(5, '2025_08_06_051009_create_orders_table', 5),
(6, '2025_08_06_051042_create_order_items_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customerId` int(11) NOT NULL,
  `bill` double NOT NULL,
  `status` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customerId`, `bill`, `status`, `name`, `address`, `phone`, `created_at`, `updated_at`) VALUES
(1, 6, 3120, 'pending', 'shubham', 'india', '8840137453', '2025-08-06 03:55:19', '2025-08-06 03:55:19'),
(2, 6, 3120, 'pending', 'shubham', 'sdde', '8840137453', '2025-08-06 03:56:43', '2025-08-06 03:56:43'),
(3, 6, 840, 'pending', 'Yash', 'pbh', '78654677', '2025-08-18 10:24:56', '2025-08-18 10:24:56'),
(4, 6, 2340, 'success', 'Yash', 'pbh', '78654677', '2025-08-18 11:18:48', '2025-08-18 11:18:48'),
(5, 6, 1560, 'success', 'Yash', 'pbh', '78654677', '2025-08-18 11:30:13', '2025-08-18 11:30:13');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `productId` int(11) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `orderId` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `productId`, `quantity`, `price`, `orderId`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 780, 2, '2025-08-06 03:56:43', '2025-08-06 03:56:43'),
(2, 3, 3, 780, 2, '2025-08-06 03:56:43', '2025-08-06 03:56:43'),
(3, 1, 1, 280, 3, '2025-08-18 10:24:56', '2025-08-18 10:24:56'),
(4, 2, 2, 780, 4, '2025-08-18 11:18:48', '2025-08-18 11:18:48'),
(5, 2, 2, 780, 5, '2025-08-18 11:30:13', '2025-08-18 11:30:13');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `picture`, `description`, `price`, `quantity`, `category`, `type`, `created_at`, `updated_at`) VALUES
(1, 'men\'s bag', 'bag.jpg', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout', 280, 15, 'Accessories', 'Best Sellers', NULL, NULL),
(2, 'men\'s shirt', 'shirt.jpg', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout', 780, 23, 'Clothes', 'new-arrivals', NULL, NULL),
(3, 'men\'s shoes', 'shoes.jpg', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout', 780, 15, 'Shoes', 'sale', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('fRx852o6m7T3Bbv2CLFljuMD4xNpxcdX9CLvuPLu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoieGg0UjdXRnJocGFaendXN2drWHhUVDRTaXA2YzFyemI5RnFiNHNMcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jYXJ0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoyOiJpZCI7aTo2O3M6NDoidHlwZSI7czo4OiJjdXN0b21lciI7fQ==', 1755536413),
('POjfvIFlt2EFhsaeX56WWtVRNyBEz51fpM4MO1TQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTGZ6SnNSUkV1cVpIcUFuSGc2UGdURTVPTWdRQUZza2VSdnBJV0tiRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jYXJ0Ijt9czoyOiJpZCI7aTo2O3M6NDoidHlwZSI7czo4OiJjdXN0b21lciI7fQ==', 1754472404);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'Customer',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `email`, `password`, `picture`, `type`, `created_at`, `updated_at`) VALUES
(1, 'shubham', 's@gmail.com', '$2y$12$e7W4UWeYFM5Jz0SSmHQ12.ZHXVGUlTwji.zOzVqfu0HVu3wkzzBJm', 'WhatsApp Image 2025-05-23 at 07.01.33_8e766c49.jpg', 'customer', '2025-07-26 10:33:00', '2025-07-26 10:33:00'),
(2, 'shubham', 'ss@gmail.com', '$2y$12$c8BBFdYjm0j/aqys055rKOHJxth5W52WzWaz/kyFmIB74WpU5OB7O', 'WhatsApp Image 2025-05-23 at 07.01.33_8e766c49.jpg', 'customer', '2025-07-26 10:37:45', '2025-07-26 10:37:45'),
(3, 'Shubham Maurya', 'admin@gmail.com', '$2y$12$7NFS/vf31e9CLfmTODc.IOcJzS5lMUZGDckLhQULPNRYzUEWun37e', 'WhatsApp Image 2025-05-23 at 07.01.33_8e766c49.jpg', 'customer', '2025-07-26 10:39:09', '2025-07-26 10:39:09'),
(4, 'nsajshj', 'f@gmail.com', '$2y$12$OTKzWWQRyytxrqqWKXoSWuKUjGdpM7500Nwpv/QTBW8Ed2XywZ6xm', 'WhatsApp Image 2025-05-23 at 07.01.33_8e766c49.jpg', 'customer', '2025-07-27 06:33:06', '2025-07-27 06:33:06'),
(5, 'lays', 'f@gmail.com', '$2y$12$6viJddqx80NoCqlK5EdO6.MDhON/IUrXQ3pr3ZwlI3KTksMWSm2L6', 'WhatsApp Image 2025-05-23 at 07.01.33_8e766c49.jpg', 'customer', '2025-07-27 06:40:53', '2025-07-27 06:40:53'),
(6, 'dfdd', 'lakshyamaurya8840@gmail.com', 'ddsdsd', 'WhatsApp Image 2025-05-23 at 07.01.33_8e766c49.jpg', 'customer', '2025-07-27 07:26:50', '2025-07-27 07:26:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
