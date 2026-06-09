# AWS CloudFront Function

Use AWS CloudFront Functions to redirect traffic at the edge.

## Prerequisites
- An AWS account using CloudFront for CDN.

## Installation
1. Go to the AWS Console -> CloudFront.
2. Under **Functions**, click **Create function**.
3. Name it (e.g., `RURedirect`).
4. Paste the code from `function.js` into the editor.
5. Click **Save changes** and then **Publish function**.
6. Associate it with your CloudFront distribution's cache behavior on `Viewer Request`.
