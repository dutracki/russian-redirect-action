# Cloudflare Worker Redirect Method

Cloudflare Workers intercept requests at the edge, making this one of the most effective and difficult-to-bypass methods.

## Prerequisites
- A domain proxied through Cloudflare.
- A Cloudflare account with Workers enabled.

## Installation
1. Go to your Cloudflare Dashboard -> **Workers & Pages**.
2. Click **Create Worker**.
3. Name your worker (e.g., `ru-redirect`).
4. Replace the default code with the contents of `worker.js`.
5. Click **Deploy**.
6. Go to your domain in Cloudflare -> **Workers Routes** -> **Add Route**.
7. Set the route to `*yourdomain.com/*` and select your new worker.
