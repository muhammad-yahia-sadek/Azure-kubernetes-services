-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Dec 04, 2023 at 01:41 PM
-- Server version: 5.7.43
-- PHP Version: 8.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `abilities`
--

CREATE TABLE `abilities` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ability` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ability_role`
--

CREATE TABLE `ability_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ability_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `active_campaign_accounts`
--

CREATE TABLE `active_campaign_accounts` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_super_admin` tinyint(1) NOT NULL DEFAULT '0',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_token` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_2fa_tokens`
--

CREATE TABLE `admin_2fa_tokens` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `try_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `city_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` json DEFAULT NULL,
  `article_category_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `internal_image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT '0',
  `activation` tinyint(1) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `admin_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `article_categories`
--

CREATE TABLE `article_categories` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_hex` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `article_likes`
--

CREATE TABLE `article_likes` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_accesses`
--

CREATE TABLE `book_accesses` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `book_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `alt_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_type` tinyint(4) NOT NULL DEFAULT '1',
  `image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brand_learn_path`
--

CREATE TABLE `brand_learn_path` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `learn_path_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brand_slider`
--

CREATE TABLE `brand_slider` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `slider_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `certification_widgets`
--

CREATE TABLE `certification_widgets` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_category_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `certification_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `challenges`
--

CREATE TABLE `challenges` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `competition_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `competition_scenario` text COLLATE utf8mb4_unicode_ci,
  `guidelines` text COLLATE utf8mb4_unicode_ci,
  `tags` json DEFAULT NULL,
  `flags` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `sub_category_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chapters`
--

CREATE TABLE `chapters` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `old_db_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `drip_time` int(11) NOT NULL DEFAULT '0',
  `course_objective` text COLLATE utf8mb4_unicode_ci,
  `agg_lessons` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chapter_knowledge_assessment_tags`
--

CREATE TABLE `chapter_knowledge_assessment_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chapter_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `speciality_area_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `competency_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ksa_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `country_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commentables`
--

CREATE TABLE `commentables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commentable_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_to_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_to_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `competencies`
--

CREATE TABLE `competencies` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `competition_guests`
--

CREATE TABLE `competition_guests` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `completed_courses`
--

CREATE TABLE `completed_courses` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificate_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `degree` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `certificate_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `completed_course_percentages`
--

CREATE TABLE `completed_course_percentages` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `completed_percentage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_finished` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_uses`
--

CREATE TABLE `contact_uses` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `app_type` smallint(6) DEFAULT NULL,
  `subject_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_us_subjects`
--

CREATE TABLE `contact_us_subjects` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_allow_digit` int(11) DEFAULT NULL,
  `activation` tinyint(1) DEFAULT NULL,
  `image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_name_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_name_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_nationality` tinyint(1) NOT NULL DEFAULT '0',
  `show_country` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brief` text COLLATE utf8mb4_unicode_ci,
  `intro_video` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `learn` json DEFAULT NULL,
  `course_category_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `timing` int(11) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `course_type` int(11) NOT NULL DEFAULT '0',
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cover_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_db_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_percentage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_free` tinyint(1) NOT NULL,
  `seo_keywords` longtext COLLATE utf8mb4_unicode_ci,
  `seo_description` text COLLATE utf8mb4_unicode_ci,
  `seo_image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_essential` tinyint(1) NOT NULL DEFAULT '0',
  `prerequisites` json DEFAULT NULL,
  `subtitles` json DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_best_seller` tinyint(1) NOT NULL DEFAULT '0',
  `is_editorial_pick` tinyint(1) NOT NULL DEFAULT '0',
  `menu_cover_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_sub_category_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `internal_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `challenge_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `advances` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_tags` json DEFAULT NULL,
  `cyberq_course_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_trend` tinyint(1) NOT NULL DEFAULT '0',
  `eccouncil_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agg_avg_reviews` double(8,2) DEFAULT NULL,
  `agg_count_reviews` int(11) DEFAULT NULL,
  `agg_count_course_enrollment` int(11) DEFAULT NULL,
  `agg_lessons` json DEFAULT NULL,
  `agg_count_course_chapters` int(11) DEFAULT NULL,
  `agg_reviews` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses_cyber_qlabs`
--

CREATE TABLE `courses_cyber_qlabs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cyber_qlab_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_assessments`
--

CREATE TABLE `course_assessments` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `correct_answer_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_lesson_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_assessments_answers`
--

CREATE TABLE `course_assessments_answers` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_assessments_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci,
  `is_correct` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_bundles`
--

CREATE TABLE `course_bundles` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` text COLLATE utf8mb4_unicode_ci,
  `display_status` int(11) NOT NULL DEFAULT '0',
  `is_bestseller` tinyint(1) DEFAULT '0',
  `is_new_arrival` tinyint(1) DEFAULT '0',
  `jobs` json DEFAULT NULL,
  `topics` json DEFAULT NULL,
  `certifications` json DEFAULT NULL,
  `bundle_type` int(11) NOT NULL DEFAULT '0',
  `payment_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_period` int(11) DEFAULT NULL,
  `bundle_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_pass_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_features` text COLLATE utf8mb4_unicode_ci,
  `learn_features` json DEFAULT NULL,
  `bundle_spotlight` json DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cover_image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bestseller_brief` text COLLATE utf8mb4_unicode_ci,
  `newarrival_brief` text COLLATE utf8mb4_unicode_ci,
  `is_bundle_spotlight` tinyint(1) DEFAULT '0',
  `access_type` tinyint(1) DEFAULT NULL,
  `access_id` json DEFAULT NULL,
  `deal_end_date` date DEFAULT NULL,
  `seo_keywords` longtext COLLATE utf8mb4_unicode_ci,
  `seo_description` text COLLATE utf8mb4_unicode_ci,
  `seo_image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_categories`
--

CREATE TABLE `course_categories` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `label_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_class_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_parent_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_category_user`
--

CREATE TABLE `course_category_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_category_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_course_tag`
--

CREATE TABLE `course_course_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_tag_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_enrollment`
--

CREATE TABLE `course_enrollment` (
  `id` int(11) UNSIGNED NOT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subscription_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expired_at` date DEFAULT NULL,
  `weekly_target` int(11) NOT NULL DEFAULT '0',
  `selected_days` json DEFAULT NULL,
  `week_start_date` date DEFAULT NULL,
  `week_end_date` date DEFAULT NULL,
  `user_subscription_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_microdegrees`
--

CREATE TABLE `course_microdegrees` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prerequisites` text COLLATE utf8mb4_unicode_ci,
  `average_salary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimated_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `faq` json DEFAULT NULL,
  `syllabus_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_features` json DEFAULT NULL,
  `skills_covered` json DEFAULT NULL,
  `project` json DEFAULT NULL,
  `slack_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_packages`
--

CREATE TABLE `course_packages` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL,
  `features` text COLLATE utf8mb4_unicode_ci,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_partner`
--

CREATE TABLE `course_partner` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partner_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_reviews`
--

