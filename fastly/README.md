# Fastly VCL Method

Use Fastly's edge network and VCL (Varnish Configuration Language) to redirect traffic.

## Prerequisites
- A Fastly CDN account.

## Installation
1. In your Fastly service, edit your VCL.
2. Add the `if (client.geo.country_code == "RU")` block from `vcl_recv.vcl` into your `vcl_recv` subroutine.
3. Add the `vcl_error` block handling into your `vcl_error` subroutine to perform the HTTP 302 redirect.
4. Activate the new VCL version.
