-- Create website (default)
INSERT INTO store_website (website_id, code, name, sort_order, default_group_id, is_default)
VALUES (1, 'base', 'Base Website', 0, 1, 1)
ON DUPLICATE KEY UPDATE
  code='base',
  name='Base Website',
  is_default=1;

-- Create store group
INSERT INTO store_group (group_id, website_id, name, root_category_id, default_store_id, code)
VALUES (1, 1, 'Default Store Group', 2, 1, 'main_group')
ON DUPLICATE KEY UPDATE
  website_id=1,
  name='Default Store Group',
  root_category_id=2;

-- Create store (default)
INSERT INTO store (store_id, code, website_id, group_id, name, sort_order, is_active)
VALUES (1, 'default', 1, 1, 'Default Store', 0, 1)
ON DUPLICATE KEY UPDATE
  code='default',
  website_id=1,
  group_id=1,
  is_active=1;

-- Update website
INSERT INTO store_website (website_id, code, name, sort_order, default_group_id, is_default)
VALUES (0, 'admin', 'Admin', 0, NULL, 0)
ON DUPLICATE KEY UPDATE code='admin';

-- Update store group to point to correct store
UPDATE store_group SET default_store_id = 1 WHERE group_id = 1;