CREATE TABLE `course_reviews` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` tinyint(4) NOT NULL,
  `user_goals` text COLLATE utf8mb4_unicode_ci,
  `recommendation` text COLLATE utf8mb4_unicode_ci,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_tags`
--

CREATE TABLE `course_tags` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_category_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_tag_user`
--

CREATE TABLE `course_tag_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_tag_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_user`
--

CREATE TABLE `course_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_weights`
--

CREATE TABLE `course_weights` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_subscription_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_what_to_learns`
--

CREATE TABLE `course_what_to_learns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cyberq_labs`
--

CREATE TABLE `cyberq_labs` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `over_view` text COLLATE utf8mb4_unicode_ci,
  `number_of_exercises` int(11) DEFAULT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cyper_q_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skill_level` int(11) NOT NULL DEFAULT '0',
  `what_you_will_learn` json DEFAULT NULL,
  `flag` json DEFAULT NULL,
  `tag` json DEFAULT NULL,
  `activation` tinyint(1) NOT NULL,
  `certification_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_role_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specialty_area_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `widget_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `widget_description` text COLLATE utf8mb4_unicode_ci,
  `widget_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_part_of_pro_plus` tinyint(1) NOT NULL DEFAULT '0',
  `certification_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_courses_widget` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cyberq_lab_enrollments`
--

CREATE TABLE `cyberq_lab_enrollments` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_subscription_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cyberq_lab_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cyberq_tokens`
--

CREATE TABLE `cyberq_tokens` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` date NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cyber_qlabs_learn_path_infos`
--

CREATE TABLE `cyber_qlabs_learn_path_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cyber_qlab_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `learn_path_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ecoursewares`
--

CREATE TABLE `ecoursewares` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `book_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chapters` json DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `category_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enterprise_infos`
--

CREATE TABLE `enterprise_infos` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `licenses_reuse_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enterprise_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enterprise_learn_paths`
--

CREATE TABLE `enterprise_learn_paths` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enterprise_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_vouchers`
--

CREATE TABLE `exam_vouchers` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voucher_brief` text COLLATE utf8mb4_unicode_ci,
  `validity_in_days` date DEFAULT NULL,
  `instruction_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer_en` text COLLATE utf8mb4_unicode_ci,
  `answer_ar` text COLLATE utf8mb4_unicode_ci,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `app_type` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favourables`
--

CREATE TABLE `favourables` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favourable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favourable_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `final_assessment_answers`
--

CREATE TABLE `final_assessment_answers` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assessment_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assessment_answer_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `final_assessment_timers`
--

CREATE TABLE `final_assessment_timers` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `started_at` datetime DEFAULT NULL,
  `ended_at` datetime DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goal_user`
--

CREATE TABLE `goal_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `goal_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instructor_profiles`
--

CREATE TABLE `instructor_profiles` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_employer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `article_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `years_experience` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_summary` text COLLATE utf8mb4_unicode_ci,
  `cv_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `have_courses` tinyint(1) NOT NULL DEFAULT '0',
  `course_information` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interested_video` tinyint(1) NOT NULL DEFAULT '0',
  `interested_assessments` tinyint(1) NOT NULL DEFAULT '0',
  `interested_written_materials` tinyint(1) NOT NULL DEFAULT '0',
  `have_trending_course` tinyint(1) NOT NULL DEFAULT '0',
  `trending_course_description` text COLLATE utf8mb4_unicode_ci,
  `trending_course_topic` text COLLATE utf8mb4_unicode_ci,
  `trending_course_target_audience` text COLLATE utf8mb4_unicode_ci,
  `video_sample_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `facebook_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `swift_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_percentage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` text COLLATE utf8mb4_unicode_ci,
  `payee_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payee_bank_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payee_branch_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intermediary_bank` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `routing_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payee_bank_for_tt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `integration_users`
--

CREATE TABLE `integration_users` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_roles`
--

CREATE TABLE `job_roles` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_role_ksa`
--

CREATE TABLE `job_role_ksa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_role_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ksa_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_rollables`
--

CREATE TABLE `job_rollables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_role_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_rollable_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_rollable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ksas`
--

CREATE TABLE `ksas` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `competency_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `learn_path_categories`
--

CREATE TABLE `learn_path_categories` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `learn_path_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_category_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `learn_path_certificates`
--

CREATE TABLE `learn_path_certificates` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `learnpath_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificate_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificate_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `degree` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `learn_path_courses`
--

CREATE TABLE `learn_path_courses` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `learn_path_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `learn_path_infos`
--

CREATE TABLE `learn_path_infos` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `overview` text COLLATE utf8mb4_unicode_ci,
  `for_who` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `learn` json DEFAULT NULL,
  `skills` json DEFAULT NULL,
  `jobs` json DEFAULT NULL,
  `prerequisite` json DEFAULT NULL,
  `faq` json DEFAULT NULL,
  `package_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avg_salary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jobs_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skills_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` json DEFAULT NULL,
  `subtitles` json DEFAULT NULL,
  `description` json DEFAULT NULL,
  `sub_category_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `agg_courses` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `learn_path_packages`
--

CREATE TABLE `learn_path_packages` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `features` text COLLATE utf8mb4_unicode_ci,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chapter_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `overview` text COLLATE utf8mb4_unicode_ci,
  `video` mediumtext COLLATE utf8mb4_unicode_ci,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `ilab_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_db_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cyperq_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manual_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_free` tinyint(1) NOT NULL DEFAULT '0',
  `book_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `after_chapter` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outer_overview` text COLLATE utf8mb4_unicode_ci,
  `cyberq_lab_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exam_voucher_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecourseware_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lesson_faqs`
--

CREATE TABLE `lesson_faqs` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lesson_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lesson_msqs`
--

CREATE TABLE `lesson_msqs` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lesson_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answers` json DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `related_lesson_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lesson_objectives`
--

CREATE TABLE `lesson_objectives` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objective_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL,
  `lesson_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chapter_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lesson_tasks`
--

CREATE TABLE `lesson_tasks` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL,
  `lesson_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chapter_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lesson_task_user`
--

CREATE TABLE `lesson_task_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lesson_task_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lesson_upload`
--

CREATE TABLE `lesson_upload` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lesson_user_notes`
--

CREATE TABLE `lesson_user_notes` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chapter_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lesson_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lesson_vouchers`
--

CREATE TABLE `lesson_vouchers` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lesson_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `exam_voucher_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `licenses`
--

