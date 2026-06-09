# Express.js / Node.js Method

An Express.js middleware to redirect Russian traffic.

## Prerequisites
- A Node.js application running Express.
- Application must be behind Cloudflare or another proxy that injects GeoIP headers.

## Installation
1. Copy `middleware.js` to your project.
2. In your main app file (e.g., `app.js` or `index.js`), use the middleware before your routes:
   ```javascript
   const ruRedirect = require('./middleware');
   app.use(ruRedirect);
   ```
