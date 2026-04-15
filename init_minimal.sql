-- Minimal store setup JUST to allow setup:install to proceed
-- Without foreign key constraints to avoid issues during patch application

SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE IF NOT EXISTS `store_website` (
  `website_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sort_order` smallint NOT NULL DEFAULT 0,
  `default_group_id` smallint unsigned NOT NULL DEFAULT 0,
  `is_default` smallint unsigned DEFAULT 0,
  PRIMARY KEY (`website_id`),
  UNIQUE KEY `STORE_WEBSITE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `store_group` (
  `group_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `website_id` smallint unsigned NOT NULL DEFAULT 0,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `root_category_id` int unsigned NOT NULL DEFAULT 0,
  `default_store_id` smallint unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `store` (
  `store_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) DEFAULT NULL,
  `website_id` smallint unsigned NOT NULL DEFAULT 0,
  `group_id` smallint unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `sort_order` smallint unsigned NOT NULL DEFAULT 0,
  `is_active` smallint unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `STORE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS=1;

