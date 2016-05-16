-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:3306
-- Tiempo de generación: 16-05-2016 a las 09:22:31
-- Versión del servidor: 5.6.28
-- Versión de PHP: 5.5.31

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `andresproyect1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acl_classes`
--

CREATE TABLE `acl_classes` (
  `id` int(10) UNSIGNED NOT NULL,
  `class_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acl_entries`
--

CREATE TABLE `acl_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `object_identity_id` int(10) UNSIGNED DEFAULT NULL,
  `security_identity_id` int(10) UNSIGNED NOT NULL,
  `field_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ace_order` smallint(5) UNSIGNED NOT NULL,
  `mask` int(11) NOT NULL,
  `granting` tinyint(1) NOT NULL,
  `granting_strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `audit_success` tinyint(1) NOT NULL,
  `audit_failure` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acl_object_identities`
--

CREATE TABLE `acl_object_identities` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_object_identity_id` int(10) UNSIGNED DEFAULT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `object_identifier` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entries_inheriting` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acl_object_identity_ancestors`
--

CREATE TABLE `acl_object_identity_ancestors` (
  `object_identity_id` int(10) UNSIGNED NOT NULL,
  `ancestor_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acl_security_identities`
--

CREATE TABLE `acl_security_identities` (
  `id` int(10) UNSIGNED NOT NULL,
  `identifier` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `username` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bannercontent_blocks`
--

CREATE TABLE `bannercontent_blocks` (
  `page_id` int(11) NOT NULL,
  `contentblock_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `bannercontent_blocks`
--

INSERT INTO `bannercontent_blocks` (`page_id`, `contentblock_id`) VALUES
(1, 6),
(1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `author` int(11) DEFAULT NULL,
  `introimage` int(11) DEFAULT NULL,
  `bgimage` int(11) DEFAULT NULL,
  `introvideo` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pageOrder` int(11) NOT NULL,
  `showPageTitle` int(11) NOT NULL,
  `publishState` int(11) NOT NULL,
  `pageclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `introtext` longtext COLLATE utf8_unicode_ci,
  `intromediasize` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `introclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pagetype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_last_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `blogs`
--

INSERT INTO `blogs` (`id`, `author`, `introimage`, `bgimage`, `introvideo`, `date`, `title`, `alias`, `pageOrder`, `showPageTitle`, `publishState`, `pageclass`, `description`, `keywords`, `introtext`, `intromediasize`, `introclass`, `pagetype`, `date_last_modified`) VALUES
(1, 1, NULL, NULL, NULL, '2015-05-14', 'Blog Home', 'articles', 99, 1, 1, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing eletra electrify denim vel ports.', NULL, NULL, 'blog_home', '2015-05-14 15:04:11'),
(2, 1, NULL, NULL, NULL, '2015-05-14', 'News', 'news', 99, 1, 1, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing eletra electrify denim vel ports.', NULL, NULL, 'blog_cat_page', '2015-05-14 15:04:11'),
(3, 1, NULL, NULL, NULL, '2015-05-14', 'Events', 'events', 99, 1, 1, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing eletra electrify denim vel ports.', NULL, NULL, 'blog_cat_page', '2015-05-14 15:04:11'),
(4, 1, NULL, NULL, NULL, '2015-05-14', 'Blog Filtered Listing', 'tagged', 99, 1, 1, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing eletra electrify denim vel ports.', NULL, NULL, 'blog_filtered_list', '2015-05-14 15:04:11'),
(5, 1, 5, NULL, NULL, '2015-05-14', 'Test Blog Post 1', 'test-blog-post-1', 99, 1, 1, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing eletra electrify denim vel ports.', NULL, NULL, 'blog_article', '2015-05-14 15:04:11'),
(6, 1, 6, NULL, NULL, '2015-05-14', 'Test Blog Post 2', 'test-blog-post-2', 99, 1, 1, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing eletra electrify denim vel ports.', NULL, NULL, 'blog_article', '2015-05-14 15:04:11'),
(7, 1, 7, NULL, NULL, '2015-05-14', 'Test Blog Post 3', 'test-blog-post-3', 99, 1, 1, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing eletra electrify denim vel ports.', NULL, NULL, 'blog_article', '2015-05-14 15:04:11'),
(8, 1, 8, NULL, NULL, '2015-05-14', 'Test Blog Post 4', 'test-blog-post-4', 99, 1, 1, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing eletra electrify denim vel ports.', NULL, NULL, 'blog_article', '2015-05-14 15:04:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blogs_categories`
--

CREATE TABLE `blogs_categories` (
  `blog_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `blogs_categories`
--

INSERT INTO `blogs_categories` (`blog_id`, `category_id`) VALUES
(5, 2),
(6, 3),
(7, 2),
(8, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blogs_tags`
--

CREATE TABLE `blogs_tags` (
  `blog_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `blogs_tags`
--

INSERT INTO `blogs_tags` (`blog_id`, `tag_id`) VALUES
(5, 1),
(6, 2),
(7, 2),
(8, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blog_bannercontent_blocks`
--

CREATE TABLE `blog_bannercontent_blocks` (
  `blog_id` int(11) NOT NULL,
  `contentblock_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blog_extracontent_blocks`
--

CREATE TABLE `blog_extracontent_blocks` (
  `blog_id` int(11) NOT NULL,
  `contentblock_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blog_maincontent_blocks`
--

CREATE TABLE `blog_maincontent_blocks` (
  `blog_id` int(11) NOT NULL,
  `contentblock_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `blog_maincontent_blocks`
--

INSERT INTO `blog_maincontent_blocks` (`blog_id`, `contentblock_id`) VALUES
(5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blog_modalcontent_blocks`
--

CREATE TABLE `blog_modalcontent_blocks` (
  `blog_id` int(11) NOT NULL,
  `contentblock_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `categoryClass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_last_modified` datetime NOT NULL,
  `categoryIcon` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `title`, `categoryClass`, `date_last_modified`, `categoryIcon`) VALUES
(1, 'Homepage', NULL, '2015-05-14 15:04:10', NULL),
(2, 'News', 'news', '2015-05-14 15:04:10', NULL),
(3, 'Events', 'events', '2015-05-14 15:04:10', NULL),
(4, 'Sample Category', 'featured-category', '2015-05-14 15:04:10', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `classification__category`
--

CREATE TABLE `classification__category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `classification__category`
--

INSERT INTO `classification__category` (`id`, `parent_id`, `context`, `media_id`, `name`, `enabled`, `slug`, `description`, `position`, `created_at`, `updated_at`) VALUES
(1, NULL, 'default', NULL, 'default', 1, 'default', 'Default Media Category', NULL, '2015-05-14 15:04:11', '2015-05-14 15:04:11'),
(2, NULL, 'intro', NULL, 'intro', 1, 'intro', 'Intro Media Category', NULL, '2015-05-14 15:04:11', '2015-05-14 15:04:11'),
(3, NULL, 'bgimage', NULL, 'bgimage', 1, 'bgimage', 'Background Image Media Category', NULL, '2015-05-14 15:04:11', '2015-05-14 15:04:11'),
(4, NULL, 'icons', NULL, 'icons', 1, 'icons', 'Icons Media Category', NULL, '2015-05-14 15:04:11', '2015-05-14 15:04:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `classification__collection`
--

CREATE TABLE `classification__collection` (
  `id` int(11) NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `classification__context`
--

CREATE TABLE `classification__context` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `classification__context`
--

INSERT INTO `classification__context` (`id`, `name`, `enabled`, `created_at`, `updated_at`) VALUES
('bgimage', 'bgimage', 1, '2015-05-14 15:04:11', '2015-05-14 15:04:11'),
('default', 'default', 1, '2015-05-14 15:04:11', '2015-05-14 15:04:11'),
('icons', 'icons', 1, '2015-05-14 15:04:11', '2015-05-14 15:04:11'),
('intro', 'intro', 1, '2015-05-14 15:04:11', '2015-05-14 15:04:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `classification__tag`
--

CREATE TABLE `classification__tag` (
  `id` int(11) NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `commentType` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bottrap` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_last_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`id`, `blog_id`, `title`, `username`, `comment`, `approved`, `created`, `commentType`, `bottrap`, `date_last_modified`) VALUES
(1, 5, 'Sample Comment 1', 'blogger1', 'To make a long story short. You can''t go wrong by choosing Symfony! And no one has ever been fired for using Symfony.', 1, '2015-05-14 15:04:11', 'Blog', NULL, '2015-05-14 15:04:11'),
(2, 5, 'Sample Comment 2', 'blogger2', 'To make a long story short. You can''t go wrong by choosing Symfony! And no one has ever been fired for using Symfony 2.', 1, '2015-05-14 15:04:11', 'Blog', NULL, '2015-05-14 15:04:11'),
(3, 5, 'Sample Comment 3', 'blogger3', 'To make a long story short. You can''t go wrong by choosing Symfony! And no one has ever been fired for using Symfony 3.', 1, '2015-05-14 15:04:11', 'Blog', NULL, '2015-05-14 15:04:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `content_blocks`
--

CREATE TABLE `content_blocks` (
  `id` int(11) NOT NULL,
  `slide` int(11) DEFAULT NULL,
  `vimeo` int(11) DEFAULT NULL,
  `youtube` int(11) DEFAULT NULL,
  `globalblock` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publishedState` int(11) NOT NULL,
  `availability` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `showTitle` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `className` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sizeClass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mediaSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contentType` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `htmlText` longtext COLLATE utf8_unicode_ci,
  `date_last_modified` datetime NOT NULL,
  `fileFile` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `content_blocks`
--

INSERT INTO `content_blocks` (`id`, `slide`, `vimeo`, `youtube`, `globalblock`, `title`, `publishedState`, `availability`, `showTitle`, `ordering`, `className`, `sizeClass`, `mediaSize`, `idName`, `contentType`, `htmlText`, `date_last_modified`, `fileFile`) VALUES
(1, NULL, NULL, NULL, NULL, 'Sample Content Home', 1, 'page', 1, 1, NULL, 'large-12', NULL, NULL, 'html', '<p>Quisque non arcu id ipsum imperdiet ultricies pharetra eu nibh. Etiam eros lectus, ullamcorper et congue in, lobortis sit amet lectus. In fermentum quam in arcu sodales, id varius est placerat. Fusce a dictum mi. Aliquam accumsan diam eget rutrum tincidunt. Nullam massa metus, placerat quis mattis nec</p>', '2015-05-14 15:04:11', NULL),
(2, NULL, NULL, NULL, NULL, 'Sample Content 1', 1, 'page', 1, 1, 'sampleClassname', 'large-12', NULL, 'sampleId', 'html', '<p>Quisque non arcu id ipsum imperdiet ultricies pharetra eu nibh. Etiam eros lectus, ullamcorper et congue in, lobortis sit amet lectus. In fermentum quam in arcu sodales, id varius est placerat. Fusce a dictum mi. Aliquam accumsan diam eget rutrum tincidunt. Nullam massa metus, placerat quis mattis nec</p>', '2015-05-14 15:04:11', NULL),
(3, NULL, NULL, NULL, NULL, 'Sample Content 2', 1, 'page', 1, 2, NULL, 'large-12', NULL, NULL, 'html', '<p>Quisque non arcu id ipsum imperdiet ultricies pharetra eu nibh. Etiam eros lectus, ullamcorper et congue in, lobortis sit amet lectus. In fermentum quam in arcu sodales, id varius est placerat. Fusce a dictum mi. Aliquam accumsan diam eget rutrum tincidunt. Nullam massa metus, placerat quis mattis nec</p>', '2015-05-14 15:04:11', NULL),
(4, NULL, NULL, NULL, NULL, 'Sample Contact Form', 1, 'page', 1, 1, NULL, 'large-12', NULL, NULL, 'contact', NULL, '2015-05-14 15:04:11', NULL),
(5, NULL, NULL, NULL, NULL, 'Sample Blog Content 1', 1, 'page', 1, 1, 'sampleClassname', 'large-12', NULL, 'sampleId', 'html', '<p>Quisque non arcu id ipsum imperdiet ultricies pharetra eu nibh. Etiam eros lectus, ullamcorper et congue in, lobortis sit amet lectus. In fermentum quam in arcu sodales, id varius est placerat. Fusce a dictum mi. Aliquam accumsan diam eget rutrum tincidunt. Nullam massa metus, placerat quis mattis nec</p>', '2015-05-14 15:04:11', NULL),
(6, 1, NULL, NULL, NULL, 'Home Top Banner Slide 1', 1, 'page', 0, 1, NULL, 'large-12', NULL, NULL, 'slide', NULL, '2015-05-14 15:04:11', NULL),
(7, 2, NULL, NULL, NULL, 'Home Top Banner Slide 2', 1, 'page', 0, 2, NULL, 'large-12', NULL, NULL, 'slide', NULL, '2015-05-14 15:04:11', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `content_blocks_images`
--

CREATE TABLE `content_blocks_images` (
  `contentblock_id` int(11) NOT NULL,
  `contentimage_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `content_globalblock`
--

CREATE TABLE `content_globalblock` (
  `id` int(11) NOT NULL,
  `contentblock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `content_images`
--

CREATE TABLE `content_images` (
  `id` int(11) NOT NULL,
  `imagefile` int(11) DEFAULT NULL,
  `imageOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `content_slides`
--

CREATE TABLE `content_slides` (
  `id` int(11) NOT NULL,
  `imagefile` int(11) DEFAULT NULL,
  `imageLinkTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imageLinkURL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `content_slides`
--

INSERT INTO `content_slides` (`id`, `imagefile`, `imageLinkTitle`, `imageLinkURL`) VALUES
(1, 9, 'Slide 1', '/blog/events'),
(2, 10, 'Slide 2', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `extracontent_blocks`
--

CREATE TABLE `extracontent_blocks` (
  `page_id` int(11) NOT NULL,
  `contentblock_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fos_user_group`
--

CREATE TABLE `fos_user_group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fos_user_user`
--

CREATE TABLE `fos_user_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `biography` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `twitter_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `gplus_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `two_step_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bakeFrequency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bakeChoises` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `age` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `children` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `currency_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `addressLine1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `addressLine2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `addressLine3` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `county` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `postcode` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `secret_question_response` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `terms_accepted` tinyint(1) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `secret_question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `userAvatar` int(11) NOT NULL,
  `userHeroImage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fos_user_user`
--

INSERT INTO `fos_user_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `created_at`, `updated_at`, `date_of_birth`, `firstname`, `lastname`, `website`, `biography`, `gender`, `locale`, `timezone`, `phone`, `facebook_uid`, `facebook_name`, `facebook_data`, `twitter_uid`, `twitter_name`, `twitter_data`, `gplus_uid`, `gplus_name`, `gplus_data`, `token`, `two_step_code`, `bakeFrequency`, `sex`, `bakeChoises`, `age`, `children`, `campaign`, `title`, `language`, `currency_code`, `addressLine1`, `addressLine2`, `addressLine3`, `city`, `county`, `postcode`, `country_code`, `mobile`, `secret_question_response`, `terms_accepted`, `confirmed`, `secret_question`, `userAvatar`, `userHeroImage`) VALUES
(1, 'admin', 'admin', 'admin@domain.com', 'admin@domain.com', 1, 'k41zaqgcipwgokogwkgo44kcsgw40s0', 'RDCHjg6DFierHyvxDww6nLKPiN177TdZ9waOuY7o5iD38UnJmch0cSCyyJ/YmoFQkO7E+UryvU7liFQf/sdDpw==', '2016-05-16 09:15:38', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}', 0, NULL, '2015-05-14 15:04:10', '2016-05-16 09:15:38', NULL, NULL, NULL, NULL, NULL, 'u', NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, NULL, NULL, 'N;', NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fos_user_user_group`
--

CREATE TABLE `fos_user_user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maincontent_blocks`
--

CREATE TABLE `maincontent_blocks` (
  `page_id` int(11) NOT NULL,
  `contentblock_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `maincontent_blocks`
--

INSERT INTO `maincontent_blocks` (`page_id`, `contentblock_id`) VALUES
(1, 1),
(5, 4),
(7, 2),
(7, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `media__gallery`
--

CREATE TABLE `media__gallery` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `default_format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `media__gallery_media`
--

CREATE TABLE `media__gallery_media` (
  `id` int(11) NOT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `media__media`
--

CREATE TABLE `media__media` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL,
  `provider_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_status` int(11) NOT NULL,
  `provider_reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_metadata` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `length` decimal(10,0) DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_size` int(11) DEFAULT NULL,
  `copyright` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdn_is_flushable` tinyint(1) DEFAULT NULL,
  `cdn_flush_identifier` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdn_flush_at` datetime DEFAULT NULL,
  `cdn_status` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `media__media`
--

INSERT INTO `media__media` (`id`, `category_id`, `name`, `description`, `enabled`, `provider_name`, `provider_status`, `provider_reference`, `provider_metadata`, `width`, `height`, `length`, `content_type`, `content_size`, `copyright`, `author_name`, `context`, `cdn_is_flushable`, `cdn_flush_identifier`, `cdn_flush_at`, `cdn_status`, `updated_at`, `created_at`) VALUES
(1, 2, 'sample_thumb.jpeg', NULL, 0, 'sonata.media.provider.image', 1, 'sample_thumb.jpeg', '{"filename":"sample_thumb.jpeg"}', 622, 415, NULL, 'image/jpeg', 8043, NULL, NULL, 'intro', NULL, NULL, NULL, NULL, '2015-05-14 15:04:11', '2015-05-14 15:04:11'),
(2, 2, 'sample_thumb.jpeg', NULL, 0, 'sonata.media.provider.image', 1, 'sample_thumb.jpeg', '{"filename":"sample_thumb.jpeg"}', 622, 415, NULL, 'image/jpeg', 8043, NULL, NULL, 'intro', NULL, NULL, NULL, NULL, '2015-05-14 15:04:11', '2015-05-14 15:04:11'),
(3, 2, 'sample_thumb.jpeg', NULL, 0, 'sonata.media.provider.image', 1, 'sample_thumb.jpeg', '{"filename":"sample_thumb.jpeg"}', 622, 415, NULL, 'image/jpeg', 8043, NULL, NULL, 'intro', NULL, NULL, NULL, NULL, '2015-05-14 15:04:11', '2015-05-14 15:04:11'),
(4, 2, 'sample_thumb.jpeg', NULL, 0, 'sonata.media.provider.image', 1, 'sample_thumb.jpeg', '{"filename":"sample_thumb.jpeg"}', 622, 415, NULL, 'image/jpeg', 8043, NULL, NULL, 'intro', NULL, NULL, NULL, NULL, '2015-05-14 15:04:11', '2015-05-14 15:04:11'),
(5, 2, 'sample_thumb.jpeg', NULL, 0, 'sonata.media.provider.image', 1, 'sample_thumb.jpeg', '{"filename":"sample_thumb.jpeg"}', 622, 415, NULL, 'image/jpeg', 8043, NULL, NULL, 'intro', NULL, NULL, NULL, NULL, '2015-05-14 15:04:11', '2015-05-14 15:04:11'),
(6, 2, 'sample_thumb.jpeg', NULL, 0, 'sonata.media.provider.image', 1, 'sample_thumb.jpeg', '{"filename":"sample_thumb.jpeg"}', 622, 415, NULL, 'image/jpeg', 8043, NULL, NULL, 'intro', NULL, NULL, NULL, NULL, '2015-05-14 15:04:11', '2015-05-14 15:04:11'),
(7, 2, 'sample_thumb.jpeg', NULL, 0, 'sonata.media.provider.image', 1, 'sample_thumb.jpeg', '{"filename":"sample_thumb.jpeg"}', 622, 415, NULL, 'image/jpeg', 8043, NULL, NULL, 'intro', NULL, NULL, NULL, NULL, '2015-05-14 15:04:11', '2015-05-14 15:04:11'),
(8, 2, 'sample_thumb.jpeg', NULL, 0, 'sonata.media.provider.image', 1, 'sample_thumb.jpeg', '{"filename":"sample_thumb.jpeg"}', 622, 415, NULL, 'image/jpeg', 8043, NULL, NULL, 'intro', NULL, NULL, NULL, NULL, '2015-05-14 15:04:11', '2015-05-14 15:04:11'),
(9, 3, 'sample_thumb.jpeg', NULL, 0, 'sonata.media.provider.image', 1, 'sample_thumb.jpeg', '{"filename":"sample_thumb.jpeg"}', 622, 415, NULL, 'image/jpeg', 8043, NULL, NULL, 'bgimage', NULL, NULL, NULL, NULL, '2015-05-14 15:04:11', '2015-05-14 15:04:11'),
(10, 3, 'sample_thumb.jpeg', NULL, 0, 'sonata.media.provider.image', 1, 'sample_thumb.jpeg', '{"filename":"sample_thumb.jpeg"}', 622, 415, NULL, 'image/jpeg', 8043, NULL, NULL, 'bgimage', NULL, NULL, NULL, NULL, '2015-05-14 15:04:11', '2015-05-14 15:04:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL,
  `page` int(11) DEFAULT NULL,
  `blog` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menuType` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `externalUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accessLevel` int(11) NOT NULL,
  `parent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menuGroup` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publishState` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `menuUrlExtras` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menuImage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `menu_items`
--

INSERT INTO `menu_items` (`id`, `page`, `blog`, `title`, `menuType`, `route`, `externalUrl`, `accessLevel`, `parent`, `menuGroup`, `publishState`, `ordering`, `menuUrlExtras`, `menuImage`) VALUES
(1, 1, NULL, 'Homepage', 'Page', 'showPage', NULL, 0, '0', 'Main Menu', 1, 0, NULL, NULL),
(2, NULL, 1, 'Blog', 'Blog', 'showPage', NULL, 0, '0', 'Main Menu', 1, 2, NULL, NULL),
(3, NULL, 3, 'Events', 'Blog', 'showPage', NULL, 0, '0', 'Main Menu', 1, 3, NULL, NULL),
(4, NULL, 2, 'News', 'Blog', 'showPage', NULL, 0, '0', 'Main Menu', 1, 4, NULL, NULL),
(5, 8, NULL, 'Sports', 'Page', 'showPage', NULL, 0, '0', 'Main Menu', 1, 5, NULL, NULL),
(6, 7, NULL, 'E-Magazine', 'Page', 'showPage', NULL, 0, '0', 'Main Menu', 1, 6, NULL, NULL),
(7, 5, NULL, 'Contact Us', 'Page', 'showPage', NULL, 0, '0', 'Main Menu', 1, 7, NULL, NULL),
(8, 3, NULL, 'Sitemap', 'Page', 'showPage', NULL, 0, '0', 'Footer Menu', 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalcontent_blocks`
--

CREATE TABLE `modalcontent_blocks` (
  `page_id` int(11) NOT NULL,
  `contentblock_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `author` int(11) DEFAULT NULL,
  `introimage` int(11) DEFAULT NULL,
  `bgimage` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pageOrder` int(11) NOT NULL,
  `showPageTitle` int(11) NOT NULL,
  `publishState` int(11) NOT NULL,
  `pageclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `introtext` longtext COLLATE utf8_unicode_ci,
  `intromediasize` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `introclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pagetype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_last_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pages`
--

INSERT INTO `pages` (`id`, `author`, `introimage`, `bgimage`, `date`, `title`, `alias`, `pageOrder`, `showPageTitle`, `publishState`, `pageclass`, `description`, `keywords`, `introtext`, `intromediasize`, `introclass`, `pagetype`, `date_last_modified`) VALUES
(1, 1, NULL, NULL, '2015-05-14', 'Home', 'index', 99, 1, 1, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing eletra electrify denim vel ports.', NULL, NULL, 'homepage', '2015-05-14 15:04:11'),
(2, 1, NULL, NULL, '2015-05-14', '404 Error Page', '404', 99, 1, 1, NULL, NULL, NULL, '', NULL, NULL, '404', '2015-05-14 15:04:11'),
(3, 1, NULL, NULL, '2015-05-14', 'Sitemap', 'site-map', 99, 1, 1, NULL, NULL, NULL, '', NULL, NULL, 'sitemap', '2015-05-14 15:04:11'),
(4, 1, NULL, NULL, '2015-05-14', 'Page Filtered Listing', 'tagged', 99, 1, 1, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing eletra electrify denim vel ports.', NULL, NULL, 'page_tag_list', '2015-05-14 15:04:11'),
(5, 1, NULL, NULL, '2015-05-14', 'Contact Page', 'contact-page', 99, 1, 1, NULL, NULL, NULL, '', NULL, NULL, 'contact', '2015-05-14 15:04:11'),
(6, 1, NULL, NULL, '2015-05-14', 'User Profile Page', 'user-profile', 99, 1, 1, NULL, NULL, NULL, '', NULL, NULL, 'user_profile', '2015-05-14 15:04:11'),
(7, 1, 1, NULL, '2015-05-14', 'Test Page 1', 'test-page-1', 99, 1, 1, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing eletra electrify denim vel ports.', NULL, NULL, 'one_columned', '2015-05-14 15:04:11'),
(8, 1, 2, NULL, '2015-05-14', 'Test Page 2', 'test-page-2', 99, 1, 1, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing eletra electrify denim vel ports.', NULL, NULL, 'two_columned', '2015-05-14 15:04:11'),
(9, 1, 3, NULL, '2015-05-14', 'Test Page 3', 'test-page-3', 99, 1, 1, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing eletra electrify denim vel ports.', NULL, NULL, 'three_columned', '2015-05-14 15:04:11'),
(10, 1, 4, NULL, '2015-05-14', 'Test Page 4', 'test-page-4', 99, 1, 1, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing eletra electrify denim vel ports.', NULL, NULL, 'one_columned', '2015-05-14 15:04:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pages_categories`
--

CREATE TABLE `pages_categories` (
  `page_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pages_categories`
--

INSERT INTO `pages_categories` (`page_id`, `category_id`) VALUES
(1, 1),
(4, 4),
(7, 1),
(7, 4),
(8, 1),
(8, 4),
(9, 1),
(10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pages_tags`
--

CREATE TABLE `pages_tags` (
  `page_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pages_tags`
--

INSERT INTO `pages_tags` (`page_id`, `tag_id`) VALUES
(4, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secondarycontent_blocks`
--

CREATE TABLE `secondarycontent_blocks` (
  `page_id` int(11) NOT NULL,
  `contentblock_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `session`
--

CREATE TABLE `session` (
  `session_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `session_value` longblob NOT NULL,
  `session_time` int(11) NOT NULL,
  `sess_lifetime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `session`
--

INSERT INTO `session` (`session_id`, `session_value`, `session_time`, `sess_lifetime`) VALUES
('1tldeg8c09er33at2g8j8ni3h4', 0x5f7366325f617474726962757465737c613a353a7b733a32373a225f73656375726974792e61646d696e2e7461726765745f70617468223b733a34383a22687474703a2f2f6c6f63616c686f73743a38312f736f6e6174612f7765622f6170705f6465762e7068702f61646d696e223b733a31383a225f637372662f61757468656e746963617465223b733a34333a22424758766e43456c316942664c3568476a57637054634b7554353775317532736f3151665878766566454d223b733a31343a225f73656375726974795f75736572223b733a3737393a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3639313a7b613a333a7b693a303b4e3b693a313b733a353a2261646d696e223b693a323b733a3635303a22613a343a7b693a303b433a34313a224170706c69636174696f6e5c536f6e6174615c5573657242756e646c655c456e746974795c55736572223a3239333a7b613a31333a7b693a303b733a38383a22524443486a6736444669657248797678447777366e4c4b50694e31373754645a3977614f7559376f3569443338556e4a6d63683063534379794a2f596d6f46516b4f37452b5572797655376c694651662f73644470773d3d223b693a313b733a33313a226b34317a61716763697077676f6b6f67776b676f34346b6373677734307330223b693a323b733a353a2261646d696e223b693a333b733a353a2261646d696e223b693a343b623a303b693a353b623a303b693a363b623a303b693a373b623a313b693a383b693a313b693a393b4e3b693a31303b4e3b693a31313b733a31363a2261646d696e40646f6d61696e2e636f6d223b693a31323b733a31363a2261646d696e40646f6d61696e2e636f6d223b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31363a22524f4c455f53555045525f41444d494e223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b733a31383a225f637372662f736f6e6174612e6261746368223b733a34333a226a61582d4666575a484b6668434b4f6a62594f693266726f734d506b6e7a667a516d344f47766a51513651223b733a32303a225f637372662f7335373339663266633764366430223b733a34333a222d395848503344396d4157704e516f78416f3855434f5a70534d564539763136352d7a566b324937627538223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313436333431353535323b733a313a2263223b693a313436333431353333383b733a313a226c223b733a353a223433323030223b7d, 1463415552, 1440);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `metaDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `metaKeywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fromTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `websiteTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `websiteTwitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `websiteAuthor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `useWebsiteAuthor` tinyint(1) NOT NULL,
  `enableGoogleAnalytics` tinyint(1) NOT NULL,
  `googleAnalyticsId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emailSender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emailRecepient` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemsPerPage` int(11) NOT NULL,
  `blogItemsPerPage` int(11) NOT NULL,
  `activateHttpCache` tinyint(1) NOT NULL,
  `activateSettings` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `metaDescription`, `metaKeywords`, `fromTitle`, `websiteTitle`, `websiteTwitter`, `websiteAuthor`, `useWebsiteAuthor`, `enableGoogleAnalytics`, `googleAnalyticsId`, `emailSender`, `emailRecepient`, `itemsPerPage`, `blogItemsPerPage`, `activateHttpCache`, `activateSettings`) VALUES
(1, 'Default Meta Description', 'Default Meta Keywords', 'Owner', 'Website Title', NULL, 'Author', 1, 0, 'UA-XXX-XXXXX', 'george@bardis.info', 'george@bardis.info', 2, 2, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tagCategory` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_last_modified` datetime NOT NULL,
  `tagIcon` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tags`
--

INSERT INTO `tags` (`id`, `title`, `tagCategory`, `date_last_modified`, `tagIcon`) VALUES
(1, 'Sample Tag 1', NULL, '2015-05-14 15:04:11', NULL),
(2, 'Sample Tag 2', 'blog', '2015-05-14 15:04:11', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `timeline__action`
--

CREATE TABLE `timeline__action` (
  `id` int(11) NOT NULL,
  `verb` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status_current` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status_wanted` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `duplicate_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duplicate_priority` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `timeline__action_component`
--

CREATE TABLE `timeline__action_component` (
  `id` int(11) NOT NULL,
  `action_id` int(11) DEFAULT NULL,
  `component_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `timeline__component`
--

CREATE TABLE `timeline__component` (
  `id` int(11) NOT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `identifier` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `timeline__component`
--

INSERT INTO `timeline__component` (`id`, `model`, `identifier`, `hash`) VALUES
(1, 'Application\\Sonata\\UserBundle\\Entity\\User', 's:1:"1";', 'Application\\Sonata\\UserBundle\\Entity\\User#s:1:"1";');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `timeline__timeline`
--

CREATE TABLE `timeline__timeline` (
  `id` int(11) NOT NULL,
  `action_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acl_classes`
--
ALTER TABLE `acl_classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_69DD750638A36066` (`class_type`);

--
-- Indices de la tabla `acl_entries`
--
ALTER TABLE `acl_entries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_46C8B806EA000B103D9AB4A64DEF17BCE4289BF4` (`class_id`,`object_identity_id`,`field_name`,`ace_order`),
  ADD KEY `IDX_46C8B806EA000B103D9AB4A6DF9183C9` (`class_id`,`object_identity_id`,`security_identity_id`),
  ADD KEY `IDX_46C8B806EA000B10` (`class_id`),
  ADD KEY `IDX_46C8B8063D9AB4A6` (`object_identity_id`),
  ADD KEY `IDX_46C8B806DF9183C9` (`security_identity_id`);

--
-- Indices de la tabla `acl_object_identities`
--
ALTER TABLE `acl_object_identities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9407E5494B12AD6EA000B10` (`object_identifier`,`class_id`),
  ADD KEY `IDX_9407E54977FA751A` (`parent_object_identity_id`);

--
-- Indices de la tabla `acl_object_identity_ancestors`
--
ALTER TABLE `acl_object_identity_ancestors`
  ADD PRIMARY KEY (`object_identity_id`,`ancestor_id`),
  ADD KEY `IDX_825DE2993D9AB4A6` (`object_identity_id`),
  ADD KEY `IDX_825DE299C671CEA1` (`ancestor_id`);

--
-- Indices de la tabla `acl_security_identities`
--
ALTER TABLE `acl_security_identities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8835EE78772E836AF85E0677` (`identifier`,`username`);

--
-- Indices de la tabla `bannercontent_blocks`
--
ALTER TABLE `bannercontent_blocks`
  ADD PRIMARY KEY (`page_id`,`contentblock_id`),
  ADD KEY `IDX_F4D586C4663E4` (`page_id`),
  ADD KEY `IDX_F4D58642ADBAC2` (`contentblock_id`);

--
-- Indices de la tabla `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_F41BCA70E16C6B94` (`alias`),
  ADD UNIQUE KEY `UNIQ_F41BCA70F3890D5F` (`introimage`),
  ADD UNIQUE KEY `UNIQ_F41BCA7097AB4E12` (`bgimage`),
  ADD UNIQUE KEY `UNIQ_F41BCA704A73D32C` (`introvideo`),
  ADD KEY `IDX_F41BCA70BDAFD8C8` (`author`);

--
-- Indices de la tabla `blogs_categories`
--
ALTER TABLE `blogs_categories`
  ADD PRIMARY KEY (`blog_id`,`category_id`),
  ADD KEY `IDX_9DB3BC97DAE07E97` (`blog_id`),
  ADD KEY `IDX_9DB3BC9712469DE2` (`category_id`);

--
-- Indices de la tabla `blogs_tags`
--
ALTER TABLE `blogs_tags`
  ADD PRIMARY KEY (`blog_id`,`tag_id`),
  ADD KEY `IDX_B21862B8DAE07E97` (`blog_id`),
  ADD KEY `IDX_B21862B8BAD26311` (`tag_id`);

--
-- Indices de la tabla `blog_bannercontent_blocks`
--
ALTER TABLE `blog_bannercontent_blocks`
  ADD PRIMARY KEY (`blog_id`,`contentblock_id`),
  ADD KEY `IDX_BBBD8485DAE07E97` (`blog_id`),
  ADD KEY `IDX_BBBD848542ADBAC2` (`contentblock_id`);

--
-- Indices de la tabla `blog_extracontent_blocks`
--
ALTER TABLE `blog_extracontent_blocks`
  ADD PRIMARY KEY (`blog_id`,`contentblock_id`),
  ADD KEY `IDX_D0FE99C6DAE07E97` (`blog_id`),
  ADD KEY `IDX_D0FE99C642ADBAC2` (`contentblock_id`);

--
-- Indices de la tabla `blog_maincontent_blocks`
--
ALTER TABLE `blog_maincontent_blocks`
  ADD PRIMARY KEY (`blog_id`,`contentblock_id`),
  ADD KEY `IDX_1FB7CF4EDAE07E97` (`blog_id`),
  ADD KEY `IDX_1FB7CF4E42ADBAC2` (`contentblock_id`);

--
-- Indices de la tabla `blog_modalcontent_blocks`
--
ALTER TABLE `blog_modalcontent_blocks`
  ADD PRIMARY KEY (`blog_id`,`contentblock_id`),
  ADD KEY `IDX_3262B322DAE07E97` (`blog_id`),
  ADD KEY `IDX_3262B32242ADBAC2` (`contentblock_id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_3AF34668AD0F3245` (`categoryIcon`);

--
-- Indices de la tabla `classification__category`
--
ALTER TABLE `classification__category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_43629B36727ACA70` (`parent_id`),
  ADD KEY `IDX_43629B36E25D857E` (`context`),
  ADD KEY `IDX_43629B36EA9FDD75` (`media_id`);

--
-- Indices de la tabla `classification__collection`
--
ALTER TABLE `classification__collection`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag_collection` (`slug`,`context`),
  ADD KEY `IDX_A406B56AE25D857E` (`context`),
  ADD KEY `IDX_A406B56AEA9FDD75` (`media_id`);

--
-- Indices de la tabla `classification__context`
--
ALTER TABLE `classification__context`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `classification__tag`
--
ALTER TABLE `classification__tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag_context` (`slug`,`context`),
  ADD KEY `IDX_CA57A1C7E25D857E` (`context`);

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5F9E962ADAE07E97` (`blog_id`);

--
-- Indices de la tabla `content_blocks`
--
ALTER TABLE `content_blocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_A6DBE5D472EFEE62` (`slide`),
  ADD UNIQUE KEY `UNIQ_A6DBE5D44E850E4D` (`fileFile`),
  ADD UNIQUE KEY `UNIQ_A6DBE5D47316E1A3` (`vimeo`),
  ADD UNIQUE KEY `UNIQ_A6DBE5D4F0789934` (`youtube`),
  ADD UNIQUE KEY `UNIQ_A6DBE5D4DF69D755` (`globalblock`);

--
-- Indices de la tabla `content_blocks_images`
--
ALTER TABLE `content_blocks_images`
  ADD PRIMARY KEY (`contentblock_id`,`contentimage_id`),
  ADD KEY `IDX_960CFC1F42ADBAC2` (`contentblock_id`),
  ADD KEY `IDX_960CFC1F96E51DA3` (`contentimage_id`);

--
-- Indices de la tabla `content_globalblock`
--
ALTER TABLE `content_globalblock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8C437DD3135C0AFC` (`contentblock`);

--
-- Indices de la tabla `content_images`
--
ALTER TABLE `content_images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8829CEC6991EFFB9` (`imagefile`);

--
-- Indices de la tabla `content_slides`
--
ALTER TABLE `content_slides`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D0F6503D991EFFB9` (`imagefile`);

--
-- Indices de la tabla `extracontent_blocks`
--
ALTER TABLE `extracontent_blocks`
  ADD PRIMARY KEY (`page_id`,`contentblock_id`),
  ADD KEY `IDX_92E89973C4663E4` (`page_id`),
  ADD KEY `IDX_92E8997342ADBAC2` (`contentblock_id`);

--
-- Indices de la tabla `fos_user_group`
--
ALTER TABLE `fos_user_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_583D1F3E5E237E06` (`name`);

--
-- Indices de la tabla `fos_user_user`
--
ALTER TABLE `fos_user_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C560D76192FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_C560D761A0D96FBF` (`email_canonical`);

--
-- Indices de la tabla `fos_user_user_group`
--
ALTER TABLE `fos_user_user_group`
  ADD PRIMARY KEY (`user_id`,`group_id`),
  ADD KEY `IDX_B3C77447A76ED395` (`user_id`),
  ADD KEY `IDX_B3C77447FE54D947` (`group_id`);

--
-- Indices de la tabla `maincontent_blocks`
--
ALTER TABLE `maincontent_blocks`
  ADD PRIMARY KEY (`page_id`,`contentblock_id`),
  ADD KEY `IDX_BB2F1667C4663E4` (`page_id`),
  ADD KEY `IDX_BB2F166742ADBAC2` (`contentblock_id`);

--
-- Indices de la tabla `media__gallery`
--
ALTER TABLE `media__gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `media__gallery_media`
--
ALTER TABLE `media__gallery_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_80D4C5414E7AF8F` (`gallery_id`),
  ADD KEY `IDX_80D4C541EA9FDD75` (`media_id`);

--
-- Indices de la tabla `media__media`
--
ALTER TABLE `media__media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5C6DD74E12469DE2` (`category_id`);

--
-- Indices de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_70B2CA2A9196AB0E` (`menuImage`),
  ADD KEY `IDX_70B2CA2A140AB620` (`page`),
  ADD KEY `IDX_70B2CA2AC0155143` (`blog`);

--
-- Indices de la tabla `modalcontent_blocks`
--
ALTER TABLE `modalcontent_blocks`
  ADD PRIMARY KEY (`page_id`,`contentblock_id`),
  ADD KEY `IDX_7074B397C4663E4` (`page_id`),
  ADD KEY `IDX_7074B39742ADBAC2` (`contentblock_id`);

--
-- Indices de la tabla `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2074E575E16C6B94` (`alias`),
  ADD UNIQUE KEY `UNIQ_2074E575F3890D5F` (`introimage`),
  ADD UNIQUE KEY `UNIQ_2074E57597AB4E12` (`bgimage`),
  ADD KEY `IDX_2074E575BDAFD8C8` (`author`);

--
-- Indices de la tabla `pages_categories`
--
ALTER TABLE `pages_categories`
  ADD PRIMARY KEY (`page_id`,`category_id`),
  ADD KEY `IDX_533F7E1BC4663E4` (`page_id`),
  ADD KEY `IDX_533F7E1B12469DE2` (`category_id`);

--
-- Indices de la tabla `pages_tags`
--
ALTER TABLE `pages_tags`
  ADD PRIMARY KEY (`page_id`,`tag_id`),
  ADD KEY `IDX_2476DEA6C4663E4` (`page_id`),
  ADD KEY `IDX_2476DEA6BAD26311` (`tag_id`);

--
-- Indices de la tabla `secondarycontent_blocks`
--
ALTER TABLE `secondarycontent_blocks`
  ADD PRIMARY KEY (`page_id`,`contentblock_id`),
  ADD KEY `IDX_F8B56AB4C4663E4` (`page_id`),
  ADD KEY `IDX_F8B56AB442ADBAC2` (`contentblock_id`);

--
-- Indices de la tabla `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6FBC94268913051D` (`tagIcon`);

--
-- Indices de la tabla `timeline__action`
--
ALTER TABLE `timeline__action`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `timeline__action_component`
--
ALTER TABLE `timeline__action_component`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6ACD1B169D32F035` (`action_id`),
  ADD KEY `IDX_6ACD1B16E2ABAFFF` (`component_id`);

--
-- Indices de la tabla `timeline__component`
--
ALTER TABLE `timeline__component`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1B2F01CDD1B862B8` (`hash`);

--
-- Indices de la tabla `timeline__timeline`
--
ALTER TABLE `timeline__timeline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FFBC6AD59D32F035` (`action_id`),
  ADD KEY `IDX_FFBC6AD523EDC87` (`subject_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acl_classes`
--
ALTER TABLE `acl_classes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `acl_entries`
--
ALTER TABLE `acl_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `acl_object_identities`
--
ALTER TABLE `acl_object_identities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `acl_security_identities`
--
ALTER TABLE `acl_security_identities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `classification__category`
--
ALTER TABLE `classification__category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `classification__collection`
--
ALTER TABLE `classification__collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `classification__tag`
--
ALTER TABLE `classification__tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `content_blocks`
--
ALTER TABLE `content_blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `content_globalblock`
--
ALTER TABLE `content_globalblock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `content_images`
--
ALTER TABLE `content_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `content_slides`
--
ALTER TABLE `content_slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `fos_user_group`
--
ALTER TABLE `fos_user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `fos_user_user`
--
ALTER TABLE `fos_user_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `media__gallery`
--
ALTER TABLE `media__gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `media__gallery_media`
--
ALTER TABLE `media__gallery_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `media__media`
--
ALTER TABLE `media__media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `timeline__action`
--
ALTER TABLE `timeline__action`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `timeline__action_component`
--
ALTER TABLE `timeline__action_component`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `timeline__component`
--
ALTER TABLE `timeline__component`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `timeline__timeline`
--
ALTER TABLE `timeline__timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acl_entries`
--
ALTER TABLE `acl_entries`
  ADD CONSTRAINT `FK_46C8B8063D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_46C8B806DF9183C9` FOREIGN KEY (`security_identity_id`) REFERENCES `acl_security_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_46C8B806EA000B10` FOREIGN KEY (`class_id`) REFERENCES `acl_classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `acl_object_identities`
--
ALTER TABLE `acl_object_identities`
  ADD CONSTRAINT `FK_9407E54977FA751A` FOREIGN KEY (`parent_object_identity_id`) REFERENCES `acl_object_identities` (`id`);

--
-- Filtros para la tabla `acl_object_identity_ancestors`
--
ALTER TABLE `acl_object_identity_ancestors`
  ADD CONSTRAINT `FK_825DE2993D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_825DE299C671CEA1` FOREIGN KEY (`ancestor_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `bannercontent_blocks`
--
ALTER TABLE `bannercontent_blocks`
  ADD CONSTRAINT `FK_F4D58642ADBAC2` FOREIGN KEY (`contentblock_id`) REFERENCES `content_blocks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_F4D586C4663E4` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `FK_F41BCA704A73D32C` FOREIGN KEY (`introvideo`) REFERENCES `media__media` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_F41BCA7097AB4E12` FOREIGN KEY (`bgimage`) REFERENCES `media__media` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_F41BCA70BDAFD8C8` FOREIGN KEY (`author`) REFERENCES `fos_user_user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_F41BCA70F3890D5F` FOREIGN KEY (`introimage`) REFERENCES `media__media` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `blogs_categories`
--
ALTER TABLE `blogs_categories`
  ADD CONSTRAINT `FK_9DB3BC9712469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_9DB3BC97DAE07E97` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `blogs_tags`
--
ALTER TABLE `blogs_tags`
  ADD CONSTRAINT `FK_B21862B8BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B21862B8DAE07E97` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `blog_bannercontent_blocks`
--
ALTER TABLE `blog_bannercontent_blocks`
  ADD CONSTRAINT `FK_BBBD848542ADBAC2` FOREIGN KEY (`contentblock_id`) REFERENCES `content_blocks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_BBBD8485DAE07E97` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `blog_extracontent_blocks`
--
ALTER TABLE `blog_extracontent_blocks`
  ADD CONSTRAINT `FK_D0FE99C642ADBAC2` FOREIGN KEY (`contentblock_id`) REFERENCES `content_blocks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D0FE99C6DAE07E97` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `blog_maincontent_blocks`
--
ALTER TABLE `blog_maincontent_blocks`
  ADD CONSTRAINT `FK_1FB7CF4E42ADBAC2` FOREIGN KEY (`contentblock_id`) REFERENCES `content_blocks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1FB7CF4EDAE07E97` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `blog_modalcontent_blocks`
--
ALTER TABLE `blog_modalcontent_blocks`
  ADD CONSTRAINT `FK_3262B32242ADBAC2` FOREIGN KEY (`contentblock_id`) REFERENCES `content_blocks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_3262B322DAE07E97` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `FK_3AF34668AD0F3245` FOREIGN KEY (`categoryIcon`) REFERENCES `media__media` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `classification__category`
--
ALTER TABLE `classification__category`
  ADD CONSTRAINT `FK_43629B36727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `classification__category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_43629B36E25D857E` FOREIGN KEY (`context`) REFERENCES `classification__context` (`id`),
  ADD CONSTRAINT `FK_43629B36EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media__media` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `classification__collection`
--
ALTER TABLE `classification__collection`
  ADD CONSTRAINT `FK_A406B56AE25D857E` FOREIGN KEY (`context`) REFERENCES `classification__context` (`id`),
  ADD CONSTRAINT `FK_A406B56AEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media__media` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `classification__tag`
--
ALTER TABLE `classification__tag`
  ADD CONSTRAINT `FK_CA57A1C7E25D857E` FOREIGN KEY (`context`) REFERENCES `classification__context` (`id`);

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_5F9E962ADAE07E97` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`);

--
-- Filtros para la tabla `content_blocks`
--
ALTER TABLE `content_blocks`
  ADD CONSTRAINT `FK_A6DBE5D44E850E4D` FOREIGN KEY (`fileFile`) REFERENCES `media__media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A6DBE5D472EFEE62` FOREIGN KEY (`slide`) REFERENCES `content_slides` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A6DBE5D47316E1A3` FOREIGN KEY (`vimeo`) REFERENCES `media__media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A6DBE5D4DF69D755` FOREIGN KEY (`globalblock`) REFERENCES `content_globalblock` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A6DBE5D4F0789934` FOREIGN KEY (`youtube`) REFERENCES `media__media` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `content_blocks_images`
--
ALTER TABLE `content_blocks_images`
  ADD CONSTRAINT `FK_960CFC1F42ADBAC2` FOREIGN KEY (`contentblock_id`) REFERENCES `content_blocks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_960CFC1F96E51DA3` FOREIGN KEY (`contentimage_id`) REFERENCES `content_images` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `content_globalblock`
--
ALTER TABLE `content_globalblock`
  ADD CONSTRAINT `FK_8C437DD3135C0AFC` FOREIGN KEY (`contentblock`) REFERENCES `content_blocks` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `content_images`
--
ALTER TABLE `content_images`
  ADD CONSTRAINT `FK_8829CEC6991EFFB9` FOREIGN KEY (`imagefile`) REFERENCES `media__media` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `content_slides`
--
ALTER TABLE `content_slides`
  ADD CONSTRAINT `FK_D0F6503D991EFFB9` FOREIGN KEY (`imagefile`) REFERENCES `media__media` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `extracontent_blocks`
--
ALTER TABLE `extracontent_blocks`
  ADD CONSTRAINT `FK_92E8997342ADBAC2` FOREIGN KEY (`contentblock_id`) REFERENCES `content_blocks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_92E89973C4663E4` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `fos_user_user_group`
--
ALTER TABLE `fos_user_user_group`
  ADD CONSTRAINT `FK_B3C77447A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B3C77447FE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_user_group` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `maincontent_blocks`
--
ALTER TABLE `maincontent_blocks`
  ADD CONSTRAINT `FK_BB2F166742ADBAC2` FOREIGN KEY (`contentblock_id`) REFERENCES `content_blocks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_BB2F1667C4663E4` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `media__gallery_media`
--
ALTER TABLE `media__gallery_media`
  ADD CONSTRAINT `FK_80D4C5414E7AF8F` FOREIGN KEY (`gallery_id`) REFERENCES `media__gallery` (`id`),
  ADD CONSTRAINT `FK_80D4C541EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media__media` (`id`);

--
-- Filtros para la tabla `media__media`
--
ALTER TABLE `media__media`
  ADD CONSTRAINT `FK_5C6DD74E12469DE2` FOREIGN KEY (`category_id`) REFERENCES `classification__category` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `FK_70B2CA2A140AB620` FOREIGN KEY (`page`) REFERENCES `pages` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_70B2CA2A9196AB0E` FOREIGN KEY (`menuImage`) REFERENCES `media__media` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_70B2CA2AC0155143` FOREIGN KEY (`blog`) REFERENCES `blogs` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `modalcontent_blocks`
--
ALTER TABLE `modalcontent_blocks`
  ADD CONSTRAINT `FK_7074B39742ADBAC2` FOREIGN KEY (`contentblock_id`) REFERENCES `content_blocks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_7074B397C4663E4` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `FK_2074E57597AB4E12` FOREIGN KEY (`bgimage`) REFERENCES `media__media` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_2074E575BDAFD8C8` FOREIGN KEY (`author`) REFERENCES `fos_user_user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_2074E575F3890D5F` FOREIGN KEY (`introimage`) REFERENCES `media__media` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `pages_categories`
--
ALTER TABLE `pages_categories`
  ADD CONSTRAINT `FK_533F7E1B12469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_533F7E1BC4663E4` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pages_tags`
--
ALTER TABLE `pages_tags`
  ADD CONSTRAINT `FK_2476DEA6BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2476DEA6C4663E4` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `secondarycontent_blocks`
--
ALTER TABLE `secondarycontent_blocks`
  ADD CONSTRAINT `FK_F8B56AB442ADBAC2` FOREIGN KEY (`contentblock_id`) REFERENCES `content_blocks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_F8B56AB4C4663E4` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `FK_6FBC94268913051D` FOREIGN KEY (`tagIcon`) REFERENCES `media__media` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `timeline__action_component`
--
ALTER TABLE `timeline__action_component`
  ADD CONSTRAINT `FK_6ACD1B169D32F035` FOREIGN KEY (`action_id`) REFERENCES `timeline__action` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6ACD1B16E2ABAFFF` FOREIGN KEY (`component_id`) REFERENCES `timeline__component` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `timeline__timeline`
--
ALTER TABLE `timeline__timeline`
  ADD CONSTRAINT `FK_FFBC6AD523EDC87` FOREIGN KEY (`subject_id`) REFERENCES `timeline__component` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_FFBC6AD59D32F035` FOREIGN KEY (`action_id`) REFERENCES `timeline__action` (`id`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
