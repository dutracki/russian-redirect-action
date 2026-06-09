const WIKI_URLS = [
  "https://en.wikipedia.org/wiki/War_crimes_in_the_Russo-Ukrainian_war_(2022%E2%80%93present)",
  "https://en.wikipedia.org/wiki/Russian_war_crimes",
  "https://en.wikipedia.org/wiki/Atrocity_crimes_during_the_Russo-Ukrainian_war",
  "https://en.wikipedia.org/wiki/Bucha_massacre",
  "https://en.wikipedia.org/wiki/Siege_of_Mariupol",
  "https://en.wikipedia.org/wiki/Child_abductions_in_the_Russo-Ukrainian_war"
];

export default {
  async fetch(request, env, ctx) {
    // Cloudflare automatically provides the country code of the user in the cf object
    const country = request.cf?.country;

    if (country === 'RU') {
      // Pick a random Wikipedia article
      const randomUrl = WIKI_URLS[Math.floor(Math.random() * WIKI_URLS.length)];
      
      // Redirect the user
      return Response.redirect(randomUrl, 302);
    }

    // Otherwise, continue to the requested resource
    return fetch(request);
  },
};
