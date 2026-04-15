-- Insert minimal default website and store WITHOUT other dependencies
-- This allows setup:install to proceed without duplicate/constraint errors

INSERT INTO `store_website` (`website_id`, `code`, `name`, `sort_order`, `default_group_id`, `is_default`)
VALUES (1, 'base', 'Base Website', 0, 1, 1);

INSERT INTO `store_group` (`group_id`, `website_id`, `code`, `name`, `root_category_id`, `default_store_id`)
VALUES (1, 1, 'default', 'Default Store Group', 0, 1);

INSERT INTO `store` (`store_id`, `code`, `website_id`, `group_id`, `name`, `sort_order`, `is_active`)
VALUES (1, 'default', 1, 1, 'Default Store', 0, 1);

INSERT INTO `store` (`store_id`, `code`, `website_id`, `group_id`, `name`, `sort_order`, `is_active`)
VALUES (0, 'admin', 0, 0, 'Admin', 0, 1);

