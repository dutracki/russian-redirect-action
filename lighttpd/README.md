# Lighttpd Method

Use Lighttpd's `mod_geoip` and `mod_redirect` to block and redirect traffic.

## Prerequisites
- Lighttpd Web Server.
- `mod_geoip` and `mod_redirect` enabled.
- A valid MaxMind GeoIP legacy database installed.

## Installation
1. Edit your `lighttpd.conf` (usually located at `/etc/lighttpd/lighttpd.conf`).
2. Ensure the modules are loaded.
3. Paste the configuration block from `lighttpd.conf`.
4. Test configuration: `lighttpd -t -f /etc/lighttpd/lighttpd.conf`
5. Restart the server: `systemctl restart lighttpd`

*Note: Native random rotation requires external scripting in Lighttpd. This configuration performs a static redirect to the primary article.*
