-- Create minimum required tables for Magento to recognize a website
-- This solves the chicken-and-egg problem where setup:install needs a website to load config

-- Create store_website table
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

-- Create store_group table
CREATE TABLE IF NOT EXISTS `store_group` (
  `group_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `website_id` smallint unsigned NOT NULL DEFAULT 0,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `root_category_id` int unsigned NOT NULL DEFAULT 0,
  `default_store_id` smallint unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `STORE_GROUP_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create store table
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

-- Insert default website
INSERT IGNORE INTO `store_website` (`website_id`, `code`, `name`, `sort_order`, `default_group_id`, `is_default`)
VALUES (1, 'base', 'Base Website', 0, 1, 1);

-- Insert default store group
INSERT IGNORE INTO `store_group` (`group_id`, `website_id`, `code`, `name`, `root_category_id`, `default_store_id`)
VALUES (1, 1, 'default', 'Default Store Group', 2, 1);

-- Insert default store
INSERT IGNORE INTO `store` (`store_id`, `code`, `website_id`, `group_id`, `name`, `sort_order`, `is_active`)
VALUES (1, 'default', 1, 1, 'Default Store', 0, 1);

-- Insert admin store (required by Magento)
INSERT IGNORE INTO `store` (`store_id`, `code`, `website_id`, `group_id`, `name`, `sort_order`, `is_active`)
VALUES (0, 'admin', 0, 0, 'Admin', 0, 1);

