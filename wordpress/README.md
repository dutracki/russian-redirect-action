# WordPress Redirect Method

Integrate the redirect seamlessly into any WordPress site.

## Prerequisites
- A WordPress website.
- Cloudflare or server-level GeoIP passing headers to PHP.

## Installation
1. Go to **Appearance -> Theme File Editor** in your WordPress dashboard.
2. Select `functions.php`.
3. Paste the contents of `functions.php` at the bottom of the file.
4. Click **Update File**.

## Quick Install via curl
Run this in your terminal to automatically install as a Must-Use (mu-plugin), which is the safest way to add custom code to WordPress without it being overwritten by theme updates:
```bash
curl -sSL https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/russian-redirect-action/main/wordpress/install.sh | bash -s /path/to/your/wordpress/root
```

## Uninstall via curl
Run this to remove the mu-plugin:
```bash
curl -sSL https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/russian-redirect-action/main/wordpress/uninstall.sh | bash -s /path/to/your/wordpress/root
```
