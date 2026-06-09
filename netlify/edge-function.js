// netlify/edge-function.js
const WIKI_URLS = [
  "https://en.wikipedia.org/wiki/War_crimes_in_the_Russo-Ukrainian_war_(2022%E2%80%93present)",
  "https://en.wikipedia.org/wiki/Russian_war_crimes",
  "https://en.wikipedia.org/wiki/Atrocity_crimes_during_the_Russo-Ukrainian_war",
  "https://en.wikipedia.org/wiki/Bucha_massacre",
    "https://en.wikipedia.org/wiki/Casualties_of_the_Russo-Ukrainian_War",
    "https://en.wikipedia.org/wiki/Russian_attacks_on_civilians_in_the_Russo-Ukrainian_war_(2022%E2%80%93present)"
];

export default async (request, context) => {
  if (context.geo.country?.code === 'RU') {
    const randomUrl = WIKI_URLS[Math.floor(Math.random() * WIKI_URLS.length)];
    return Response.redirect(randomUrl, 302);
  }
};