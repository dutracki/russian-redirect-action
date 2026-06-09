// expressjs/middleware.js
const wikiUrls = [
  "https://en.wikipedia.org/wiki/War_crimes_in_the_Russo-Ukrainian_war_(2022%E2%80%93present)",
  "https://en.wikipedia.org/wiki/Russian_war_crimes",
  "https://en.wikipedia.org/wiki/Atrocity_crimes_during_the_Russo-Ukrainian_war",
  "https://en.wikipedia.org/wiki/Bucha_massacre"
];

function ruRedirectMiddleware(req, res, next) {
  // Check Cloudflare header or other reverse proxy GeoIP headers
  const country = req.headers['cf-ipcountry'] || req.headers['x-geoip-country'];

  if (country === 'RU') {
    const randomUrl = wikiUrls[Math.floor(Math.random() * wikiUrls.length)];
    return res.redirect(302, randomUrl);
  }
  next();
}

module.exports = ruRedirectMiddleware;