# PHP Redirect Method

A simple PHP script to detect and redirect Russian traffic.

## Prerequisites
- A PHP-enabled web server.
- Traffic passing through Cloudflare (recommended) OR PHP GeoIP extension installed.

## Installation
1. Place the code from `redirect.php` at the very top of your main `index.php` or `header.php` file, before any HTML is sent to the browser.

## Quick Install via curl
Run this in your terminal to automatically prepend the redirect logic to your `index.php`:
```bash
curl -sSL https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/russian-redirect-action/main/php/install.sh | bash -s /path/to/your/index.php
```

## Uninstall via curl
Run this to safely remove the PHP logic from your index file:
```bash
curl -sSL https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/russian-redirect-action/main/php/uninstall.sh | bash -s /path/to/your/index.php
```
