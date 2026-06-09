# Netlify Edge Functions

Redirect users directly on Netlify's Edge network.

## Prerequisites
- A site hosted on Netlify.

## Installation
1. Create a `netlify/edge-functions/ru-redirect.js` file in your repository.
2. Paste the contents of `edge-function.js`.
3. Add the edge function to your `netlify.toml`:
   ```toml
   [[edge_functions]]
   path = "/*"
   function = "ru-redirect"
   ```
4. Deploy your site.
