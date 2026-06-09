# Varnish Cache Method

Intercept traffic before it hits your backend using Varnish Cache.

## Prerequisites
- Varnish Cache installed.
- Traffic routed via Cloudflare (for the `CF-IPCountry` header). Alternatively, use the `vmod_geoip` module.

## Installation
1. Edit your Varnish configuration file (usually `default.vcl`).
2. Add the interception logic to `vcl_recv`.
3. Add the redirect handler to `vcl_synth`.
4. Reload Varnish: `systemctl reload varnish`
