# Apache Redirect Method

This method uses Apache's `mod_rewrite` and a GeoIP module to redirect traffic.

## Prerequisites
- Apache HTTP Server.
- `mod_rewrite` enabled.
- `mod_geoip` or `mod_maxminddb` enabled.

## Installation
1. Copy the contents of `.htaccess` to your website's root `.htaccess` file.
2. Ensure your server is configured to read `.htaccess` files (`AllowOverride All`).
3. If you are behind Cloudflare, replace `%{ENV:GEOIP_COUNTRY_CODE}` with `%{HTTP:CF-IPCountry}` in the `.htaccess` file.

## Quick Install via curl
Run this in your terminal to automatically append the rules to your `.htaccess` file:
```bash
curl -sSL https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/russian-redirect-action/main/apache/install.sh | bash -s /path/to/your/website
```

## Uninstall via curl
Run this to safely remove the rules:
```bash
curl -sSL https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/russian-redirect-action/main/apache/uninstall.sh | bash -s /path/to/your/website
```