CREATE TABLE `licenses` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `license` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` date NOT NULL,
  `license_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enterprise_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subaccount_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `package_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifier_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `device_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package_subscriptions`
--

CREATE TABLE `package_subscriptions` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `access_type` tinyint(1) DEFAULT NULL,
  `access_id` text COLLATE utf8mb4_unicode_ci,
  `duration` int(11) DEFAULT NULL,
  `enterprise_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deadline_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiration_date` timestamp NULL DEFAULT NULL,
  `expiration_days` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_permission` int(11) NOT NULL DEFAULT '2',
  `learn_path_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `free_trial_days` int(11) DEFAULT NULL,
  `is_installment` tinyint(1) NOT NULL DEFAULT '0',
  `installment_count` int(11) DEFAULT NULL,
  `course_type` tinyint(4) DEFAULT NULL,
  `offer_internal_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_type` tinyint(4) DEFAULT NULL,
  `offer_sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_frequency` int(11) DEFAULT NULL,
  `installment_frequency` int(11) DEFAULT NULL,
  `installment_frequency_days` int(11) DEFAULT NULL,
  `subscription_frequency_days` int(11) DEFAULT NULL,
  `is_free_trial` tinyint(1) NOT NULL DEFAULT '0',
  `trial_period_price` decimal(8,2) DEFAULT NULL,
  `offer_version` tinyint(4) NOT NULL DEFAULT '1',
  `installment_price` decimal(8,2) DEFAULT NULL,
  `trial` int(11) DEFAULT NULL,
  `practice_course_labs_duration` int(11) DEFAULT NULL,
  `certification_labs_duration` int(11) DEFAULT NULL,
  `certification_ecourseware_duration` int(11) DEFAULT NULL,
  `certification_exam_voucher_duration` int(11) DEFAULT NULL,
  `certification_competition_duration` int(11) DEFAULT NULL,
  `course_duration` int(11) DEFAULT NULL,
  `link_to_learn_path` tinyint(1) DEFAULT NULL,
  `include_certification_ecourseware` tinyint(1) DEFAULT NULL,
  `include_certification_exam_voucher` tinyint(1) DEFAULT NULL,
  `include_certification_competition` tinyint(1) DEFAULT NULL,
  `include_course_practice_labs` tinyint(1) DEFAULT NULL,
  `include_certification_labs` tinyint(1) DEFAULT NULL,
  `limit_labs` tinyint(1) NOT NULL DEFAULT '1',
  `lab_launches_limit` int(11) DEFAULT NULL,
  `include_all_courses` tinyint(1) NOT NULL DEFAULT '0',
  `include_all_certifications` tinyint(1) NOT NULL DEFAULT '0',
  `include_all_labs` tinyint(1) NOT NULL DEFAULT '0',
  `include_all_ecoursewares` tinyint(1) NOT NULL DEFAULT '0',
  `include_all_exam_vouchers` tinyint(1) NOT NULL DEFAULT '0',
  `include_all_competitions` tinyint(1) NOT NULL DEFAULT '0',
  `include_all_learn_paths` tinyint(1) NOT NULL DEFAULT '0',
  `include_learn_paths_labs` tinyint(1) DEFAULT NULL,
  `learn_paths_labs_duration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package_subscription_chapter`
--

CREATE TABLE `package_subscription_chapter` (
  `id` int(11) NOT NULL,
  `package_subscription_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chapter_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `after_installment_number` int(11) NOT NULL DEFAULT '0',
  `is_free_trial` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package_subscription_package`
--

CREATE TABLE `package_subscription_package` (
  `id` int(11) NOT NULL,
  `package_subscription_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `packageable_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packageable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_linked_to` int(11) DEFAULT NULL,
  `related_to` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `partner_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `partner_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `payment_integrations`
--

CREATE TABLE `payment_integrations` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payable_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_gateway` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_transactions`
--

CREATE TABLE `payment_transactions` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_integration_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payable_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `more_info` text COLLATE utf8mb4_unicode_ci,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_transactions_histories`
--

CREATE TABLE `payment_transactions_histories` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_integration_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payable_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `more_info` text COLLATE utf8mb4_unicode_ci,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payouts`
--

CREATE TABLE `payouts` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `period` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quarter` int(11) DEFAULT NULL,
  `secondary_id` int(11) NOT NULL DEFAULT '0',
  `royalties_courses` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `royalties_bundles` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outstanding_advances` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `royalties_carried_out` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `royalty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payout_royalties`
--

CREATE TABLE `payout_royalties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `outstanding_advances` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `royalties_carried_out` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `royalty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payout_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proctor_users`
--

CREATE TABLE `proctor_users` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation` tinyint(1) NOT NULL,
  `course_ids` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_applications`
--

CREATE TABLE `project_applications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lesson_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_heading` text COLLATE utf8mb4_unicode_ci,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_text_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quote` text COLLATE utf8mb4_unicode_ci,
  `author_name` text COLLATE utf8mb4_unicode_ci,
  `author_position` text COLLATE utf8mb4_unicode_ci,
  `author_image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_super_admin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title_color` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title_color` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_color` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_txt` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_target_url` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `specialty_areables`
--

CREATE TABLE `specialty_areables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `specialty_area_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specialty_areable_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialty_areable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `specialty_areas`
--

CREATE TABLE `specialty_areas` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_cancellation_requests`
--

CREATE TABLE `subscription_cancellation_requests` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other` text COLLATE utf8mb4_unicode_ci,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries`
--

CREATE TABLE `telescope_entries` (
  `sequence` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries_tags`
--

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_monitoring`
--

CREATE TABLE `telescope_monitoring` (
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tools_course`
--

CREATE TABLE `tools_course` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tool_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `in_use` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `container` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default_profile_image` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_reset_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temp_email_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temp_phone_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `country_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `level_experience` int(11) NOT NULL DEFAULT '0',
  `daily_target` int(11) NOT NULL DEFAULT '0',
  `active_campaign_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oauth2_client_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_db_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enterprise_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subaccount_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_status` tinyint(1) NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vital_source_ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weekly_target` int(11) NOT NULL DEFAULT '0',
  `selected_days` json DEFAULT NULL,
  `week_start_date` date DEFAULT NULL,
  `week_end_date` date DEFAULT NULL,
  `display_name` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_display_name_updated` tinyint(1) NOT NULL DEFAULT '0',
  `is_profile_picture_updated` tinyint(1) NOT NULL DEFAULT '0',
  `utm_data` json DEFAULT NULL,
  `viral_source_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_activity_logs`
--

CREATE TABLE `user_activity_logs` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `log_type` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_assets`
--

CREATE TABLE `user_assets` (
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_subscription_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_subscription_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_clone_job` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assets` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_competitions`
--

CREATE TABLE `user_competitions` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `challenge_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guest_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `competition_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_lab_launched` tinyint(1) NOT NULL DEFAULT '0',
  `is_lab_completed` tinyint(1) NOT NULL DEFAULT '0',
  `started_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `completed_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_score` int(11) DEFAULT NULL,
  `exam_score` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_course_survey`
--

CREATE TABLE `user_course_survey` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chapter_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lesson_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `survey` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_flags`
--

