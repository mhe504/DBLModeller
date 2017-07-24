-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: refbase
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deleted`
--

DROP TABLE IF EXISTS `deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleted` (
  `author` text,
  `address` text,
  `corporate_author` varchar(255) DEFAULT NULL,
  `first_author` varchar(100) DEFAULT NULL,
  `author_count` tinyint(3) unsigned DEFAULT NULL,
  `title` text,
  `orig_title` text,
  `publication` varchar(255) DEFAULT NULL,
  `abbrev_journal` varchar(100) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `volume` varchar(50) DEFAULT NULL,
  `volume_numeric` smallint(5) unsigned DEFAULT NULL,
  `issue` varchar(50) DEFAULT NULL,
  `pages` varchar(50) DEFAULT NULL,
  `first_page` mediumint(8) unsigned DEFAULT NULL,
  `keywords` text,
  `abstract` text,
  `edition` varchar(50) DEFAULT NULL,
  `editor` text,
  `publisher` varchar(255) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `MEDIUM` varchar(50) DEFAULT NULL,
  `series_editor` text,
  `series_title` text,
  `abbrev_series_title` varchar(100) DEFAULT NULL,
  `series_volume` varchar(50) DEFAULT NULL,
  `series_volume_numeric` smallint(5) unsigned DEFAULT NULL,
  `series_issue` varchar(50) DEFAULT NULL,
  `issn` varchar(100) DEFAULT NULL,
  `isbn` varchar(100) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `summary_language` varchar(100) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `TYPE` varchar(100) DEFAULT NULL,
  `thesis` enum('Bachelor''s thesis','Honours thesis','Master''s thesis','Ph.D. thesis','Diploma thesis','Doctoral thesis','Habilitation thesis') DEFAULT NULL,
  `expedition` varchar(255) DEFAULT NULL,
  `doi` varchar(100) DEFAULT NULL,
  `conference` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `call_number` text,
  `location` text,
  `contribution_id` varchar(100) DEFAULT NULL,
  `online_publication` enum('no','yes') NOT NULL DEFAULT 'no',
  `online_citation` varchar(255) DEFAULT NULL,
  `FILE` varchar(255) DEFAULT NULL,
  `notes` text,
  `serial` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `orig_record` mediumint(9) DEFAULT NULL,
  `approved` enum('no','yes') NOT NULL DEFAULT 'no',
  `created_date` date DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_time` time DEFAULT NULL,
  `modified_by` varchar(100) DEFAULT NULL,
  `version` mediumint(8) unsigned DEFAULT '1',
  `deleted_date` date DEFAULT NULL,
  `deleted_time` time DEFAULT NULL,
  `deleted_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`serial`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `depends`
--

DROP TABLE IF EXISTS `depends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depends` (
  `depends_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `depends_external` varchar(100) DEFAULT NULL,
  `depends_enabled` enum('true','false') NOT NULL DEFAULT 'true',
  `depends_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`depends_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formats`
--

DROP TABLE IF EXISTS `formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formats` (
  `format_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `format_name` varchar(100) DEFAULT NULL,
  `format_type` enum('export','import','cite') NOT NULL DEFAULT 'export',
  `format_enabled` enum('true','false') NOT NULL DEFAULT 'true',
  `format_spec` varchar(255) DEFAULT NULL,
  `order_by` varchar(25) DEFAULT NULL,
  `depends_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`format_id`),
  KEY `format_name` (`format_name`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `language_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `language_name` varchar(50) DEFAULT NULL,
  `language_enabled` enum('true','false') NOT NULL DEFAULT 'true',
  `order_by` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`language_id`),
  KEY `language_name` (`language_name`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queries` (
  `query_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `query_name` varchar(255) DEFAULT NULL,
  `display_type` varchar(25) DEFAULT NULL,
  `view_type` varchar(25) DEFAULT NULL,
  `query` text,
  `show_query` tinyint(3) unsigned DEFAULT NULL,
  `show_links` tinyint(3) unsigned DEFAULT NULL,
  `show_rows` mediumint(8) unsigned DEFAULT NULL,
  `cite_style_selector` varchar(50) DEFAULT NULL,
  `cite_order` varchar(25) DEFAULT NULL,
  `last_execution` datetime DEFAULT NULL,
  PRIMARY KEY (`query_id`),
  KEY `user_id` (`user_id`,`query_name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `refs`
--

DROP TABLE IF EXISTS `refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refs` (
  `author` text,
  `address` text,
  `corporate_author` varchar(255) DEFAULT NULL,
  `first_author` varchar(100) DEFAULT NULL,
  `author_count` tinyint(3) unsigned DEFAULT NULL,
  `title` text,
  `orig_title` text,
  `publication` varchar(255) DEFAULT NULL,
  `abbrev_journal` varchar(100) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `volume` varchar(50) DEFAULT NULL,
  `volume_numeric` smallint(5) unsigned DEFAULT NULL,
  `issue` varchar(50) DEFAULT NULL,
  `pages` varchar(50) DEFAULT NULL,
  `first_page` mediumint(8) unsigned DEFAULT NULL,
  `keywords` text,
  `abstract` text,
  `edition` varchar(50) DEFAULT NULL,
  `editor` text,
  `publisher` varchar(255) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `MEDIUM` varchar(50) DEFAULT NULL,
  `series_editor` text,
  `series_title` text,
  `abbrev_series_title` varchar(100) DEFAULT NULL,
  `series_volume` varchar(50) DEFAULT NULL,
  `series_volume_numeric` smallint(5) unsigned DEFAULT NULL,
  `series_issue` varchar(50) DEFAULT NULL,
  `issn` varchar(100) DEFAULT NULL,
  `isbn` varchar(100) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `summary_language` varchar(100) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `TYPE` varchar(100) DEFAULT NULL,
  `thesis` enum('Bachelor''s thesis','Honours thesis','Master''s thesis','Ph.D. thesis','Diploma thesis','Doctoral thesis','Habilitation thesis') DEFAULT NULL,
  `expedition` varchar(255) DEFAULT NULL,
  `doi` varchar(100) DEFAULT NULL,
  `conference` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `call_number` text,
  `location` text,
  `contribution_id` varchar(100) DEFAULT NULL,
  `online_publication` enum('no','yes') NOT NULL DEFAULT 'no',
  `online_citation` varchar(255) DEFAULT NULL,
  `FILE` varchar(255) DEFAULT NULL,
  `notes` text,
  `serial` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `orig_record` mediumint(9) DEFAULT NULL,
  `approved` enum('no','yes') NOT NULL DEFAULT 'no',
  `created_date` date DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_time` time DEFAULT NULL,
  `modified_by` varchar(100) DEFAULT NULL,
  `version` mediumint(8) unsigned DEFAULT '1',
  PRIMARY KEY (`serial`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `styles`
--

DROP TABLE IF EXISTS `styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `styles` (
  `style_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `style_name` varchar(100) DEFAULT NULL,
  `style_enabled` enum('true','false') NOT NULL DEFAULT 'true',
  `style_spec` varchar(255) DEFAULT NULL,
  `order_by` varchar(25) DEFAULT NULL,
  `depends_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`style_id`),
  KEY `style_name` (`style_name`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `type_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) DEFAULT NULL,
  `type_enabled` enum('true','false') NOT NULL DEFAULT 'true',
  `base_type_id` mediumint(8) unsigned DEFAULT NULL,
  `order_by` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`type_id`),
  KEY `type_name` (`type_name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_data`
--

DROP TABLE IF EXISTS `user_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_data` (
  `data_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `record_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `marked` enum('no','yes') NOT NULL DEFAULT 'no',
  `copy` enum('false','true','ordered','fetch') NOT NULL DEFAULT 'false',
  `selected` enum('no','yes') NOT NULL DEFAULT 'no',
  `user_keys` text,
  `user_notes` text,
  `user_file` varchar(255) DEFAULT NULL,
  `user_groups` text,
  `cite_key` varchar(255) DEFAULT NULL,
  `related` text,
  PRIMARY KEY (`data_id`),
  KEY `user_id` (`user_id`,`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_formats`
--

DROP TABLE IF EXISTS `user_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_formats` (
  `user_format_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `format_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `show_format` enum('true','false') NOT NULL DEFAULT 'true',
  PRIMARY KEY (`user_format_id`),
  KEY `format_id` (`format_id`,`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_options`
--

DROP TABLE IF EXISTS `user_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_options` (
  `option_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `export_cite_keys` enum('yes','no') NOT NULL DEFAULT 'yes',
  `autogenerate_cite_keys` enum('yes','no') NOT NULL DEFAULT 'yes',
  `prefer_autogenerated_cite_keys` enum('no','yes') NOT NULL DEFAULT 'no',
  `use_custom_cite_key_format` enum('no','yes') NOT NULL DEFAULT 'no',
  `cite_key_format` varchar(255) DEFAULT NULL,
  `uniquify_duplicate_cite_keys` enum('yes','no') NOT NULL DEFAULT 'yes',
  `nonascii_chars_in_cite_keys` enum('transliterate','strip','keep') DEFAULT NULL,
  `use_custom_text_citation_format` enum('no','yes') NOT NULL DEFAULT 'no',
  `text_citation_format` varchar(255) DEFAULT NULL,
  `records_per_page` smallint(5) unsigned DEFAULT NULL,
  `show_auto_completions` enum('yes','no') NOT NULL DEFAULT 'yes',
  `main_fields` text,
  PRIMARY KEY (`option_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_permissions`
--

DROP TABLE IF EXISTS `user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_permissions` (
  `user_permission_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allow_add` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_edit` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_delete` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_download` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_upload` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_list_view` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_details_view` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_print_view` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_browse_view` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_cite` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_import` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_batch_import` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_export` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_batch_export` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_user_groups` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_user_queries` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_rss_feeds` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_sql_search` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_modify_options` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_edit_call_number` enum('no','yes') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`user_permission_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_styles`
--

DROP TABLE IF EXISTS `user_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_styles` (
  `user_style_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `style_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `show_style` enum('true','false') NOT NULL DEFAULT 'true',
  PRIMARY KEY (`user_style_id`),
  KEY `style_id` (`style_id`,`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_types`
--

DROP TABLE IF EXISTS `user_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_types` (
  `user_type_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `show_type` enum('true','false') NOT NULL DEFAULT 'true',
  PRIMARY KEY (`user_type_id`),
  KEY `type_id` (`type_id`,`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `title` varchar(25) DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `abbrev_institution` varchar(25) DEFAULT NULL,
  `corporate_institution` varchar(255) DEFAULT NULL,
  `address_line_1` varchar(50) DEFAULT NULL,
  `address_line_2` varchar(50) DEFAULT NULL,
  `address_line_3` varchar(50) DEFAULT NULL,
  `zip_code` varchar(25) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `keywords` text,
  `notes` text,
  `last_login` datetime DEFAULT NULL,
  `logins` mediumint(8) unsigned DEFAULT NULL,
  `language` varchar(50) DEFAULT 'en',
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_groups` text,
  `marked` enum('no','yes') NOT NULL DEFAULT 'no',
  `created_date` date DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_time` time DEFAULT NULL,
  `modified_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'refbase'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-01 10:44:28
