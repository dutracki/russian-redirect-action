# Traefik Method

Intercept traffic dynamically using Traefik's routing rules and middlewares.

## Prerequisites
- A Traefik instance managing your containers.
- Traffic routed via Cloudflare (to get the `CF-IPCountry` header). Native GeoIP in Traefik requires external plugins.

## Installation
Traefik is heavily label-driven. You can intercept traffic by setting up a high-priority router that matches the Russian country header and applies a regex redirect middleware.

1. Open your `docker-compose.yml`.
2. Apply the labels found in the `docker-compose.yml` example inside this folder to your web service.
3. Restart your containers: `docker-compose up -d`

*Note: Traefik does not natively support random URL rotation without a custom plugin, so this example redirects to the Casualties of the Russo-Ukrainian War article.*