CREATE TABLE `user_flags` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `challenge_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guest_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `competition_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_taken` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_score` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` date NOT NULL,
  `subscription_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `package_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_installment` tinyint(1) NOT NULL DEFAULT '0',
  `paid_installment_count` int(11) NOT NULL DEFAULT '0',
  `is_pro` tinyint(1) NOT NULL DEFAULT '0',
  `include_all_courses` tinyint(1) NOT NULL DEFAULT '0',
  `include_all_certifications` tinyint(1) NOT NULL DEFAULT '0',
  `include_all_labs` tinyint(1) NOT NULL DEFAULT '0',
  `include_all_ecoursewares` tinyint(1) NOT NULL DEFAULT '0',
  `include_all_exam_vouchers` tinyint(1) NOT NULL DEFAULT '0',
  `include_all_competitions` tinyint(1) NOT NULL DEFAULT '0',
  `include_all_learn_paths` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_tags`
--

CREATE TABLE `user_tags` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `enterprise_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_user_tag`
--

CREATE TABLE `user_user_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_tag_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voucher` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_used` tinyint(1) NOT NULL,
  `expired_at` date NOT NULL,
  `days` int(11) NOT NULL DEFAULT '1',
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payable_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` json DEFAULT NULL,
  `access_type` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `watched_lessons`
--

CREATE TABLE `watched_lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subscription_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chapter_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `watching_histories`
--

CREATE TABLE `watching_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `watch_history_times`
--

CREATE TABLE `watch_history_times` (
  `id` int(11) UNSIGNED NOT NULL,
  `instructor_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lesson_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `watched_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workshops`
--

CREATE TABLE `workshops` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `image_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abilities`
--
ALTER TABLE `abilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `abilities_module_id_foreign` (`module_id`);

--
-- Indexes for table `ability_role`
--
ALTER TABLE `ability_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ability_role_ability_id_foreign` (`ability_id`),
  ADD KEY `ability_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `active_campaign_accounts`
--
ALTER TABLE `active_campaign_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `active_campaign_accounts_email_unique` (`email`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_phone_unique` (`phone`),
  ADD KEY `admins_image_id_foreign` (`image_id`),
  ADD KEY `admins_role_id_foreign` (`role_id`);

--
-- Indexes for table `admin_2fa_tokens`
--
ALTER TABLE `admin_2fa_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_2fa_tokens_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `areas_city_id_foreign` (`city_id`),
  ADD KEY `areas_image_id_foreign` (`image_id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articles_article_category_id_foreign` (`article_category_id`),
  ADD KEY `articles_image_id_foreign` (`image_id`),
  ADD KEY `articles_internal_image_id_foreign` (`internal_image_id`),
  ADD KEY `articles_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `article_categories`
--
ALTER TABLE `article_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article_likes`
--
ALTER TABLE `article_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_likes_article_id_foreign` (`article_id`),
  ADD KEY `article_likes_user_id_foreign` (`user_id`);

--
-- Indexes for table `book_accesses`
--
ALTER TABLE `book_accesses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_image_id_foreign` (`image_id`);

--
-- Indexes for table `brand_learn_path`
--
ALTER TABLE `brand_learn_path`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_learn_path_brand_id_foreign` (`brand_id`),
  ADD KEY `brand_learn_path_learn_path_id_foreign` (`learn_path_id`);

--
-- Indexes for table `brand_slider`
--
ALTER TABLE `brand_slider`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_slider_brand_id_foreign` (`brand_id`),
  ADD KEY `brand_slider_slider_id_foreign` (`slider_id`);

--
-- Indexes for table `certification_widgets`
--
ALTER TABLE `certification_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `certification_widgets_image_id_foreign` (`image_id`),
  ADD KEY `certification_widgets_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `certification_widgets_certification_id_foreign` (`certification_id`);

--
-- Indexes for table `challenges`
--
ALTER TABLE `challenges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `challenges_slug_unique` (`slug`),
  ADD KEY `challenges_sub_category_id_foreign` (`sub_category_id`);

--
-- Indexes for table `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chapters_course_id_foreign` (`course_id`);

--
-- Indexes for table `chapter_knowledge_assessment_tags`
--
ALTER TABLE `chapter_knowledge_assessment_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chapter_knowledge_assessment_tags_course_id_foreign` (`course_id`),
  ADD KEY `chapter_knowledge_assessment_tags_chapter_id_foreign` (`chapter_id`),
  ADD KEY `chapter_knowledge_assessment_tags_speciality_area_id_foreign` (`speciality_area_id`),
  ADD KEY `chapter_knowledge_assessment_tags_competency_id_foreign` (`competency_id`),
  ADD KEY `chapter_knowledge_assessment_tags_ksa_id_foreign` (`ksa_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_country_id_foreign` (`country_id`),
  ADD KEY `cities_image_id_foreign` (`image_id`);

--
-- Indexes for table `commentables`
--
ALTER TABLE `commentables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commentables_comment_id_foreign` (`comment_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `competencies`
--
ALTER TABLE `competencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `competition_guests`
--
ALTER TABLE `competition_guests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `completed_courses`
--
ALTER TABLE `completed_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `completed_courses_user_id_foreign` (`user_id`),
  ADD KEY `completed_courses_course_id_foreign` (`course_id`),
  ADD KEY `completed_courses_certificate_id_foreign` (`certificate_id`);

--
-- Indexes for table `completed_course_percentages`
--
ALTER TABLE `completed_course_percentages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `completed_course_percentages_user_id_foreign` (`user_id`),
  ADD KEY `completed_course_percentages_course_id_foreign` (`course_id`);

--
-- Indexes for table `contact_uses`
--
ALTER TABLE `contact_uses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_uses_subject_id_foreign` (`subject_id`),
  ADD KEY `contact_uses_user_id_foreign` (`user_id`);

