# 🛑 Russian Traffic Redirect & Awareness

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://vshymanskyy.github.io/StandWithUkraine/)

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
1. **[NGINX](nginx/)**: Direct server-level redirect using `split_clients` for randomization.
2. **[Apache](apache/)**: Shared hosting `.htaccess` rewrite rules.
3. **[Caddy](caddy/)**: Interception at the Caddyfile level.
4. **[Microsoft IIS](iis/)**: Windows Server redirect using URL Rewrite.

### Load Balancers & Caching
5. **[HAProxy](haproxy/)**: Frontend redirection logic.
6. **[Varnish Cache](varnish/)**: Synthetic HTTP response redirection.

### Cloud Providers & CDNs
7. **[Cloudflare Workers](cloudflare/)**: The fastest edge-compute method (Recommended).
8. **[AWS CloudFront](aws-cloudfront/)**: Redirection using CloudFront Functions.
9. **[Vercel](vercel/)**: Next.js Edge Middleware interceptor.
10. **[Netlify](netlify/)**: Deno-based Edge Functions.
11. **[Fastly](fastly/)**: Interception using VCL (Varnish Configuration Language).

### Application Code (Backend)
12. **[PHP](php/)**: Native PHP headers redirection.
13. **[WordPress](wordpress/)**: Seamless integration via `functions.php`.
14. **[Express.js / Node.js](expressjs/)**: Express middleware for Node applications.

### Client-Side
15. **[JavaScript](javascript/)**: Drop-in `<script>` tags for when you don't have server access.
    - **Shadow Prefetch**: Loads articles silently in the background.
    - **Hard Redirect**: Forces browser redirection.

### Bots & Crawlers
16. **[robots.txt](robots.txt)**: Block Russian state-owned search engines (Yandex, Mail.Ru) from crawling your site.

---

## 🇺🇦 Support Ukraine (Donate)

If you found this repository helpful, please consider supporting the people of Ukraine directly. They are defending their homes, their freedom, and democratic values.

* **[United24](https://u24.gov.ua/)** - The official fundraising platform of Ukraine.
* **[Come Back Alive](https://savelife.in.ua/en/donate-en/)** - The largest foundation providing competent assistance to the defenders of Ukraine.
* **[Hospitallers](https://www.hospitallers.life/)** - Medical battalion working directly on the frontline.

---

## 🤝 Contributing
Contributions are highly welcome. If you have configurations for other web servers (e.g., Traefik, Lighttpd, etc.) or improvements to the current rotation logic, please open a Pull Request.

## ⚖️ License
This project is open-source and dedicated to the public domain. Use it, share it, modify it.
