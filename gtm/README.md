# Google Tag Manager (GTM) Method

If you use Google Tag Manager to manage scripts on your website, you can easily deploy the shadow prefetch or redirect logic as a Custom HTML Tag. This requires no direct code changes to your website.

## Prerequisites
- A Google Tag Manager container installed on your website.

## Installation
1. Go to your [Google Tag Manager Workspace](https://tagmanager.google.com/).
2. Click on **Tags** in the left sidebar, then click **New**.
3. Name your tag (e.g., `RU Shadow Prefetch`).
4. Click **Tag Configuration** and select **Custom HTML**.
5. Copy the contents of `tag.html` from this folder and paste it into the HTML box.
    * *(Optional: If you want to hard-redirect users instead of shadow-prefetching, change `doShadowPrefetch();` inside the script to `window.location.replace(randomUrl);`)*
6. Click **Triggering** and select **All Pages** (or specific pages where you want this to run).
7. Save the tag.
8. Click **Submit** and **Publish** your workspace changes.
