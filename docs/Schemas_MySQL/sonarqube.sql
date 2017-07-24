-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: sonar
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
-- Table structure for table `action_plans`
--

DROP TABLE IF EXISTS `action_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action_plans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `user_login` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `kee` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `I_ACTION_PLANS_PROJECT_ID` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `active_dashboards`
--

DROP TABLE IF EXISTS `active_dashboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_dashboards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dashboard_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_index` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `active_dashboards_userid` (`user_id`),
  KEY `active_dashboards_dashboardid` (`dashboard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `active_rule_parameters`
--

DROP TABLE IF EXISTS `active_rule_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_rule_parameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active_rule_id` int(11) NOT NULL,
  `rules_parameter_id` int(11) NOT NULL,
  `value` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `rules_parameter_key` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `active_rules`
--

DROP TABLE IF EXISTS `active_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `rule_id` int(11) NOT NULL,
  `failure_level` int(11) NOT NULL,
  `inheritance` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_profile_rule_ids` (`profile_id`,`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `user_login` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `data_field` longtext COLLATE utf8_bin,
  `log_type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `log_action` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `log_message` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `log_key` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `activities_log_key` (`log_key`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analysis_reports`
--

DROP TABLE IF EXISTS `analysis_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analysis_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_key` varchar(400) COLLATE utf8_bin NOT NULL,
  `report_status` varchar(20) COLLATE utf8_bin NOT NULL,
  `project_name` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `created_at` bigint(20) DEFAULT NULL,
  `updated_at` bigint(20) DEFAULT NULL,
  `started_at` bigint(20) DEFAULT NULL,
  `finished_at` bigint(20) DEFAULT NULL,
  `uuid` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `login` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_author_logins` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `characteristics`
--

DROP TABLE IF EXISTS `characteristics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characteristics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kee` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `rule_id` int(11) DEFAULT NULL,
  `characteristic_order` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `function_key` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `factor_value` decimal(30,20) DEFAULT NULL,
  `factor_unit` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `offset_value` decimal(30,20) DEFAULT NULL,
  `offset_unit` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `characteristics_enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dashboards`
--

DROP TABLE IF EXISTS `dashboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `column_layout` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_global` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dependencies`
--

DROP TABLE IF EXISTS `dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependencies` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_snapshot_id` int(11) DEFAULT NULL,
  `from_resource_id` int(11) DEFAULT NULL,
  `to_snapshot_id` int(11) DEFAULT NULL,
  `to_resource_id` int(11) DEFAULT NULL,
  `dep_usage` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `dep_weight` int(11) DEFAULT NULL,
  `project_snapshot_id` int(11) DEFAULT NULL,
  `parent_dependency_id` bigint(20) DEFAULT NULL,
  `from_scope` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `to_scope` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deps_from_sid` (`from_snapshot_id`),
  KEY `deps_to_sid` (`to_snapshot_id`),
  KEY `deps_prj_sid` (`project_snapshot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `duplications_index`
--

DROP TABLE IF EXISTS `duplications_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duplications_index` (
  `project_snapshot_id` int(11) NOT NULL,
  `snapshot_id` int(11) NOT NULL,
  `hash` varchar(50) COLLATE utf8_bin NOT NULL,
  `index_in_file` int(11) NOT NULL,
  `start_line` int(11) NOT NULL,
  `end_line` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `duplications_index_psid` (`project_snapshot_id`),
  KEY `duplications_index_sid` (`snapshot_id`),
  KEY `duplications_index_hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) COLLATE utf8_bin DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `snapshot_id` int(11) DEFAULT NULL,
  `category` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `event_data` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `event_date` bigint(20) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `events_resource_id` (`resource_id`),
  KEY `events_snapshot_id` (`snapshot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file_sources`
--

DROP TABLE IF EXISTS `file_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_uuid` varchar(50) COLLATE utf8_bin NOT NULL,
  `file_uuid` varchar(50) COLLATE utf8_bin NOT NULL,
  `line_hashes` longtext COLLATE utf8_bin,
  `data_hash` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  `src_hash` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `binary_data` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_sources_file_uuid_uniq` (`file_uuid`),
  KEY `file_sources_project_uuid` (`project_uuid`),
  KEY `file_sources_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `graphs`
--

DROP TABLE IF EXISTS `graphs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graphs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `snapshot_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `format` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `perspective` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `version` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `root_vertex_id` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `data` longtext COLLATE utf8_bin,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `graphs_perspectives` (`snapshot_id`,`perspective`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_roles`
--

DROP TABLE IF EXISTS `group_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `role` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_group_roles` (`group_id`,`resource_id`,`role`),
  KEY `group_roles_group` (`group_id`),
  KEY `group_roles_resource` (`resource_id`),
  KEY `group_roles_role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `groups_users`
--

DROP TABLE IF EXISTS `groups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_users` (
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  UNIQUE KEY `GROUPS_USERS_UNIQUE` (`group_id`,`user_id`),
  KEY `index_groups_users_on_user_id` (`user_id`),
  KEY `index_groups_users_on_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_changes`
--

DROP TABLE IF EXISTS `issue_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_changes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kee` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `issue_key` varchar(50) COLLATE utf8_bin NOT NULL,
  `user_login` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `change_type` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `change_data` longtext COLLATE utf8_bin,
  `created_at` bigint(20) DEFAULT NULL,
  `updated_at` bigint(20) DEFAULT NULL,
  `issue_change_creation_date` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issue_changes_kee` (`kee`),
  KEY `issue_changes_issue_key` (`issue_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_filter_favourites`
--

DROP TABLE IF EXISTS `issue_filter_favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_filter_favourites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(255) COLLATE utf8_bin NOT NULL,
  `issue_filter_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issue_filter_favs_user` (`user_login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_filters`
--

DROP TABLE IF EXISTS `issue_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `user_login` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `shared` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `data` longtext COLLATE utf8_bin,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issue_filters_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kee` varchar(50) COLLATE utf8_bin NOT NULL,
  `rule_id` int(11) DEFAULT NULL,
  `severity` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `manual_severity` tinyint(1) NOT NULL,
  `message` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `line` int(11) DEFAULT NULL,
  `effort_to_fix` decimal(30,20) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `resolution` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `checksum` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `reporter` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assignee` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `author_login` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `action_plan_key` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `issue_attributes` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `technical_debt` int(11) DEFAULT NULL,
  `created_at` bigint(20) DEFAULT NULL,
  `updated_at` bigint(20) DEFAULT NULL,
  `issue_creation_date` bigint(20) DEFAULT NULL,
  `issue_update_date` bigint(20) DEFAULT NULL,
  `issue_close_date` bigint(20) DEFAULT NULL,
  `tags` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `component_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `project_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `issues_kee` (`kee`),
  KEY `issues_rule_id` (`rule_id`),
  KEY `issues_severity` (`severity`),
  KEY `issues_status` (`status`),
  KEY `issues_resolution` (`resolution`),
  KEY `issues_assignee` (`assignee`),
  KEY `issues_action_plan_key` (`action_plan_key`),
  KEY `issues_updated_at` (`updated_at`),
  KEY `issues_component_uuid` (`component_uuid`),
  KEY `issues_project_uuid` (`project_uuid`),
  KEY `issues_creation_date` (`issue_creation_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loaded_templates`
--

DROP TABLE IF EXISTS `loaded_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loaded_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kee` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `template_type` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manual_measures`
--

DROP TABLE IF EXISTS `manual_measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manual_measures` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `metric_id` int(11) NOT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `value` decimal(30,20) DEFAULT NULL,
  `text_value` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `user_login` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `created_at` bigint(20) DEFAULT NULL,
  `updated_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manual_measures_resource_id` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measure_filter_favourites`
--

DROP TABLE IF EXISTS `measure_filter_favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure_filter_favourites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `measure_filter_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `measure_filter_favs_userid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measure_filters`
--

DROP TABLE IF EXISTS `measure_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure_filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shared` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `data` longtext COLLATE utf8_bin,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `measure_filters_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metrics`
--

DROP TABLE IF EXISTS `metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `direction` int(11) NOT NULL DEFAULT '0',
  `domain` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `short_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `qualitative` tinyint(1) NOT NULL DEFAULT '0',
  `val_type` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `user_managed` tinyint(1) DEFAULT '0',
  `enabled` tinyint(1) DEFAULT '1',
  `origin` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `worst_value` decimal(30,20) DEFAULT NULL,
  `best_value` decimal(30,20) DEFAULT NULL,
  `optimized_best_value` tinyint(1) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `delete_historical_data` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `metrics_unique_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `perm_templates_groups`
--

DROP TABLE IF EXISTS `perm_templates_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perm_templates_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `template_id` int(11) NOT NULL,
  `permission_reference` varchar(64) COLLATE utf8_bin NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `perm_templates_users`
--

DROP TABLE IF EXISTS `perm_templates_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perm_templates_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `permission_reference` varchar(64) COLLATE utf8_bin NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permission_templates`
--

DROP TABLE IF EXISTS `permission_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `kee` varchar(100) COLLATE utf8_bin NOT NULL,
  `description` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `key_pattern` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_links`
--

DROP TABLE IF EXISTS `project_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `link_type` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `href` varchar(2048) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_measures`
--

DROP TABLE IF EXISTS `project_measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_measures` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` decimal(30,20) DEFAULT NULL,
  `metric_id` int(11) NOT NULL,
  `snapshot_id` int(11) DEFAULT NULL,
  `rule_id` int(11) DEFAULT NULL,
  `rules_category_id` int(11) DEFAULT NULL,
  `text_value` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `tendency` int(11) DEFAULT NULL,
  `measure_date` datetime DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `alert_status` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `alert_text` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `rule_priority` int(11) DEFAULT NULL,
  `characteristic_id` int(11) DEFAULT NULL,
  `variation_value_1` decimal(30,20) DEFAULT NULL,
  `variation_value_2` decimal(30,20) DEFAULT NULL,
  `variation_value_3` decimal(30,20) DEFAULT NULL,
  `variation_value_4` decimal(30,20) DEFAULT NULL,
  `variation_value_5` decimal(30,20) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `measure_data` longblob,
  PRIMARY KEY (`id`),
  KEY `measures_sid_metric` (`snapshot_id`,`metric_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `scope` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `qualifier` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `kee` varchar(400) COLLATE utf8_bin DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `language` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `copy_resource_id` int(11) DEFAULT NULL,
  `long_name` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `path` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `deprecated_kee` varchar(400) COLLATE utf8_bin DEFAULT NULL,
  `uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `project_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `module_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `module_uuid_path` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `authorization_updated_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projects_uuid` (`uuid`),
  KEY `projects_root_id` (`root_id`),
  KEY `projects_kee` (`kee`(255),`enabled`),
  KEY `projects_project_uuid` (`project_uuid`),
  KEY `projects_module_uuid` (`module_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prop_key` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `text_value` longtext COLLATE utf8_bin,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `properties_key` (`prop_key`(255))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quality_gate_conditions`
--

DROP TABLE IF EXISTS `quality_gate_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_gate_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qgate_id` int(11) DEFAULT NULL,
  `metric_id` int(11) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `operator` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `value_error` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `value_warning` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quality_gates`
--

DROP TABLE IF EXISTS `quality_gates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_gates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_quality_gates` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resource_index`
--

DROP TABLE IF EXISTS `resource_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kee` varchar(400) COLLATE utf8_bin NOT NULL,
  `position` int(11) NOT NULL,
  `name_size` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `root_project_id` int(11) NOT NULL,
  `qualifier` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resource_index_key` (`kee`(255)),
  KEY `resource_index_rid` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rules`
--

DROP TABLE IF EXISTS `rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_rule_key` varchar(200) COLLATE utf8_bin NOT NULL,
  `plugin_config_key` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `plugin_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` longtext COLLATE utf8_bin,
  `priority` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `language` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note_created_at` datetime DEFAULT NULL,
  `note_updated_at` datetime DEFAULT NULL,
  `note_user_login` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `note_data` longtext COLLATE utf8_bin,
  `characteristic_id` int(11) DEFAULT NULL,
  `default_characteristic_id` int(11) DEFAULT NULL,
  `remediation_function` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `default_remediation_function` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `remediation_coeff` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `default_remediation_coeff` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `remediation_offset` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `default_remediation_offset` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `effort_to_fix_description` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `tags` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `system_tags` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `description_format` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rules_repo_key` (`plugin_name`,`plugin_rule_key`)
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rules_parameters`
--

DROP TABLE IF EXISTS `rules_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rules_parameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `description` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `param_type` varchar(512) COLLATE utf8_bin NOT NULL,
  `default_value` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rules_parameters_rule_id` (`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rules_profiles`
--

DROP TABLE IF EXISTS `rules_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rules_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `language` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `kee` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent_kee` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `rules_updated_at` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_qprof_key` (`kee`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `semaphores`
--

DROP TABLE IF EXISTS `semaphores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semaphores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(4000) COLLATE utf8_bin NOT NULL,
  `checksum` varchar(200) COLLATE utf8_bin NOT NULL,
  `created_at` bigint(20) DEFAULT NULL,
  `updated_at` bigint(20) DEFAULT NULL,
  `locked_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_semaphore_checksums` (`checksum`),
  KEY `semaphore_names` (`name`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `snapshots`
--

DROP TABLE IF EXISTS `snapshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snapshots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `parent_snapshot_id` int(11) DEFAULT NULL,
  `status` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT 'U',
  `islast` tinyint(1) NOT NULL DEFAULT '0',
  `scope` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `qualifier` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `root_snapshot_id` int(11) DEFAULT NULL,
  `version` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `path` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `root_project_id` int(11) DEFAULT NULL,
  `period1_mode` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `period1_param` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `period2_mode` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `period2_param` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `period3_mode` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `period3_param` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `period4_mode` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `period4_param` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `period5_mode` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `period5_param` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `purge_status` int(11) DEFAULT NULL,
  `created_at` bigint(20) DEFAULT NULL,
  `build_date` bigint(20) DEFAULT NULL,
  `period1_date` bigint(20) DEFAULT NULL,
  `period2_date` bigint(20) DEFAULT NULL,
  `period3_date` bigint(20) DEFAULT NULL,
  `period4_date` bigint(20) DEFAULT NULL,
  `period5_date` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `snapshot_project_id` (`project_id`),
  KEY `snapshots_parent` (`parent_snapshot_id`),
  KEY `snapshots_root` (`root_snapshot_id`),
  KEY `snapshots_qualifier` (`qualifier`),
  KEY `snapshots_root_project_id` (`root_project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `role` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_roles_user` (`user_id`),
  KEY `user_roles_resource` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `crypted_password` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `salt` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `remember_token` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `remember_token_expires_at` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` bigint(20) DEFAULT NULL,
  `updated_at` bigint(20) DEFAULT NULL,
  `scm_accounts` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_login` (`login`),
  KEY `users_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget_properties`
--

DROP TABLE IF EXISTS `widget_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `widget_id` int(11) NOT NULL,
  `kee` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `text_value` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `widget_properties_widgets` (`widget_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dashboard_id` int(11) NOT NULL,
  `widget_key` varchar(256) COLLATE utf8_bin NOT NULL,
  `name` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `column_index` int(11) DEFAULT NULL,
  `row_index` int(11) DEFAULT NULL,
  `configured` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `widgets_dashboards` (`dashboard_id`),
  KEY `widgets_widgetkey` (`widget_key`(255))
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-30 16:48:33
