# Microsoft IIS Method

Redirect traffic using the IIS URL Rewrite Module.

## Prerequisites
- Microsoft IIS Server.
- IIS URL Rewrite Module installed.
- Traffic routed through Cloudflare (to get the `HTTP_CF_IPCountry` header).

## Installation
1. Open your site's `web.config` file.
2. Add the `<rewrite>` rule block provided in `web.config`.
3. Save the file. IIS will automatically apply the changes.

*Note: Rotating URLs directly within standard IIS rewrite rules is difficult without writing custom rewrite providers. This example redirects to the main Wikipedia article.*
