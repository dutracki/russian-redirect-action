// vercel/middleware.js
import { NextResponse } from 'next/server';

const WIKI_URLS = [
  "https://en.wikipedia.org/wiki/War_crimes_in_the_Russo-Ukrainian_war_(2022%E2%80%93present)",
  "https://en.wikipedia.org/wiki/Russian_war_crimes",
  "https://en.wikipedia.org/wiki/Atrocity_crimes_during_the_Russo-Ukrainian_war",
  "https://en.wikipedia.org/wiki/Bucha_massacre"
];

export function middleware(req) {
  if (req.geo?.country === 'RU') {
    const randomUrl = WIKI_URLS[Math.floor(Math.random() * WIKI_URLS.length)];
    return NextResponse.redirect(randomUrl);
  }
  return NextResponse.next();
}