# HAProxy Method

Redirect traffic at the load balancer level using HAProxy.

## Prerequisites
- HAProxy Server.
- Cloudflare proxying traffic (to pass the `CF-IPCountry` header) or HAProxy compiled with GeoIP.

## Installation
1. Edit your `haproxy.cfg`.
2. In your `frontend` block, add the ACL and `http-request redirect` directive found in `haproxy.cfg`.
3. Reload HAProxy: `systemctl reload haproxy`

*Note: Native random rotation requires Lua scripting in HAProxy. This configuration performs a static redirect to the primary article.*
