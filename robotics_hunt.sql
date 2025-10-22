-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2025 at 05:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `robotics_hunt`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `admin_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password_hash`, `is_active`, `created_at`, `admin_token`) VALUES
(1, 'Hazem', '$2y$10$RFktxUYUj0/5NPcmF/KcOud7LFrwtxodJJNs4fRzLESf80P21l6n2', 1, '2025-10-06 15:19:34', 'd5fabc3f373e5e69c194fcef710aefd47a4968f3b03dd72fb5cf6198e70aa013');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description_html` longtext NOT NULL,
  `hint` text NOT NULL,
  `display_order` int(11) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `title`, `description_html`, `hint`, `display_order`, `is_active`, `created_at`) VALUES
(42, 'Question 1', '<p>I\'m the skeleton of your RC car (every motor, wire, and wheel depends on me) to stay in place. What am I?</p>', 'https://edu-books-images.b-cdn.net/robo/1.png', 1, 1, '2025-10-22 15:07:03'),
(43, 'Question 2', '<p>They don\'t move, they don\'t talk, but they make the school look cool. How many palm trees are standing proudly around our campus?</p>', 'https://edu-books-images.b-cdn.net/robo/20.png', 2, 1, '2025-10-22 15:07:03'),
(44, 'Question 3', '<p>I turn electrical energy into motion; I\'m the real powerhouse behind your car\'s movement. Who am I?</p>', 'https://edu-books-images.b-cdn.net/robo/3.png', 3, 1, '2025-10-22 15:07:03'),
(45, 'Question 4', '<p>I\'m full of holes, but that\'s my job! I hold your circuits together without any glue.</p>', 'https://edu-books-images.b-cdn.net/robo/7.png', 4, 1, '2025-10-22 15:07:03'),
(46, 'Question 5', '<p>Give me voltage, and I\'ll give you rotation. No power, no spin. What am I?</p>', 'https://edu-books-images.b-cdn.net/robo/4.png', 5, 1, '2025-10-22 15:07:03'),
(47, 'Question 6', '<p>You\'ve been walking here all week, but do you really know where you are? What\'s the full name of our school?</p>', 'https://edu-books-images.b-cdn.net/robo/22.png', 6, 1, '2025-10-22 15:07:03'),
(48, 'Question 7', '<p>I\'m tiny, but keep your big ideas in place. Without me, your frame\'s a flop.</p>', 'https://edu-books-images.b-cdn.net/robo/9.png', 7, 1, '2025-10-22 15:07:03'),
(49, 'Question 8', '<p>I\'m small but strong. My job is to make your car go. What am I?</p>', 'https://edu-books-images.b-cdn.net/robo/5.png', 8, 1, '2025-10-22 15:07:03'),
(50, 'Question 9', '<p>Where experiments, explosions (safe ones!), and genius ideas happen, how many labs do we have in our school?</p>', 'https://edu-books-images.b-cdn.net/robo/21.png', 9, 1, '2025-10-22 15:07:03'),
(51, 'Question 10', '<p>You poke me hundreds of times, and I never complain about it. I\'m your electronics playground!</p>', 'https://edu-books-images.b-cdn.net/robo/8.png', 10, 1, '2025-10-22 15:07:03'),
(52, 'Question 11', '<p>I let your motors go forward and backward, I\'m basically the car\'s brain for direction!</p>', 'https://edu-books-images.b-cdn.net/robo/10.png', 11, 1, '2025-10-22 15:07:03'),
(53, 'Question 12', '<p>I\'m basically the heart that beats when current flows, turning stillness into speed. Who am I?</p>', 'https://edu-books-images.b-cdn.net/robo/6.png', 12, 1, '2025-10-22 15:07:03'),
(54, 'Question 13', '<p>I may be small, but I run the show. I\'m like your teacher\'s brain, just with more pins.</p>', 'https://edu-books-images.b-cdn.net/robo/11.png', 13, 1, '2025-10-22 15:07:03'),
(55, 'Question 14', '<p>I\'m not a teacher, but everyone looks for me once the break starts. I deal in sandwiches, not grades. I am the break-time hero. Who am I?</p>', 'https://edu-books-images.b-cdn.net/robo/23.png', 14, 1, '2025-10-22 15:07:03'),
(56, 'Question 15', '<p>I carry the energy that keeps your project alive, without me, everything\'s just asleep.</p>', 'https://edu-books-images.b-cdn.net/robo/12.png', 15, 1, '2025-10-22 15:07:03'),
(57, 'Question 16', '<p>I never stop turning, but I never get dizzy. I\'m the reason your RC car moves forward. What am I?</p>', 'https://edu-books-images.b-cdn.net/robo/16.png', 16, 1, '2025-10-22 15:07:03'),
(58, 'Question 17', '<p>I connect things like a good friend, only between the same type. Who am I?</p>', 'https://edu-books-images.b-cdn.net/robo/13.png', 17, 1, '2025-10-22 15:07:03'),
(59, 'Question 18', '<p>Your next mission: pick up our RC car from the booth and find out how long it takes to walk (no running!) across the playground and back. Bring us the answer!</p>', 'https://edu-books-images.b-cdn.net/robo/24.png', 18, 1, '2025-10-22 15:07:03'),
(60, 'Question 19', '<p>I connect where no female can, my pins always find their match!</p>', 'https://edu-books-images.b-cdn.net/robo/14.png', 19, 1, '2025-10-22 15:07:03'),
(61, 'Question 20', '<p>It\'s not a physics formula, not a math problem, not even the smell of burnt circuits… but this single word can make every STEM student start typing at light speed. What is it?</p>', 'https://edu-books-images.b-cdn.net/robo/25.png', 20, 1, '2025-10-22 15:07:03'),
(62, 'Question 21', '<p>I\'m the reason your RC listens to your phone, wireless and proud. Who am I?</p>', 'https://edu-books-images.b-cdn.net/robo/15.png', 21, 1, '2025-10-22 15:07:03'),
(63, 'Question 22', '<p>I\'m round, tough, and always ready to roll. Without me, your car\'s going nowhere.</p>', 'https://edu-books-images.b-cdn.net/robo/17.png', 22, 1, '2025-10-22 15:07:03'),
(64, 'Question 23', '<p>I\'m the only mammal that can\'t jump, not even a tiny hop, yet I can push down trees and shake the ground when I walk. Who am I?</p>', 'https://edu-books-images.b-cdn.net/robo/26.png', 23, 1, '2025-10-22 15:07:03'),
(65, 'Question 24', '<p>I turn power from the motor into motion on the ground — no me, no speed. Who am I?</p>', 'https://edu-books-images.b-cdn.net/robo/18.png', 24, 1, '2025-10-22 15:07:03'),
(66, 'Question 25', '<p>My fingerprints are so close to a human\'s that even detectives could get confused. I live in trees, eat leaves, and have a suspiciously calm expression. Who am I?</p>', 'https://edu-books-images.b-cdn.net/robo/27.png', 25, 1, '2025-10-22 15:07:03'),
(67, 'Question 26', '<p>I\'m simple but essential — I keep the car rolling smoothly while others just spin air. What am I?</p>', 'https://edu-books-images.b-cdn.net/robo/19.png', 26, 1, '2025-10-22 15:07:03'),
(68, 'Question 27', '<p>I\'m technically a fruit, used in salads and sauces, but here\'s the twist: I have more genes than you. Who am I?</p>', 'https://edu-books-images.b-cdn.net/robo/28.png', 27, 1, '2025-10-22 15:07:03'),
(69, 'Question 28', '<p>Without me, your car would collapse faster than a weak circuit. I keep the whole structure solid. Who am I?</p>', 'https://edu-books-images.b-cdn.net/robo/2.png', 28, 1, '2025-10-22 15:07:03'),
(70, 'Question 29', '<p>Every planet spins the same way… except me. I like doing things backwards — even the Sun rises on my \'wrong\' side. Who am I?</p>', 'https://edu-books-images.b-cdn.net/robo/29.png', 29, 1, '2025-10-22 15:07:03'),
(71, 'Question 30', '<p>I bleed blue, not because I\'m royal — but because I use copper instead of iron in my blood. Ancient, armored, and oddly elegant — who am I?</p>', 'https://edu-books-images.b-cdn.net/robo/30.png', 30, 1, '2025-10-22 15:07:03'),
(72, 'Question 31', '<p>This sensor helps a robot avoid bumping into walls — it\'s not magic, just sound waves. What\'s it called?</p>', 'https://edu-books-images.b-cdn.net/robo/32.png', 31, 1, '2025-10-22 15:07:03'),
(73, 'Question 32', '<p>I have three hearts, blue blood, and eight arms, and when things get stressful, I vanish in a cloud of ink. Who am I?</p>', 'https://edu-books-images.b-cdn.net/robo/31.png', 32, 1, '2025-10-22 15:07:03'),
(74, 'Question 33', '<p>Your robot can move forward and backward but turns like a confused turtle. Which component are you probably missing?</p>', 'https://edu-books-images.b-cdn.net/robo/33.png', 33, 1, '2025-10-22 15:07:03'),
(75, 'Question 34', '<p>If a robot had a favorite organ, which one would it be, the one that gives it a brain to think?</p>', 'https://edu-books-images.b-cdn.net/robo/34.png', 34, 1, '2025-10-22 15:07:03'),
(76, 'Question 35', '<p>This motor type doesn\'t spin freely, it\'s all about steps, precision, and patience. What\'s it called?</p>', 'https://edu-books-images.b-cdn.net/robo/35.png', 35, 1, '2025-10-22 15:07:03'),
(77, 'Question 36', '<p>When robots need to \'see\' the world, they don\'t use eyes. They use… what?</p>', 'https://edu-books-images.b-cdn.net/robo/36.png', 36, 1, '2025-10-22 15:07:03'),
(78, 'Question 37', '<p>You tell your robot to move 10 cm forward, but it goes 11 cm and knocks over a cup. Which sensor could\'ve saved your drink?</p>', 'https://edu-books-images.b-cdn.net/robo/37.png', 37, 1, '2025-10-22 15:07:03');

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `submitted_answer` text NOT NULL,
  `status` enum('pending','accepted','rejected') DEFAULT 'pending',
  `admin_notes` text DEFAULT NULL,
  `photo_filename` varchar(255) DEFAULT NULL,
  `photo_submitted_at` datetime DEFAULT NULL,
  `photo_status` enum('pending','accepted','rejected') DEFAULT NULL,
  `photo_reviewed_at` datetime DEFAULT NULL,
  `photo_reviewed_by` int(11) DEFAULT NULL,
  `photo_admin_notes` text DEFAULT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `reviewed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(50) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_active` tinyint(1) DEFAULT 1,
  `last_activity` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `code`, `token`, `created_at`, `is_active`, `last_activity`) VALUES
(1, 'test1', 'test1', NULL, '2025-10-06 15:19:34', 1, '2025-10-21 21:32:12'),
(2, 'test2', 'test2', NULL, '2025-10-06 15:19:34', 1, '2025-10-21 21:35:11'),
(4, 'Team 1', 'meromaro2010hamodi@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(5, 'Team 2', 'ahmedzagloul101@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(6, 'Team 3', 'mahmoudgouda737@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(7, 'Team 4', 'YoussefHossam1230@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(8, 'Team 5', 'andrewraafat834@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(9, 'Team 6', 'waleedziad040@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(10, 'Team 7', 'davedmaher7@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(11, 'Team 8', 'abdelrazkforman966@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(12, 'Team 9', 'youssefmoham655@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(13, 'Team 10', 'hamzaawad8899@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(14, 'Team 11', 'nadahamed043@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(15, 'Team 12', 'mohandnazeeh1@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(16, 'Team 13', 'youssefosso63@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(17, 'Team 14', 'tefashaat@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(18, 'Team 15', 'ahmedramadanelsayed@outlook.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(19, 'Team 16', 'justjohnrommil@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(20, 'Team 17', 'mazenmohammed2610@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(21, 'Team 18', 'omarhany0510@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(22, 'Team 19', 'youssifahmed104@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(23, 'Team 20', 'abdohoba321@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(24, 'Team 21', 'adhamfaied14@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(25, 'Team 22', 'omar1221223@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(26, 'Team 23', 'youssif.abdelaty2010@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(27, 'Team 24', 'mohfekry26@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(28, 'Team 25', 'vegomedo4@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(29, 'Team 26', 'albaraamohammed.personal@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(30, 'Team 27', 'anmedtaha.1@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(31, 'Team 28', 'marwansakr232@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL),
(32, 'Team 29', 'marawan.ayman2010@gmail.com', NULL, '2025-10-22 15:16:29', 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `admin_token` (`admin_token`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_team_question` (`team_id`,`question_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `fk_submissions_photo_reviewed_by` (`photo_reviewed_by`),
  ADD KEY `idx_submissions_photo_status` (`photo_status`),
  ADD KEY `idx_submissions_photo_submitted_at` (`photo_submitted_at`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `token` (`token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `submissions`
--
ALTER TABLE `submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `submissions`
--
ALTER TABLE `submissions`
  ADD CONSTRAINT `fk_submissions_photo_reviewed_by` FOREIGN KEY (`photo_reviewed_by`) REFERENCES `admin_users` (`id`),
  ADD CONSTRAINT `submissions_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  ADD CONSTRAINT `submissions_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
