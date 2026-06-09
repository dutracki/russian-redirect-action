# NGINX Redirect Method

This method uses Nginx's GeoIP module to redirect traffic from Russia.

## Prerequisites
- Nginx installed.
- `ngx_http_geoip_module` or `geoip2` module enabled.
- A valid GeoIP database (like MaxMind).

## Installation
1. Copy the contents of `redirect.conf` into your Nginx server block.
2. Ensure your GeoIP database is loaded in the `http {}` block:
   ```nginx
   geoip_country /usr/share/GeoIP/GeoIP.dat;
   ```
3. Test your configuration: `nginx -t`
4. Reload Nginx: `systemctl reload nginx`

## Quick Install via curl
Run this in your terminal to automatically install the configuration (requires sudo):
```bash
curl -sSL https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/russian-redirect-action/main/nginx/install.sh | sudo bash
```

## Uninstall via curl
Run this to remove the configuration (requires sudo):
```bash
curl -sSL https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/russian-redirect-action/main/nginx/uninstall.sh | sudo bash
```
