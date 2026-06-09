# JavaScript Methods

Client-side JavaScript methods are the easiest to implement if you don't have access to your server's configuration.

## Methods Available
1. **`shadow-prefetch.js`**: Invisibly loads the Wikipedia articles into the user's browser cache without interrupting their browsing.
2. **`redirect.js`**: Forces the browser to immediately redirect to the Wikipedia article.

## Installation
Add the contents of your chosen script inside a `<script>` tag in the `<head>` of your HTML document:

```html
<head>
    <!-- Your other head elements -->
    <script>
        // Paste the contents of shadow-prefetch.js or redirect.js here
    </script>
</head>
```

## Quick Install via curl (HTML injection)
Run this in your terminal to automatically inject the script into your HTML file:
```bash
curl -sSL https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/russian-redirect-action/main/javascript/install.sh | bash -s /path/to/index.html
```

## Uninstall via curl
Run this to remove the injected script tag from your HTML file:
```bash
curl -sSL https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/russian-redirect-action/main/javascript/uninstall.sh | bash -s /path/to/index.html
```