--
-- Indexes for table `contact_us_subjects`
--
ALTER TABLE `contact_us_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countries_image_id_foreign` (`image_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_image_id_foreign` (`image_id`),
  ADD KEY `courses_user_id_foreign` (`user_id`),
  ADD KEY `courses_course_category_id_foreign` (`course_category_id`),
  ADD KEY `courses_cover_id_foreign` (`cover_id`),
  ADD KEY `courses_seo_image_id_foreign` (`seo_image_id`),
  ADD KEY `courses_menu_cover_id_foreign` (`menu_cover_id`),
  ADD KEY `courses_course_sub_category_id_foreign` (`course_sub_category_id`),
  ADD KEY `courses_name_index` (`name`),
  ADD KEY `name` (`name`),
  ADD KEY `courses_challenge_id_foreign` (`challenge_id`);

--
-- Indexes for table `courses_cyber_qlabs`
--
ALTER TABLE `courses_cyber_qlabs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_assessments`
--
ALTER TABLE `course_assessments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_assessments_course_id_foreign` (`course_id`),
  ADD KEY `course_assessments_correct_answer_id_foreign` (`correct_answer_id`);

--
-- Indexes for table `course_assessments_answers`
--
ALTER TABLE `course_assessments_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_assessments_answers_course_assessments_id_foreign` (`course_assessments_id`);

--
-- Indexes for table `course_bundles`
--
ALTER TABLE `course_bundles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_bundles_image_id_foreign` (`image_id`),
  ADD KEY `course_bundles_cover_image_id_foreign` (`cover_image_id`),
  ADD KEY `course_bundles_seo_image_id_foreign` (`seo_image_id`),
  ADD KEY `course_bundles_package_id_foreign` (`package_id`);

--
-- Indexes for table `course_categories`
--
ALTER TABLE `course_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_categories_image_id_foreign` (`image_id`);

--
-- Indexes for table `course_category_user`
--
ALTER TABLE `course_category_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_category_user_course_category_id_foreign` (`course_category_id`),
  ADD KEY `course_category_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `course_course_tag`
--
ALTER TABLE `course_course_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_course_tag_course_tag_id_foreign` (`course_tag_id`),
  ADD KEY `course_course_tag_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_enrollment`
--
ALTER TABLE `course_enrollment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_enrollment_course_id_foreign` (`course_id`),
  ADD KEY `course_enrollment_user_id_foreign` (`user_id`),
  ADD KEY `course_enrollment_user_subscription_id_foreign` (`user_subscription_id`);

--
-- Indexes for table `course_microdegrees`
--
ALTER TABLE `course_microdegrees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_microdegrees_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_packages`
--
ALTER TABLE `course_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_packages_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_partner`
--
ALTER TABLE `course_partner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_partner_course_id_foreign` (`course_id`),
  ADD KEY `course_partner_partner_id_foreign` (`partner_id`);

--
-- Indexes for table `course_reviews`
--
ALTER TABLE `course_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_reviews_user_id_foreign` (`user_id`),
  ADD KEY `course_reviews_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_tags`
--
ALTER TABLE `course_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_tags_image_id_foreign` (`image_id`),
  ADD KEY `course_tags_course_category_id_foreign` (`course_category_id`);

--
-- Indexes for table `course_tag_user`
--
ALTER TABLE `course_tag_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_tag_user_course_tag_id_foreign` (`course_tag_id`),
  ADD KEY `course_tag_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `course_user`
--
ALTER TABLE `course_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_user_user_id_foreign` (`user_id`),
  ADD KEY `course_user_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_weights`
--
ALTER TABLE `course_weights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_weights_package_subscription_id_foreign` (`package_subscription_id`),
  ADD KEY `course_weights_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_what_to_learns`
--
ALTER TABLE `course_what_to_learns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_what_to_learns_course_id_foreign` (`course_id`),
  ADD KEY `course_what_to_learns_image_id_foreign` (`image_id`);

--
-- Indexes for table `cyberq_labs`
--
ALTER TABLE `cyberq_labs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cyberq_labs_category_id_foreign` (`category_id`),
  ADD KEY `cyberq_labs_job_role_id_foreign` (`job_role_id`),
  ADD KEY `cyberq_labs_specialty_area_id_foreign` (`specialty_area_id`),
  ADD KEY `cyberq_labs_image_id_foreign` (`image_id`),
  ADD KEY `cyberq_labs_certification_id_foreign` (`certification_id`),
  ADD KEY `cyberq_labs_cover_id_foreign` (`cover_id`);

--
-- Indexes for table `cyberq_lab_enrollments`
--
ALTER TABLE `cyberq_lab_enrollments`
  ADD KEY `cyberq_lab_enrollments_user_subscription_id_foreign` (`user_subscription_id`),
  ADD KEY `cyberq_lab_enrollments_cyberq_lab_id_foreign` (`cyberq_lab_id`),
  ADD KEY `cyberq_lab_enrollments_user_id_foreign` (`user_id`);

--
-- Indexes for table `cyberq_tokens`
--
ALTER TABLE `cyberq_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cyberq_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `cyber_qlabs_learn_path_infos`
--
ALTER TABLE `cyber_qlabs_learn_path_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecoursewares`
--
ALTER TABLE `ecoursewares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ecoursewares_category_id_foreign` (`category_id`),
  ADD KEY `ecoursewares_image_id_foreign` (`image_id`);

--
-- Indexes for table `enterprise_infos`
--
ALTER TABLE `enterprise_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enterprise_infos_enterprise_id_foreign` (`enterprise_id`);

--
-- Indexes for table `enterprise_learn_paths`
--
ALTER TABLE `enterprise_learn_paths`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enterprise_learn_paths_learn_path_id_foreign` (`package_id`),
  ADD KEY `enterprise_learn_paths_enterprise_id_foreign` (`enterprise_id`);

--
-- Indexes for table `exam_vouchers`
--
ALTER TABLE `exam_vouchers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_vouchers_instruction_id_foreign` (`instruction_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourables`
--
ALTER TABLE `favourables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favourables_user_id_foreign` (`user_id`),
  ADD KEY `favourables_favourable_type_favourable_id_index` (`favourable_type`,`favourable_id`);

--
-- Indexes for table `final_assessment_answers`
--
ALTER TABLE `final_assessment_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `final_assessment_answers_user_id_foreign` (`user_id`),
  ADD KEY `final_assessment_answers_course_id_foreign` (`course_id`),
  ADD KEY `final_assessment_answers_assessment_id_foreign` (`assessment_id`),
  ADD KEY `final_assessment_answers_assessment_answer_id_foreign` (`assessment_answer_id`);

--
-- Indexes for table `final_assessment_timers`
--
ALTER TABLE `final_assessment_timers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `final_assessment_timers_user_id_foreign` (`user_id`),
  ADD KEY `final_assessment_timers_course_id_foreign` (`course_id`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goal_user`
--
ALTER TABLE `goal_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goal_user_goal_id_foreign` (`goal_id`),
  ADD KEY `goal_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `instructor_profiles`
--
ALTER TABLE `instructor_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `instructor_profiles_user_id_foreign` (`user_id`),
  ADD KEY `instructor_profiles_cv_id_foreign` (`cv_id`),
  ADD KEY `instructor_profiles_video_sample_id_foreign` (`video_sample_id`);

--
-- Indexes for table `integration_users`
--
ALTER TABLE `integration_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_roles`
--
ALTER TABLE `job_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_role_ksa`
--
ALTER TABLE `job_role_ksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_role_ksa_job_role_id_foreign` (`job_role_id`),
  ADD KEY `job_role_ksa_ksa_id_foreign` (`ksa_id`);

--
-- Indexes for table `job_rollables`
--
ALTER TABLE `job_rollables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_rollables_job_role_id_foreign` (`job_role_id`);

--
-- Indexes for table `ksas`
--
ALTER TABLE `ksas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ksas_competency_id_foreign` (`competency_id`);

--
-- Indexes for table `learn_path_categories`
--
ALTER TABLE `learn_path_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `learn_path_categories_learn_path_id_foreign` (`learn_path_id`),
  ADD KEY `learn_path_categories_course_category_id_foreign` (`course_category_id`);

--
-- Indexes for table `learn_path_certificates`
--
ALTER TABLE `learn_path_certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `learn_path_certificates_user_id_foreign` (`user_id`),
  ADD KEY `learn_path_certificates_learnpath_id_foreign` (`learnpath_id`),
  ADD KEY `learn_path_certificates_certificate_id_foreign` (`certificate_id`);

--
-- Indexes for table `learn_path_courses`
--
ALTER TABLE `learn_path_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `learn_path_courses_learn_path_id_foreign` (`learn_path_id`),
  ADD KEY `learn_path_courses_course_id_foreign` (`course_id`);

--
-- Indexes for table `learn_path_infos`
--
ALTER TABLE `learn_path_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `learn_path_infos_package_id_foreign` (`package_id`),
  ADD KEY `learn_path_infos_image_id_foreign` (`image_id`),
  ADD KEY `learn_path_infos_cover_id_foreign` (`cover_id`),
  ADD KEY `learn_path_infos_category_id_foreign` (`category_id`),
  ADD KEY `learn_path_infos_sub_category_id_foreign` (`sub_category_id`);

--
-- Indexes for table `learn_path_packages`
--
ALTER TABLE `learn_path_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `learn_path_packages_path_id_foreign` (`path_id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_course_id_foreign` (`course_id`),
  ADD KEY `lessons_chapter_id_foreign` (`chapter_id`),
  ADD KEY `lessons_image_id_foreign` (`image_id`),
  ADD KEY `lessons_manual_id_foreign` (`manual_id`),
  ADD KEY `lessons_after_chapter_foreign` (`after_chapter`),
  ADD KEY `lessons_cyberq_lab_id_foreign` (`cyberq_lab_id`),
  ADD KEY `lessons_exam_voucher_id_foreign` (`exam_voucher_id`),
  ADD KEY `lessons_ecourseware_id_foreign` (`ecourseware_id`);

--
-- Indexes for table `lesson_faqs`
--
ALTER TABLE `lesson_faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_faqs_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `lesson_msqs`
--
ALTER TABLE `lesson_msqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_msqs_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `lesson_objectives`
--
ALTER TABLE `lesson_objectives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_objectives_lesson_id_foreign` (`lesson_id`),
  ADD KEY `lesson_objectives_course_id_foreign` (`course_id`),
  ADD KEY `lesson_objectives_chapter_id_foreign` (`chapter_id`);

--
-- Indexes for table `lesson_tasks`
--
ALTER TABLE `lesson_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_tasks_lesson_id_foreign` (`lesson_id`),
  ADD KEY `lesson_tasks_course_id_foreign` (`course_id`),
  ADD KEY `lesson_tasks_chapter_id_foreign` (`chapter_id`);

--
-- Indexes for table `lesson_task_user`
--
ALTER TABLE `lesson_task_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_task_user_lesson_id_foreign` (`lesson_id`),
  ADD KEY `lesson_task_user_lesson_task_id_foreign` (`lesson_task_id`),
  ADD KEY `lesson_task_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `lesson_upload`
--
ALTER TABLE `lesson_upload`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_upload_lesson_id_foreign` (`lesson_id`),
  ADD KEY `lesson_upload_attachment_id_foreign` (`attachment_id`);

--
-- Indexes for table `lesson_user_notes`
--
ALTER TABLE `lesson_user_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_user_notes_course_id_foreign` (`course_id`),
  ADD KEY `lesson_user_notes_chapter_id_foreign` (`chapter_id`),
  ADD KEY `lesson_user_notes_lesson_id_foreign` (`lesson_id`),
  ADD KEY `lesson_user_notes_user_id_foreign` (`user_id`);

--
-- Indexes for table `lesson_vouchers`
--
ALTER TABLE `lesson_vouchers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_vouchers_lesson_id_foreign` (`lesson_id`),
  ADD KEY `lesson_vouchers_user_id_foreign` (`user_id`),
  ADD KEY `lesson_vouchers_exam_voucher_id_foreign` (`exam_voucher_id`),
  ADD KEY `lesson_vouchers_course_id_foreign` (`course_id`);

--
-- Indexes for table `licenses`
--
ALTER TABLE `licenses`
  ADD KEY `licenses_user_id_foreign` (`user_id`),
  ADD KEY `licenses_enterprise_id_foreign` (`enterprise_id`),
  ADD KEY `licenses_subaccount_id_foreign` (`subaccount_id`),
  ADD KEY `licenses_package_id_foreign` (`package_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `package_subscriptions`
--
ALTER TABLE `package_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_subscriptions_enterprise_id_foreign` (`enterprise_id`),
  ADD KEY `package_subscriptions_learn_path_id_foreign` (`learn_path_id`);

--
-- Indexes for table `package_subscription_chapter`
--
ALTER TABLE `package_subscription_chapter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_subscription_chapter_package_subscription_id_foreign` (`package_subscription_id`),
  ADD KEY `package_subscription_chapter_chapter_id_foreign` (`chapter_id`),
  ADD KEY `package_subscription_chapter_course_id_foreign` (`course_id`);

--
-- Indexes for table `package_subscription_package`
--
ALTER TABLE `package_subscription_package`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_subscription_package_package_subscription_id_foreign` (`package_subscription_id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `partners_partner_name_unique` (`partner_name`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_integrations`
--
ALTER TABLE `payment_integrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_integrations_payable_type_payable_id_index` (`payable_type`,`payable_id`);

--
-- Indexes for table `payment_transactions`
--
ALTER TABLE `payment_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_transactions_user_id_foreign` (`user_id`),
  ADD KEY `payment_transactions_payment_integration_id_foreign` (`payment_integration_id`),
  ADD KEY `payment_transactions_payable_type_payable_id_index` (`payable_type`,`payable_id`);

--
-- Indexes for table `payment_transactions_histories`
--
ALTER TABLE `payment_transactions_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_transactions_histories_user_id_foreign` (`user_id`),
  ADD KEY `payment_transactions_histories_payment_integration_id_foreign` (`payment_integration_id`),
  ADD KEY `payment_transactions_histories_payable_type_payable_id_index` (`payable_type`,`payable_id`);

--
-- Indexes for table `payouts`
--
ALTER TABLE `payouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payouts_attachment_id_foreign` (`attachment_id`),
  ADD KEY `payouts_user_id_foreign` (`user_id`),
  ADD KEY `payouts_course_id_foreign` (`course_id`);

--
-- Indexes for table `payout_royalties`
--
ALTER TABLE `payout_royalties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payout_royalties_course_id_foreign` (`course_id`),
  ADD KEY `payout_royalties_payout_id_foreign` (`payout_id`),
  ADD KEY `payout_royalties_user_id_foreign` (`user_id`);

--
-- Indexes for table `proctor_users`
--
ALTER TABLE `proctor_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `proctor_users_username_unique` (`username`);

--
-- Indexes for table `project_applications`
--
ALTER TABLE `project_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_applications_user_id_foreign` (`user_id`),
  ADD KEY `project_applications_course_id_foreign` (`course_id`),
  ADD KEY `project_applications_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotes_author_image_id_foreign` (`author_image_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sliders_image_id_foreign` (`image_id`);

--
-- Indexes for table `specialty_areables`
--
ALTER TABLE `specialty_areables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `specialty_areables_specialty_area_id_foreign` (`specialty_area_id`);

--
-- Indexes for table `specialty_areas`
--
ALTER TABLE `specialty_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_cancellation_requests`
--
ALTER TABLE `subscription_cancellation_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscription_cancellation_requests_user_id_foreign` (`user_id`);

--
-- Indexes for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  ADD PRIMARY KEY (`sequence`),
  ADD UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  ADD KEY `telescope_entries_batch_id_index` (`batch_id`),
  ADD KEY `telescope_entries_family_hash_index` (`family_hash`),
  ADD KEY `telescope_entries_created_at_index` (`created_at`),
  ADD KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`);

--
-- Indexes for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  ADD KEY `telescope_entries_tags_tag_index` (`tag`);

--
-- Indexes for table `tools_course`
--
ALTER TABLE `tools_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tools_course_tool_id_foreign` (`tool_id`),
  ADD KEY `tools_course_course_id_foreign` (`course_id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `users_display_name_unique` (`display_name`),
  ADD KEY `users_image_id_foreign` (`image_id`),
  ADD KEY `users_country_id_foreign` (`country_id`),
  ADD KEY `users_city_id_foreign` (`city_id`),
  ADD KEY `users_enterprise_id_foreign` (`enterprise_id`),
  ADD KEY `users_subaccount_id_foreign` (`subaccount_id`);

--
-- Indexes for table `user_assets`
--
ALTER TABLE `user_assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_assets_user_id_foreign` (`user_id`),
  ADD KEY `user_assets_package_subscription_id_foreign` (`package_subscription_id`),
  ADD KEY `user_assets_user_subscription_id_foreign` (`user_subscription_id`);

--
-- Indexes for table `user_competitions`
--
ALTER TABLE `user_competitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_competitions_user_id_foreign` (`user_id`),
  ADD KEY `user_competitions_guest_id_foreign` (`guest_id`),
  ADD KEY `user_competitions_challenge_id_foreign` (`challenge_id`);

--
-- Indexes for table `user_course_survey`
--
ALTER TABLE `user_course_survey`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_course_survey_user_id_foreign` (`user_id`),
  ADD KEY `user_course_survey_course_id_foreign` (`course_id`),
  ADD KEY `user_course_survey_chapter_id_foreign` (`chapter_id`),
  ADD KEY `user_course_survey_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `user_flags`
--
ALTER TABLE `user_flags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_flags_user_id_foreign` (`user_id`),
  ADD KEY `user_flags_guest_id_foreign` (`guest_id`),
  ADD KEY `user_flags_challenge_id_foreign` (`challenge_id`);

--
-- Indexes for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_subscriptions_user_id_foreign` (`user_id`),
  ADD KEY `user_subscriptions_package_id_foreign` (`package_id`);

--
-- Indexes for table `user_tags`
--
ALTER TABLE `user_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_tags_enterprise_id_foreign` (`enterprise_id`);

--
-- Indexes for table `user_user_tag`
--
ALTER TABLE `user_user_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_user_tag_user_tag_id_foreign` (`user_tag_id`),
  ADD KEY `user_user_tag_user_id_foreign` (`user_id`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vouchers_user_id_foreign` (`user_id`),
  ADD KEY `vouchers_payable_type_payable_id_index` (`payable_type`,`payable_id`);

--
-- Indexes for table `watched_lessons`
--
ALTER TABLE `watched_lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `watched_lessons_lesson_id_foreign` (`lesson_id`),
  ADD KEY `watched_lessons_user_id_foreign` (`user_id`),
  ADD KEY `watched_lessons_course_id_foreign` (`course_id`),
  ADD KEY `watched_lessons_chapter_id_foreign` (`chapter_id`);

--
-- Indexes for table `watching_histories`
--
ALTER TABLE `watching_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `watching_histories_lesson_id_foreign` (`lesson_id`),
  ADD KEY `watching_histories_user_id_foreign` (`user_id`),
  ADD KEY `watching_histories_course_id_foreign` (`course_id`);

--
-- Indexes for table `watch_history_times`
--
ALTER TABLE `watch_history_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `watch_history_times_instructor_id_foreign` (`instructor_id`),
  ADD KEY `watch_history_times_user_id_foreign` (`user_id`),
  ADD KEY `watch_history_times_lesson_id_foreign` (`lesson_id`),
  ADD KEY `watch_history_times_course_id_foreign` (`course_id`);

--
-- Indexes for table `workshops`
--
ALTER TABLE `workshops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workshops_user_id_foreign` (`user_id`),
  ADD KEY `workshops_image_id_foreign` (`image_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ability_role`
--
ALTER TABLE `ability_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brand_learn_path`
--
ALTER TABLE `brand_learn_path`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brand_slider`
--
ALTER TABLE `brand_slider`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chapter_knowledge_assessment_tags`
--
ALTER TABLE `chapter_knowledge_assessment_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commentables`
--
ALTER TABLE `commentables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses_cyber_qlabs`
--
ALTER TABLE `courses_cyber_qlabs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_category_user`
--
ALTER TABLE `course_category_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_course_tag`
--
ALTER TABLE `course_course_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_enrollment`
--
ALTER TABLE `course_enrollment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_partner`
--
ALTER TABLE `course_partner`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_tag_user`
--
ALTER TABLE `course_tag_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_user`
--
ALTER TABLE `course_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_what_to_learns`
--
ALTER TABLE `course_what_to_learns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cyber_qlabs_learn_path_infos`
--
ALTER TABLE `cyber_qlabs_learn_path_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `goal_user`
--
ALTER TABLE `goal_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_role_ksa`
--
ALTER TABLE `job_role_ksa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_rollables`
--
ALTER TABLE `job_rollables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lesson_task_user`
--
ALTER TABLE `lesson_task_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lesson_upload`
--
ALTER TABLE `lesson_upload`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `package_subscription_chapter`
--
ALTER TABLE `package_subscription_chapter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `package_subscription_package`
--
ALTER TABLE `package_subscription_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payout_royalties`
--
ALTER TABLE `payout_royalties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specialty_areables`
--
ALTER TABLE `specialty_areables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tools_course`
--
ALTER TABLE `tools_course`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_user_tag`
--
ALTER TABLE `user_user_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `watched_lessons`
--
ALTER TABLE `watched_lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `watching_histories`
--
ALTER TABLE `watching_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `watch_history_times`
--
ALTER TABLE `watch_history_times`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `abilities`
--
ALTER TABLE `abilities`
  ADD CONSTRAINT `abilities_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `ability_role`
--
ALTER TABLE `ability_role`
  ADD CONSTRAINT `ability_role_ability_id_foreign` FOREIGN KEY (`ability_id`) REFERENCES `abilities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ability_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `uploads` (`id`),
  ADD CONSTRAINT `admins_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `admin_2fa_tokens`
--
ALTER TABLE `admin_2fa_tokens`
  ADD CONSTRAINT `admin_2fa_tokens_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `areas`
--
ALTER TABLE `areas`
  ADD CONSTRAINT `areas_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `areas_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `uploads` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `articles_article_category_id_foreign` FOREIGN KEY (`article_category_id`) REFERENCES `article_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `articles_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `uploads` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `articles_internal_image_id_foreign` FOREIGN KEY (`internal_image_id`) REFERENCES `uploads` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `article_likes`
--
ALTER TABLE `article_likes`
  ADD CONSTRAINT `article_likes_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `article_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `uploads` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `brand_learn_path`
--
ALTER TABLE `brand_learn_path`
  ADD CONSTRAINT `brand_learn_path_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `brand_learn_path_learn_path_id_foreign` FOREIGN KEY (`learn_path_id`) REFERENCES `learn_path_infos` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `brand_slider`
--
ALTER TABLE `brand_slider`
  ADD CONSTRAINT `brand_slider_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `brand_slider_slider_id_foreign` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `certification_widgets`
--
ALTER TABLE `certification_widgets`
  ADD CONSTRAINT `certification_widgets_certification_id_foreign` FOREIGN KEY (`certification_id`) REFERENCES `courses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `certification_widgets_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `uploads` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `certification_widgets_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `course_categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `challenges`
--
ALTER TABLE `challenges`
  ADD CONSTRAINT `challenges_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `course_categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `chapters`
--
ALTER TABLE `chapters`
  ADD CONSTRAINT `chapters_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chapter_knowledge_assessment_tags`
--
ALTER TABLE `chapter_knowledge_assessment_tags`
  ADD CONSTRAINT `chapter_knowledge_assessment_tags_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chapter_knowledge_assessment_tags_competency_id_foreign` FOREIGN KEY (`competency_id`) REFERENCES `competencies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chapter_knowledge_assessment_tags_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chapter_knowledge_assessment_tags_ksa_id_foreign` FOREIGN KEY (`ksa_id`) REFERENCES `ksas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chapter_knowledge_assessment_tags_speciality_area_id_foreign` FOREIGN KEY (`speciality_area_id`) REFERENCES `specialty_areas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cities_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `uploads` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `commentables`
--
ALTER TABLE `commentables`
  ADD CONSTRAINT `commentables_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `completed_courses`
--
ALTER TABLE `completed_courses`
  ADD CONSTRAINT `completed_courses_certificate_id_foreign` FOREIGN KEY (`certificate_id`) REFERENCES `uploads` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `completed_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `completed_courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `completed_course_percentages`
--
ALTER TABLE `completed_course_percentages`
  ADD CONSTRAINT `completed_course_percentages_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `completed_course_percentages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `contact_uses`
--
ALTER TABLE `contact_uses`
  ADD CONSTRAINT `contact_uses_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `contact_us_subjects` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `contact_uses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `countries`
--
ALTER TABLE `countries`
  ADD CONSTRAINT `countries_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `uploads` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_course_category_id_foreign` FOREIGN KEY (`course_category_id`) REFERENCES `course_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `courses_course_sub_category_id_foreign` FOREIGN KEY (`course_sub_category_id`) REFERENCES `course_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `courses_cover_id_foreign` FOREIGN KEY (`cover_id`) REFERENCES `uploads` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `courses_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `uploads` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `courses_menu_cover_id_foreign` FOREIGN KEY (`menu_cover_id`) REFERENCES `uploads` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `courses_seo_image_id_foreign` FOREIGN KEY (`seo_image_id`) REFERENCES `uploads` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `course_assessments`
--
ALTER TABLE `course_assessments`
  ADD CONSTRAINT `course_assessments_correct_answer_id_foreign` FOREIGN KEY (`correct_answer_id`) REFERENCES `course_assessments_answers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `course_assessments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_assessments_answers`
--
ALTER TABLE `course_assessments_answers`
  ADD CONSTRAINT `course_assessments_answers_course_assessments_id_foreign` FOREIGN KEY (`course_assessments_id`) REFERENCES `course_assessments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_categories`
--
ALTER TABLE `course_categories`
  ADD CONSTRAINT `course_categories_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `uploads` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `cyberq_labs`
--
ALTER TABLE `cyberq_labs`
  ADD CONSTRAINT `cyberq_labs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `course_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cyberq_labs_certification_id_foreign` FOREIGN KEY (`certification_id`) REFERENCES `courses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cyberq_labs_cover_id_foreign` FOREIGN KEY (`cover_id`) REFERENCES `uploads` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cyberq_labs_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `uploads` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cyberq_labs_job_role_id_foreign` FOREIGN KEY (`job_role_id`) REFERENCES `job_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cyberq_labs_specialty_area_id_foreign` FOREIGN KEY (`specialty_area_id`) REFERENCES `specialty_areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cyberq_lab_enrollments`
--
ALTER TABLE `cyberq_lab_enrollments`
  ADD CONSTRAINT `cyberq_lab_enrollments_cyberq_lab_id_foreign` FOREIGN KEY (`cyberq_lab_id`) REFERENCES `cyberq_labs` (`id`),
  ADD CONSTRAINT `cyberq_lab_enrollments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cyberq_lab_enrollments_user_subscription_id_foreign` FOREIGN KEY (`user_subscription_id`) REFERENCES `user_subscriptions` (`id`);

--
-- Constraints for table `cyberq_tokens`
--
ALTER TABLE `cyberq_tokens`
  ADD CONSTRAINT `cyberq_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ecoursewares`
--
ALTER TABLE `ecoursewares`
  ADD CONSTRAINT `ecoursewares_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `course_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ecoursewares_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `uploads` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `exam_vouchers`
--
ALTER TABLE `exam_vouchers`
  ADD CONSTRAINT `exam_vouchers_instruction_id_foreign` FOREIGN KEY (`instruction_id`) REFERENCES `uploads` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `job_role_ksa`
--
ALTER TABLE `job_role_ksa`
  ADD CONSTRAINT `job_role_ksa_job_role_id_foreign` FOREIGN KEY (`job_role_id`) REFERENCES `job_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_role_ksa_ksa_id_foreign` FOREIGN KEY (`ksa_id`) REFERENCES `ksas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ksas`
--
ALTER TABLE `ksas`
  ADD CONSTRAINT `ksas_competency_id_foreign` FOREIGN KEY (`competency_id`) REFERENCES `competencies` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_cyberq_lab_id_foreign` FOREIGN KEY (`cyberq_lab_id`) REFERENCES `cyberq_labs` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `lessons_ecourseware_id_foreign` FOREIGN KEY (`ecourseware_id`) REFERENCES `ecoursewares` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `lessons_exam_voucher_id_foreign` FOREIGN KEY (`exam_voucher_id`) REFERENCES `exam_vouchers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `lesson_vouchers`
--
ALTER TABLE `lesson_vouchers`
  ADD CONSTRAINT `lesson_vouchers_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `lesson_vouchers_exam_voucher_id_foreign` FOREIGN KEY (`exam_voucher_id`) REFERENCES `exam_vouchers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `package_subscription_package`
--
ALTER TABLE `package_subscription_package`
  ADD CONSTRAINT `package_subscription_package_package_subscription_id_foreign` FOREIGN KEY (`package_subscription_id`) REFERENCES `package_subscriptions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE;

--
-- Constraints for table `user_assets`
--
ALTER TABLE `user_assets`
  ADD CONSTRAINT `user_assets_package_subscription_id_foreign` FOREIGN KEY (`package_subscription_id`) REFERENCES `package_subscriptions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_assets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_assets_user_subscription_id_foreign` FOREIGN KEY (`user_subscription_id`) REFERENCES `user_subscriptions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
