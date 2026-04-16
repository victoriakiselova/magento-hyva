# Hyvä Themes - Heroicons 2

[![Hyva Supported Versions](https://img.shields.io/badge/Hyv%C3%A4->=1.1.12-0A23B9?style=for-the-badge&labelColor=0A144B)](https://docs.hyva.io/)
[![Go to the Hyvä Docs](https://img.shields.io/badge/Read_the_Docs-109c85?style=for-the-badge&cacheSeconds=32000000)](https://docs.hyva.io/hyva-themes/view-utilities/hyva-svg-icon-modules/index.html)

## Installation

Install the package via:

```sh
composer require hyva-themes/magento2-heroicons2
bin/magento setup:upgrade
```

<details><summary>Installation guide for GitLab access (contributions)</summary>

```sh
composer config repositories.hyva-themes/magento2-heroicons2 git git@gitlab.hyva.io:hyva-themes/magento2-heroicons2.git
composer require hyva-themes/magento2-heroicons2:dev-main
bin/magento setup:upgrade
```

</details>

## How to use

There are two icon variants: **Solid** and **Outline**, available as `Heroicons2Solid` and `Heroicons2Outline` in the `Hyva\Heroicons2\ViewModel` namespace.

Usage example in a phtml file:

```php
<?php

use Hyva\Theme\Model\ViewModelRegistry;
use Hyva\Heroicons2\ViewModel\Heroicons2Outline;

/** @var ViewModelRegistry $viewModels */

/** @var Heroicons2Outline $heroicons */
$heroicons = $viewModels->require(Heroicons2Outline::class);
```

Then render an icon anywhere in your template:

```php
<?= $heroicons->shoppingCartHtml('', 24, 24) ?>
```

The full method signature is:

```php
iconNameHtml(string $classnames = '', ?int $width = 24, ?int $height = 24, array $attributes = []): string
```

All available icon methods are listed in `src/ViewModel/Heroicons2Interface.php` and will also autocomplete in your editor.

### No mini or micro variant

Heroicons ships multiple size variants (24px, 20px, 16px), but the smaller sizes are identical in design to the solid set, just drawn on a smaller canvas. Rather than providing separate ViewModels for each size, use the `$width` and `$height` parameters to control the rendered dimensions.

```php
<?= $heroicons->shoppingCartHtml('', 20, 20) ?>
```

### Using SVG icons in CMS content

The icons can also be rendered in CMS content using the `{{icon}}` directive. Find the path of the SVG inside `view/frontend/web/svg`, and remove the `.svg` at the end.

For instance, `view/frontend/web/svg/heroicons2/solid/shopping-cart.svg` can be used as `heroicons2/solid/shopping-cart`.

Usage example in CMS pages:

```html
{{icon "heroicons2/solid/shopping-cart" width=24 height=24}}
```

### Extend and Customization

Please refer to the Hyvä Docs for information about SvgIcon usage in Hyvä Themes: https://docs.hyva.io/hyva-themes/writing-code/working-with-view-models/svgicons.html

## Other Icon packs

For more icon packs see our [Hyvä docs](https://docs.hyva.io/hyva-themes/view-utilities/hyva-svg-icon-modules.html) page or the [github topic #hyva-icons](https://github.com/topics/hyva-icons)

## Icon License

The [Heroicons](https://github.com/tailwindlabs/heroicons) used in this module were created by Tailwind Labs and are licensed under the MIT License.

## License

Hyvä Themes - https://hyva.io

Copyright © Hyvä Themes B.V 2020-present. All rights reserved.

This product is licensed per Magento install. Please see [License File](LICENSE.md) for more information.
