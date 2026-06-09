# 🛑 Russian Traffic Redirect & Awareness

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://vshymanskyy.github.io/StandWithUkraine/)
[![License: Unlicense](https://img.shields.io/badge/license-Unlicense-blue.svg)](http://unlicense.org/)

A collection of plug-and-play scripts, code snippets, and server configurations designed for website owners to automatically redirect traffic originating from Russia to Wikipedia articles detailing the truth about the Russian war crimes in Ukraine.

In an environment where the Russian internet is heavily censored, this repository provides tools to bypass state propaganda. You can choose to **hard redirect** users, or perform a **shadow prefetch**—silently loading these articles into the user's browser cache while they browse your site.

## 🎯 The Goal

Every visit from a Russian IP address rotates through a curated list of educational, uncensored Wikipedia pages. The goal is to provide crucial awareness regarding:
- The [War Crimes in the Russo-Ukrainian War](https://en.wikipedia.org/wiki/War_crimes_in_the_Russo-Ukrainian_war_(2022%E2%80%93present))
- The [Bucha Massacre](https://en.wikipedia.org/wiki/Bucha_massacre)
- The [Siege of Mariupol](https://en.wikipedia.org/wiki/Siege_of_Mariupol)
- The [Casualties of the Russo-Ukrainian War](https://en.wikipedia.org/wiki/Casualties_of_the_Russo-Ukrainian_War)
- The [Attacks on Civilians](https://en.wikipedia.org/wiki/Russian_attacks_on_civilians_in_the_Russo-Ukrainian_war_(2022%E2%80%93present))
- The [Child Abductions](https://en.wikipedia.org/wiki/Child_abductions_in_the_Russo-Ukrainian_war)

---

## 🛠️ Implementation Methods

We have compiled configurations covering over 90% of the internet's tech stack. Choose the method that fits your environment. Click on each link to view detailed installation instructions and the source code.

### Web Servers
- **[NGINX](nginx/)**: Direct server-level redirect using `split_clients` for randomization.
- **[Apache](apache/)**: Shared hosting `.htaccess` rewrite rules.
- **[Caddy](caddy/)**: Interception at the Caddyfile level.
- **[Microsoft IIS](iis/)**: Windows Server redirect using URL Rewrite.
- **[Lighttpd](lighttpd/)**: Redirection utilizing `mod_geoip`.

### Load Balancers & Caching
- **[HAProxy](haproxy/)**: Frontend redirection logic.
- **[Varnish Cache](varnish/)**: Synthetic HTTP response redirection.
- **[Traefik](traefik/)**: High-priority router interception via Docker labels.

### Cloud Providers & CDNs
- **[Cloudflare Workers](cloudflare/)**: The fastest edge-compute method (Recommended).
- **[AWS CloudFront](aws-cloudfront/)**: Redirection using CloudFront Functions.
- **[Vercel](vercel/)**: Next.js Edge Middleware interceptor.
- **[Netlify](netlify/)**: Deno-based Edge Functions.
- **[Fastly](fastly/)**: Interception using VCL (Varnish Configuration Language).

### Application Code (Backend)
- **[PHP](php/)**: Native PHP headers redirection.
- **[WordPress](wordpress/)**: Seamless integration via `functions.php`.
- **[Express.js / Node.js](expressjs/)**: Express middleware for Node applications.

### Client-Side
- **[Google Tag Manager](gtm/)**: Custom HTML Tag to run scripts via GTM without editing code.
- **[JavaScript](javascript/)**: Drop-in `<script>` tags for when you don't have server access.
  - **Shadow Prefetch**: Loads articles silently in the background.
  - **Hard Redirect**: Forces browser redirection.

### Bots & Crawlers
- **[robots.txt](robots.txt)**: Block Russian state-owned search engines (Yandex, Mail.Ru) from crawling your site.

---

## 🇺🇦 Support Ukraine (Donate)

If you found this repository helpful, please consider supporting the people of Ukraine directly. They are defending their homes, their freedom, and democratic values.

* **[United24](https://u24.gov.ua/)** - The official fundraising platform of Ukraine.
* **[Come Back Alive](https://savelife.in.ua/en/donate-en/)** - The largest foundation providing competent assistance to the defenders of Ukraine.
* **[Hospitallers](https://www.hospitallers.life/)** - Medical battalion working directly on the frontline.

---

## 🤝 Contributing
Contributions are highly welcome. If you have configurations for other web servers or improvements to the current rotation logic, please open a Pull Request.

## ⚖️ License
This project is open-source and dedicated to the public domain. Use it, share it, modify it.

---

### 🍺 Support the Developer
If you appreciate the time put into building this collection, feel free to **[Buy Me a Beer 🍻](https://www.buymeacoffee.com/)**!

<br>
<div align="center">
  <em>Supported by <strong><a href="https://digitaly.site">digitaly.site</a></strong></em>
</div>
