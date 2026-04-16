# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

[Unreleased]: https://gitlab.hyva.io/hyva-themes/magento2-heroicons2/-/compare/2.0.0...main

## [2.0.0] - 2026-04-08

[2.0.0]: https://gitlab.hyva.io/hyva-themes/magento2-heroicons2/-/compare/1.0.1...2.0.0

This release treats the module as a standalone icon pack rather than a drop-in replacement for Heroicons v1. Since LucideIcons is now the default icon set in Hyvä Themes, there is no longer a need to maintain backwards compatibility with Heroicons v1 names. Several breaking changes are included. See the migration notes below.

### Changed
- SVG folder structure flattened. The size segment has been removed from all paths: `heroicons2/solid` and `heroicons2/outline` replace the old `heroicons2/24/solid` and `heroicons2/24/outline`. Update any `{{icon}}` directives and `renderHtml()` calls referencing the old paths accordingly
- Heroicons updated from 2.0 to 2.2. Icons are now downloaded directly from the `heroicons` npm package during the build, rather than being committed manually
- Build tooling replaced: `generate-heroicon-signatures.sh` and `generate-compat-functions.sh` are replaced by a single `bin/generate-icons-signatures` PHP script, consistent with the approach used in other Hyvä icon packs

### Removed
- `Heroicons2Mini` ViewModel. The mini set is identical in design to solid, just drawn on a smaller canvas. Replace any `$viewModels->require(Heroicons2Mini::class)` with `$viewModels->require(Heroicons2Solid::class)` and pass the desired size via `$width` and `$height`, for example `shoppingCartHtml('', 20, 20)`
- `Heroicons2Base` abstract base class. `Heroicons2Solid` and `Heroicons2Outline` now extend `SvgIcons` directly
- `HeroiconsCompat` trait and all deprecated Heroicons v1 icon name aliases. Any calls using old v1 names such as `adjustmentsHtml()` or `mailHtml()` must be updated to their v2 equivalents

## [1.0.1] - 2024-06-18

[1.0.1]: https://gitlab.hyva.io/hyva-themes/magento2-heroicons2/-/compare/1.0.0...1.0.1

### Fixed
- Move di.xml to global scope so they work in adminhtml CMS content previews

## 1.0.0 - 2023-02-16

Initial release
