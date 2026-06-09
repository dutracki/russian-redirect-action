# Caddy Redirect Method

This method uses Caddy server to intercept traffic from Russia.

## Prerequisites
- Caddy Web Server.
- Cloudflare in front of your Caddy server (for the `CF-IPCountry` header), OR a GeoIP plugin for Caddy.

## Installation
1. Add the block from `Caddyfile` into your existing `Caddyfile` configuration.
2. Reload Caddy: `caddy reload`
